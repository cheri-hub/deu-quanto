# Gerador de Icone - DeuQuanto?

$svgPath = "$PSScriptRoot\..\assets\icon.svg"
$pngPath = "$PSScriptRoot\..\assets\icon.png"

Write-Host "Gerador de Icone - DeuQuanto?" -ForegroundColor Green
Write-Host ""

if (-not (Test-Path $svgPath)) {
    Write-Host "Erro: icon.svg nao encontrado" -ForegroundColor Red
    exit 1
}

Write-Host "Arquivo SVG encontrado" -ForegroundColor Cyan
Write-Host ""
Write-Host "Para converter o SVG em PNG, use uma destas opcoes:" -ForegroundColor Yellow
Write-Host ""
Write-Host "OPCAO 1 - Online (Mais Facil):"
Write-Host "  1. Acesse: https://cloudconvert.com/svg-to-png"
Write-Host "  2. Upload: assets\icon.svg"
Write-Host "  3. Tamanho: 1024x1024 pixels"
Write-Host "  4. Salve como: assets\icon.png"
Write-Host "  5. Copie para: assets\icon_foreground.png"
Write-Host ""
Write-Host "OPCAO 2 - Inkscape:"
Write-Host "  1. Baixe: https://inkscape.org/release/"
Write-Host "  2. Execute: inkscape assets\icon.svg --export-type=png --export-filename=assets\icon.png --export-width=1024"
Write-Host ""
Write-Host "Apos criar os PNGs:"
Write-Host "  flutter pub get"
Write-Host "  flutter pub run flutter_launcher_icons"
Write-Host ""
