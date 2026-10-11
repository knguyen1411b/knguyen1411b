function .. { Set-Location .. }
function ... { Set-Location ../.. }
function .... { Set-Location ../../.. }

function touch {
    param([string]$name)
    New-Item -ItemType File -Path $name
}

function whereis {
    param([string]$command)

    Get-Command $command |
    Select-Object -ExpandProperty Source
}

function mkcd {
    param([string]$dir)

    mkdir $dir
    Set-Location $dir
}

function reload {
    . $PROFILE
}

function killport {
    param([int]$port)

    Get-NetTCPConnection -LocalPort $port |
        Select-Object -ExpandProperty OwningProcess |
        ForEach-Object { Stop-Process -Id $_ -Force }
}

function Clean-Project {
    [CmdletBinding()]
    param ()

    $dirs = @(
        # Node.js
        "node_modules",
        "dist",
        "build",
        ".next",
        ".nuxt",
        ".svelte-kit",
        ".parcel-cache",
        ".turbo",
        ".vite",
        ".cache",
        "coverage",

        # Python
        "__pycache__",
        ".pytest_cache",
        ".mypy_cache",
        ".ruff_cache",
        ".tox",
        ".venv",
        "venv",
        "env",

        # Rust
        "target",

        # Java
        ".gradle",
        ".mvn",

        # .NET
        "bin",
        "obj",

        # IDE
        ".idea"
    )

    $files = @(
        ".coverage",
        "*.pyc",
        "*.pyo",
        "*.class"
    )

    Write-Host "Cleaning project..." -ForegroundColor Cyan

    foreach ($dir in $dirs) {
        Get-ChildItem . -Directory -Recurse -Force -ErrorAction SilentlyContinue |
            Where-Object Name -eq $dir |
            ForEach-Object {
                Write-Host "Removing $($_.FullName)" -ForegroundColor Yellow
                Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
            }
    }

    foreach ($file in $files) {
        Get-ChildItem . -File -Recurse -Force -Filter $file -ErrorAction SilentlyContinue |
            ForEach-Object {
                Write-Host "Removing $($_.FullName)" -ForegroundColor DarkYellow
                Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue
            }
    }

    Write-Host "Done." -ForegroundColor Green
}
