$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot '_install_state.ps1')

$syncClaude = $false
$syncCodex = $false
$quiet = $false

foreach ($arg in $args) {
  switch ($arg) {
    '--quiet' { $quiet = $true }
    '--claude' { $syncClaude = $true }
    '--codex' { $syncCodex = $true }
    '--all' {
      $syncClaude = $true
      $syncCodex = $true
    }
    default { throw "Unknown option: $arg" }
  }
}

$repoDir = Get-GameSuperpowersRepoDir

if (-not $syncClaude -and -not $syncCodex) {
  if (Test-GameSuperpowersHostRegistered -RepoDir $repoDir -Host 'claude') {
    $syncClaude = $true
  }
  if (Test-GameSuperpowersHostRegistered -RepoDir $repoDir -Host 'codex') {
    $syncCodex = $true
  }
}

if (-not $syncClaude -and -not $syncCodex) {
  if (-not $quiet) {
    Write-Host 'No installed hosts recorded for this clone. Nothing to sync.'
  }
  exit 0
}

$oldSkipState = $env:GAME_SUPERPOWERS_SKIP_STATE
$oldSkipHook = $env:GAME_SUPERPOWERS_SKIP_HOOK_SETUP
$env:GAME_SUPERPOWERS_SKIP_STATE = '1'
$env:GAME_SUPERPOWERS_SKIP_HOOK_SETUP = '1'

try {
  if ($syncClaude) {
    & (Join-Path $PSScriptRoot 'install-claude-skills.ps1')
  }
  if ($syncCodex) {
    & (Join-Path $PSScriptRoot 'install-codex-skills.ps1')
  }
} finally {
  if ($null -eq $oldSkipState) {
    Remove-Item Env:GAME_SUPERPOWERS_SKIP_STATE -ErrorAction SilentlyContinue
  } else {
    $env:GAME_SUPERPOWERS_SKIP_STATE = $oldSkipState
  }

  if ($null -eq $oldSkipHook) {
    Remove-Item Env:GAME_SUPERPOWERS_SKIP_HOOK_SETUP -ErrorAction SilentlyContinue
  } else {
    $env:GAME_SUPERPOWERS_SKIP_HOOK_SETUP = $oldSkipHook
  }
}
