PACKAGE := duplicacy

# Generates the package filename from the nuspec file
VERSION := $(shell sed -n 's:.*<version>\(.*\)</version>.*:\1:p' $(PACKAGE).nuspec)
NUPKG   := $(PACKAGE).$(VERSION).nupkg

SOURCE  := https://push.chocolatey.org/

# Upstream release to package, e.g. `make bump V=3.4.0`
REPO    := gilbertchen/duplicacy
API     := https://api.github.com/repos/$(REPO)/releases/tags/v$(V)
PS1     := tools/chocolateyinstall.ps1

IMAGE   := chocolatey/choco:latest
# Mono's JIT crashes under amd64 emulation (Rosetta/QEMU), so force its interpreter
CHOCO   := docker run --rm --platform linux/amd64 -e MONO_ENV_OPTIONS=--interpreter -v "$(CURDIR)":/pkg -w /pkg $(IMAGE) choco

.PHONY: all bump release check-version pack push clean colima-up

all: pack

# Start the Colima VM with Rosetta so the amd64-only choco image runs on Apple Silicon
colima-up:
	colima status >/dev/null 2>&1 || colima start --vm-type vz --vz-rosetta

check-version:
	@echo "$(V)" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$$' || { echo "Usage: make $(MAKECMDGOALS) V=x.y.z"; exit 1; }

# Points the nuspec and install script at release v$(V), using the sha256 digests GitHub publishes for its assets
bump: check-version
	@set -e; \
	release=$$(curl -fsSL $(API)); \
	digest() { printf %s "$$release" | jq -er --arg n "duplicacy_win_$$1_$(V).exe" \
		'.assets[] | select(.name == $$n) | .digest | select(type == "string" and startswith("sha256:")) | ltrimstr("sha256:")' \
		|| { echo "No sha256 digest for duplicacy_win_$$1_$(V).exe in release v$(V)" >&2; return 1; }; }; \
	sha32=$$(digest i386); \
	sha64=$$(digest x64); \
	sed -E 's|<version>[^<]*</version>|<version>$(V)</version>|' $(PACKAGE).nuspec > $(PACKAGE).nuspec.tmp; \
	mv $(PACKAGE).nuspec.tmp $(PACKAGE).nuspec; \
	sed -E \
		-e 's#download/v[^/]*/duplicacy_win_(i386|x64)_[^/]*\.exe#download/v$(V)/duplicacy_win_\1_$(V).exe#' \
		-e "s#^([$$]checksum *= *')[0-9a-f]*'#\1$$sha32'#" \
		-e "s#^([$$]checksum64 *= *')[0-9a-f]*'#\1$$sha64'#" \
		$(PS1) > $(PS1).tmp; \
	mv $(PS1).tmp $(PS1); \
	grep -q "<version>$(V)</version>" $(PACKAGE).nuspec; \
	test $$(grep -c "download/v$(V)/duplicacy_win_.*_$(V)\.exe" $(PS1)) -eq 2; \
	grep -q "'$$sha32'" $(PS1); \
	grep -q "'$$sha64'" $(PS1); \
	echo "Bumped to $(V) (i386 $$sha32, x64 $$sha64)"

# Re-invokes make so VERSION/NUPKG are re-read from the bumped nuspec
release: check-version
	@test -n "$(CHOCO_API_KEY)" || { echo "CHOCO_API_KEY is not set"; exit 1; }
	$(MAKE) bump V=$(V)
	$(MAKE) push

pack: $(NUPKG)

$(NUPKG): $(PACKAGE).nuspec $(wildcard tools/*)
	$(CHOCO) pack $(PACKAGE).nuspec

push: $(NUPKG)
	@test -n "$(CHOCO_API_KEY)" || { echo "CHOCO_API_KEY is not set"; exit 1; }
	$(CHOCO) push $(NUPKG) --source $(SOURCE) --api-key "$(CHOCO_API_KEY)"

clean:
	rm -f *.nupkg
