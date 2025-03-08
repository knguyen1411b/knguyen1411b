Write-Host "    Powershell started...   " -ForegroundColor White -BackgroundColor Green

oh-my-posh init pwsh --config 'C:\Users\nguye\scoop\apps\oh-my-posh\current\themes\montys.omp.json' | Invoke-Expression
Import-Module Terminal-Icons

#Aliases
Set-Alias ll ls
Set-Alias cl clear

function whereis($command){
	Get-Command -Name $command -ErrorAction SilentlyContinue |
	Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
function ??{
	github-copilot-cli what-the-shell "$args"
}
function git?{
	github-copilot-cli git-assist "$args"
}
function gh?{
	github-copilot-cli gh-assist "$args"
}
function new {
    param (
        [string]$fileName
    )
    New-Item -Path $fileName -ItemType File
}


#PSReadLine 
Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionViewStyle ListView
clear

Write-Host  "`e[1m`e[5m Xin chao Khanh Nguyen `e[0m"  -ForegroundColor White -BackgroundColor Blue
echo('')

