$env:POWERSHELL_UPDATECHECK = 'Off'

$env:XDG_CONFIG_HOME = $env:APPDATA
$env:OPENCODE_CONFIG_DIR = "$env:XDG_CONFIG_HOME/opencode"
$env:ZDOTDIR = $PSScriptRoot

# setup-machine completions (must load before module import for 'using namespace')
Import-Module "$PSScriptRoot\Modules\setup-machine\Completions\setup-machine-completions.ps1"

# Make Tab show all completions in a menu (like zsh)
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete

Import-Module "$PSScriptRoot/Modules/setup-machine/setup-machine.psm1"

function src
{
    $ModulesPath = "$PSScriptRoot/Modules"
    Get-ChildItem -Path $ModulesPath -Directory | ForEach-Object {
        Remove-Module $_.Name -ErrorAction SilentlyContinue
    }
    Import-Module $PSCommandPath
}

function arch
{
    Set-Location "\\wsl.localhost\archlinux\home\kbroom"
}

Write-Output "Hello HOME/Documents/PowerShell/profile.ps1"
