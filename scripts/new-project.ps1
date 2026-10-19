[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [ValidateSet("js", "php", "rust", "cpp", "css", "asm")]
    [string]$Group,

    [Parameter(Mandatory = $true, Position = 1)]
    [ValidatePattern("^[a-z][a-z0-9-]*$")]
    [string]$Name
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$template = Join-Path $PSScriptRoot "templates\$Group"
$dest = Join-Path $root "$Group\$Name"

if (-not (Test-Path -LiteralPath $template)) {
    throw "missing template: $template"
}
if (Test-Path -LiteralPath $dest) {
    throw "already exists: $dest"
}

New-Item -ItemType Directory -Force -Path (Join-Path $root $Group) | Out-Null
Copy-Item -LiteralPath $template -Destination $dest -Recurse

$utf8 = New-Object System.Text.UTF8Encoding $false
Get-ChildItem -LiteralPath $dest -Recurse -File | ForEach-Object {
    $text = [System.IO.File]::ReadAllText($_.FullName)
    $updated = $text.Replace("__NAME__", $Name)
    if ($updated -ne $text) {
        [System.IO.File]::WriteAllText($_.FullName, $updated, $utf8)
    }
}

Write-Output "created $Group/$Name"
Write-Output "if it serves traffic, set a free port and add a row to PORTS.md"
