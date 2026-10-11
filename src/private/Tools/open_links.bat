@echo off

setlocal
set "APP_LIST=%~dp0..\list-app.md"

if not exist "%APP_LIST%" (
    echo Cannot find list-app.md: "%APP_LIST%"
    pause
    exit /b 1
)

powershell.exe -NoProfile -Command "$content = Get-Content -LiteralPath $env:APP_LIST -Raw -Encoding UTF8; $links = [regex]::Matches($content, '\]\((https?://[^\s)]+)\)') | ForEach-Object { $_.Groups[1].Value } | Select-Object -Unique; foreach ($link in $links) { Write-Host ('Opening: ' + $link); Start-Process -FilePath $link }"

exit /b %errorlevel%
