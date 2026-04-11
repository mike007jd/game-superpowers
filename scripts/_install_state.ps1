$ErrorActionPreference = 'Stop'

function Get-GameSuperpowersRepoDir {
  (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
}

function Get-GameSuperpowersGitDir {
  param(
    [Parameter(Mandatory = $true)]
    [string]$RepoDir
  )

  if ($env:GAME_SUPERPOWERS_GIT_DIR) {
    return $env:GAME_SUPERPOWERS_GIT_DIR
  }

  $gitDir = (& git -C $RepoDir rev-parse --git-dir 2>$null)
  if (-not $gitDir) {
    return $null
  }

  if ([System.IO.Path]::IsPathRooted($gitDir)) {
    return $gitDir
  }

  return (Join-Path $RepoDir $gitDir)
}

function Get-GameSuperpowersStateFile {
  param(
    [Parameter(Mandatory = $true)]
    [string]$RepoDir
  )

  $gitDir = Get-GameSuperpowersGitDir -RepoDir $RepoDir
  if (-not $gitDir) {
    return $null
  }

  Join-Path $gitDir 'game-superpowers-installed-hosts'
}

function Test-GameSuperpowersState {
  param(
    [Parameter(Mandatory = $true)]
    [string]$RepoDir
  )

  $stateFile = Get-GameSuperpowersStateFile -RepoDir $RepoDir
  if (-not $stateFile) {
    return $false
  }

  (Test-Path $stateFile) -and ((Get-Item $stateFile).Length -gt 0)
}

function Test-GameSuperpowersHostRegistered {
  param(
    [Parameter(Mandatory = $true)]
    [string]$RepoDir,
    [Parameter(Mandatory = $true)]
    [string]$Host
  )

  $stateFile = Get-GameSuperpowersStateFile -RepoDir $RepoDir
  if (-not $stateFile -or -not (Test-Path $stateFile)) {
    return $false
  }

  (Get-Content $stateFile) -contains $Host
}

function Register-GameSuperpowersHost {
  param(
    [Parameter(Mandatory = $true)]
    [string]$RepoDir,
    [Parameter(Mandatory = $true)]
    [string]$Host
  )

  $stateFile = Get-GameSuperpowersStateFile -RepoDir $RepoDir
  if (-not $stateFile) {
    return
  }

  New-Item -ItemType Directory -Force -Path (Split-Path -Parent $stateFile) | Out-Null
  $hosts = @()
  if (Test-Path $stateFile) {
    $hosts = Get-Content $stateFile
  }
  $hosts = @($hosts + $Host | Sort-Object -Unique)
  Set-Content -Path $stateFile -Value $hosts
}

function Unregister-GameSuperpowersHost {
  param(
    [Parameter(Mandatory = $true)]
    [string]$RepoDir,
    [Parameter(Mandatory = $true)]
    [string]$Host
  )

  $stateFile = Get-GameSuperpowersStateFile -RepoDir $RepoDir
  if (-not $stateFile -or -not (Test-Path $stateFile)) {
    return
  }

  $hosts = @(Get-Content $stateFile | Where-Object { $_ -ne $Host })
  if ($hosts.Count -gt 0) {
    Set-Content -Path $stateFile -Value $hosts
  } else {
    Remove-Item -Force $stateFile
  }
}

function New-GameSuperpowersJunction {
  param(
    [Parameter(Mandatory = $true)]
    [string]$Path,
    [Parameter(Mandatory = $true)]
    [string]$Target
  )

  if (Test-Path $Path) {
    Remove-Item -Recurse -Force $Path
  }

  cmd /c mklink /J "$Path" "$Target" | Out-Null
}
