$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot '_install_state.ps1')

$repoDir = Get-GameSuperpowersRepoDir
$src = Join-Path $repoDir 'skills'
$destBase = if ($env:CODEX_SKILLS_DIR) { $env:CODEX_SKILLS_DIR } else { Join-Path $HOME '.agents/skills' }
$target = Join-Path $destBase 'game-superpowers'
$marker = Join-Path $target '.game-superpowers-install'

New-Item -ItemType Directory -Force -Path $destBase | Out-Null

if ((Test-Path $target) -and -not (Test-Path $target -PathType Container)) {
  throw "skip: $target exists and is not a directory"
}

New-Item -ItemType Directory -Force -Path $target | Out-Null
New-Item -ItemType File -Force -Path $marker | Out-Null

Get-ChildItem $target -Force | Where-Object { $_.Name -ne '.game-superpowers-install' } | ForEach-Object {
  Remove-Item -Recurse -Force $_.FullName
}

Get-ChildItem $src -Directory | ForEach-Object {
  New-GameSuperpowersJunction -Path (Join-Path $target $_.Name) -Target $_.FullName
}

foreach ($sharedDir in @('shared', 'schemas')) {
  New-GameSuperpowersJunction -Path (Join-Path $target $sharedDir) -Target (Join-Path $repoDir $sharedDir)
}

if ($env:GAME_SUPERPOWERS_SKIP_STATE -ne '1') {
  Register-GameSuperpowersHost -RepoDir $repoDir -Host 'codex'
}

if ($env:GAME_SUPERPOWERS_SKIP_HOOK_SETUP -ne '1') {
  & (Join-Path $PSScriptRoot 'install-git-hooks.ps1')
}

Write-Host "Synced Game Superpowers into $target"
