# Oh My Posh
& "~\dotfiles\powershell\oh-my-posh.exe" init pwsh --config "~\dotfiles\powershell\mytheme.omp.json" | Invoke-Expression

function Ensure-Module {
    param([string]$Name)
    if (-not (Get-Module -ListAvailable -Name $Name)) {
        Write-Host "Installing $Name..." -ForegroundColor Yellow
        Install-Module $Name `
            -Scope CurrentUser `
            -Force `
            -AllowClobber
    }
}

# Modules
Ensure-Module PSReadLine
Ensure-Module Terminal-Icons

Import-Module PSReadLine
Import-Module Terminal-Icons

Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionViewStyle ListView

. "~\dotfiles\powershell\aliases.ps1"
. "~\dotfiles\powershell\functions.ps1"