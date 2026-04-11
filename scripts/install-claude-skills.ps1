$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot '_install_state.ps1')

$repoDir = Get-GameSuperpowersRepoDir
$src = Join-Path $repoDir 'skills'
$dest = if ($env:CLAUDE_SKILLS_DIR) { $env:CLAUDE_SKILLS_DIR } else { Join-Path $HOME '.claude/skills' }
$claudeRoot = Split-Path -Parent $dest
$managedFile = Join-Path $claudeRoot '.game-superpowers-managed-skills'

New-Item -ItemType Directory -Force -Path $dest | Out-Null

if (Test-Path $managedFile) {
  Get-Content $managedFile | ForEach-Object {
    if ($_){
      $target = Join-Path $dest $_
      if (Test-Path $target) {
        Remove-Item -Recurse -Force $target
      }
    }
  }
}

$count = 0
$skipped = 0
$managedNow = New-Object System.Collections.Generic.List[string]

Get-ChildItem $src -Directory | ForEach-Object {
  $target = Join-Path $dest $_.Name
  if (Test-Path $target) {
    Write-Host "skip: $target exists and is not managed by this repo"
    $skipped++
  } else {
    New-GameSuperpowersJunction -Path $target -Target $_.FullName
    $managedNow.Add($_.Name)
    $count++
  }
}

Set-Content -Path $managedFile -Value $managedNow
New-Item -ItemType File -Force -Path (Join-Path $claudeRoot '.game-superpowers-install') | Out-Null

foreach ($sharedDir in @('shared', 'schemas')) {
  $link = Join-Path $claudeRoot $sharedDir
  New-GameSuperpowersJunction -Path $link -Target (Join-Path $repoDir $sharedDir)
}

if ($env:GAME_SUPERPOWERS_SKIP_STATE -ne '1') {
  Register-GameSuperpowersHost -RepoDir $repoDir -Host 'claude'
}

if ($env:GAME_SUPERPOWERS_SKIP_HOOK_SETUP -ne '1') {
  & (Join-Path $PSScriptRoot 'install-git-hooks.ps1')
}

$message = "Synced $count Claude skills into $dest"
if ($skipped -gt 0) {
  $message += " ($skipped skipped due to conflicts)"
}
Write-Host $message
