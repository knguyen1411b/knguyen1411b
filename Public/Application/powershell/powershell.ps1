# C:\Program Files\PowerShell\7\Microsoft.PowerShell_profile.ps1

echo ""
Write-Host " ██╗      ██████╗  █████╗ ██████╗ ██╗███╗   ██╗ ██████╗          " -ForegroundColor Green
Write-Host " ██║     ██╔═══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝          " -ForegroundColor Green
Write-Host " ██║     ██║   ██║███████║██║  ██║██║██╔██╗ ██║██║  ███╗         " -ForegroundColor Green
Write-Host " ██║     ██║   ██║██╔══██║██║  ██║██║██║╚██╗██║██║   ██║         " -ForegroundColor Green
Write-Host " ███████╗╚██████╔╝██║  ██║██████╔╝██║██║ ╚████║╚██████╔╝██╗██╗██╗" -ForegroundColor Green
Write-Host " ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝╚═╝" -ForegroundColor Green
echo ""
                                                                
oh-my-posh init pwsh --config 'C:\Users\knguyen\scoop\apps\oh-my-posh\26.6.1\themes\montys.omp.json' | Invoke-Expression

#Aliases
Set-Alias ll ls
Set-Alias cl clear

function whereis($command){
	Get-Command -Name $command -ErrorAction SilentlyContinue |
	Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function new {
    param (
        [string]$fileName
    )
    New-Item -Path $fileName -ItemType File
}


#PSReadLine 
Import-Module PSReadLine
# Import-Module Terminal-Icons
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionViewStyle ListView

clear

echo('')
Write-Host  " ██╗  ██╗███╗   ██╗ ██████╗ ██╗   ██╗██╗   ██╗███████╗███╗   ██╗ "  -ForegroundColor Blue
Write-Host  " ██║ ██╔╝████╗  ██║██╔════╝ ██║   ██║╚██╗ ██╔╝██╔════╝████╗  ██║ "  -ForegroundColor Blue
Write-Host  " █████╔╝ ██╔██╗ ██║██║  ███╗██║   ██║ ╚████╔╝ █████╗  ██╔██╗ ██║ "  -ForegroundColor Blue
Write-Host  " ██╔═██╗ ██║╚██╗██║██║   ██║██║   ██║  ╚██╔╝  ██╔══╝  ██║╚██╗██║ "  -ForegroundColor Blue
Write-Host  " ██║  ██╗██║ ╚████║╚██████╔╝╚██████╔╝   ██║   ███████╗██║ ╚████║ "  -ForegroundColor Blue
Write-Host  " ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝╚═╝  ╚═══╝ "  -ForegroundColor Blue
echo('')

# Activate venv if exists
if (Test-Path ".\venv\Scripts\Activate.ps1") {
    Write-Host "Found venv -> Activating..."
    .\venv\Scripts\Activate.ps1
}

# Git pull if in a git repo
if (Test-Path ".git") {
    Write-Host "Git pull..."
    git pull
}