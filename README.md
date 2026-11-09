# duplicacy-chocolatey

## Build Workflow

```bash
# Start up Rosetta-based docker VM
make colima-up

# Bump nuspec + install script to an upstream release, then pack and push
export CHOCO_API_KEY=...
make release V=3.4.0
make clean
```

`make release` is `make bump` followed by `make push`; run them separately to review the diff before publishing:

```bash
make bump V=3.4.0   # sets the version, download URLs and sha256 checksums from the GitHub release
git diff
make pack
make push
```

Checksums come from the `digest` GitHub publishes for each release asset, so nothing is downloaded. Older releases without published digests (e.g. v3.2.4) can't be bumped this way.
