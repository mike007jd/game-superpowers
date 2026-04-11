$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot '_install_state.ps1')

$repoDir = Get-GameSuperpowersRepoDir
$gitDir = Get-GameSuperpowersGitDir -RepoDir $repoDir
if (-not $gitDir) {
  Write-Host "skip: $repoDir is not a git checkout, hooks were not installed"
  exit 0
}

$hooksDir = Join-Path $gitDir 'hooks'
New-Item -ItemType Directory -Force -Path $hooksDir | Out-Null

$beginMarker = '# >>> game-superpowers auto-sync >>>'
$endMarker = '# <<< game-superpowers auto-sync <<<'
$syncScript = (Join-Path $repoDir 'scripts/sync-all-skills.ps1').Replace('\', '/')
$hookBlock = @(
  $beginMarker
  "if command -v pwsh >/dev/null 2>&1; then"
  "  pwsh -NoProfile -File ""$syncScript"" --quiet"
  "elif command -v powershell >/dev/null 2>&1; then"
  "  powershell -NoProfile -File ""$syncScript"" --quiet"
  'fi'
  $endMarker
)

function Remove-ManagedBlock {
  param(
    [Parameter(Mandatory = $true)]
    [string]$Path
  )

  if (-not (Test-Path $Path)) {
    return
  }

  $lines = Get-Content $Path
  $filtered = New-Object System.Collections.Generic.List[string]
  $skip = $false

  foreach ($line in $lines) {
    if ($line -eq $beginMarker) {
      $skip = $true
      continue
    }
    if ($line -eq $endMarker) {
      $skip = $false
      continue
    }
    if (-not $skip) {
      $filtered.Add($line)
    }
  }

  Set-Content -Path $Path -Value $filtered
}

function Ensure-Hook {
  param(
    [Parameter(Mandatory = $true)]
    [string]$Path
  )

  if (Test-Path $Path) {
    Remove-ManagedBlock -Path $Path
    $lines = [System.Collections.Generic.List[string]](Get-Content $Path)
  } else {
    $lines = New-Object System.Collections.Generic.List[string]
    $lines.Add('#!/usr/bin/env bash')
  }

  if ($lines.Count -eq 0) {
    $lines.Add('#!/usr/bin/env bash')
  }

  foreach ($line in $hookBlock) {
    $lines.Add($line)
  }

  Set-Content -Path $Path -Value $lines
}

if (Test-GameSuperpowersState -RepoDir $repoDir) {
  Ensure-Hook -Path (Join-Path $hooksDir 'post-merge')
  Ensure-Hook -Path (Join-Path $hooksDir 'post-checkout')
  Write-Host "Installed auto-sync git hooks in $hooksDir"
} else {
  Remove-ManagedBlock -Path (Join-Path $hooksDir 'post-merge')
  Remove-ManagedBlock -Path (Join-Path $hooksDir 'post-checkout')
  Write-Host "Removed Game Superpowers auto-sync hook blocks from $hooksDir"
}
