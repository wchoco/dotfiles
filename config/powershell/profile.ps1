# PowerShell profile (dot-sourced from $PROFILE by setup.ps1)
$DotfilesRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

# keymap
if (Get-Module -ListAvailable PSReadLine) {
    Set-PSReadLineOption -EditMode Emacs
}

# zellij
# config.kdl is shared with Linux. It does not set default_shell, so zellij
# uses $env:SHELL; set it to the running PowerShell only while zellij starts.
function zellij {
    $prevShell = $env:SHELL
    $prevConfig = $env:ZELLIJ_CONFIG_FILE
    try {
        $env:SHELL = (Get-Process -Id $PID).Path
        $env:ZELLIJ_CONFIG_FILE = Join-Path $DotfilesRoot 'config\zellij\config.kdl'
        zellij.exe @args
    } finally {
        $env:SHELL = $prevShell
        $env:ZELLIJ_CONFIG_FILE = $prevConfig
    }
}
Set-Alias zj zellij
