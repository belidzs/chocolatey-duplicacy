PACKAGE := duplicacy

# Generates the package filename from the nuspec file
VERSION := $(shell sed -n 's:.*<version>\(.*\)</version>.*:\1:p' $(PACKAGE).nuspec)
NUPKG   := $(PACKAGE).$(VERSION).nupkg

SOURCE  := https://push.chocolatey.org/

IMAGE   := chocolatey/choco:latest
# Mono's JIT crashes under amd64 emulation (Rosetta/QEMU), so force its interpreter
CHOCO   := docker run --rm --platform linux/amd64 -e MONO_ENV_OPTIONS=--interpreter -v "$(CURDIR)":/pkg -w /pkg $(IMAGE) choco

.PHONY: all pack push clean colima-up

all: pack

# Start the Colima VM with Rosetta so the amd64-only choco image runs on Apple Silicon
colima-up:
	colima status >/dev/null 2>&1 || colima start --vm-type vz --vz-rosetta

pack: $(NUPKG)

$(NUPKG): $(PACKAGE).nuspec $(wildcard tools/*)
	$(CHOCO) pack $(PACKAGE).nuspec

push: $(NUPKG)
	@test -n "$(CHOCO_API_KEY)" || { echo "CHOCO_API_KEY is not set"; exit 1; }
	$(CHOCO) push $(NUPKG) --source $(SOURCE) --api-key "$(CHOCO_API_KEY)"

clean:
	rm -f *.nupkg
