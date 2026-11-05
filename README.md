# chocolatey-duplicacy

[Chocolatey package](https://community.chocolatey.org/packages/duplicacy) for
[Duplicacy](https://github.com/gilbertchen/duplicacy), the command line version.

## Automatic updates

A daily GitHub Actions workflow ([update-package.yml](.github/workflows/update-package.yml))
uses [Chocolatey-AU](https://github.com/chocolatey-community/chocolatey-au) to check for a new
Duplicacy release. When it finds one, it updates the URLs and checksums, pushes the package to
Chocolatey and commits the changes to `develop`.

### Setup

1. Add your [Chocolatey API key](https://community.chocolatey.org/account) as a repository
   secret named `CHOCO_API_KEY` (**Settings > Secrets and variables > Actions**).
2. Allow the workflow to commit: under **Settings > Actions > General > Workflow permissions**,
   select **Read and write permissions**.
3. To run it right away, go to the **Actions** tab, select **Auto Update Package** and click
   **Run workflow**.

### Keeping the schedule running

GitHub disables scheduled workflows in public repositories after 60 days without repository
activity, and Duplicacy releases can be further apart than that. If it happens, re-enable the
workflow from the **Actions** tab, then run it once to pick up any release it missed.

## Testing locally

Requires Chocolatey and the AU module (`Install-Module Chocolatey-AU -Scope CurrentUser`). Run
this in Windows PowerShell, from the `duplicacy` folder:

```powershell
.\update.ps1          # Update the package files and build the nupkg, if there's a new release
.\update.ps1 -Force   # Same, even if there's no new release
```

Nothing gets pushed. Use `git restore .` to undo the changes to the package files.
