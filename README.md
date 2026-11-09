# duplicacy-chocolatey

## Build Workflow

```bash
# Start up Rosetta-based docker VM
make colima-up

# Bump version in nuspec
vi duplicacy.nuspec

make pack
make push
make clean
```