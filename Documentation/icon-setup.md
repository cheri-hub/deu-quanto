# Script para Gerar Ícone do DeuQuanto?

## Método 1: Conversão Online (Recomendado)

1. Acesse: https://cloudconvert.com/svg-to-png
2. Faça upload do arquivo `assets/icon.svg`
3. Configure a resolução para 1024x1024 pixels
4. Faça o download e salve como `assets/icon.png`

Para o ícone adaptativo Android:
5. Repita o processo, mas salve como `assets/icon_foreground.png`

## Método 2: Usando Inkscape (Gratuito)

```bash
# Instale o Inkscape: https://inkscape.org/release/

# Converta SVG para PNG em alta resolução
inkscape assets/icon.svg --export-type=png --export-filename=assets/icon.png --export-width=1024 --export-height=1024
```

## Método 3: Criar PNG no Photoshop/GIMP

1. Abra o arquivo SVG no Photoshop ou GIMP
2. Configure canvas para 1024x1024 pixels
3. Exporte como PNG com transparência
4. Salve em `assets/icon.png`

## Após criar o PNG

Execute no terminal:

```bash
# Instale as dependências
flutter pub get

# Gere os ícones para Android e iOS
flutter pub run flutter_launcher_icons

# Limpe o cache
flutter clean

# Rebuild
flutter build apk --debug
```

## Dimensões dos Ícones Gerados

### Android
- mipmap-mdpi: 48x48
- mipmap-hdpi: 72x72
- mipmap-xhdpi: 96x96
- mipmap-xxhdpi: 144x144
- mipmap-xxxhdpi: 192x192

### iOS
- 20x20 a 1024x1024 (vários tamanhos para diferentes dispositivos)

## Ícone Atual

O SVG criado contém:
- ✅ Câmera verde (#22C55E) no estilo flat
- ✅ Nota de dinheiro com gradiente verde-limão (#84CC16 → #65A30D)
- ✅ Símbolo "R$" em branco e negrito
- ✅ Fundo escuro (#1E293B)
- ✅ Cantos arredondados
- ✅ Dimensões: 512x512 (vetorial, escalável)

## Personalização

Para editar o ícone, abra `assets/icon.svg` em:
- **Adobe Illustrator**
- **Inkscape** (gratuito)
- **Figma** (online)
- **VS Code** com extensão SVG

Cores usadas:
- Fundo: #1E293B (Slate 800)
- Câmera: #22C55E (Green 500)
- Detalhe câmera: #16A34A (Green 600)
- Nota - Início: #84CC16 (Lime 500)
- Nota - Fim: #65A30D (Lime 600)
- Nota - Borda: #4D7C0F (Lime 700)
- Texto R$: #FFFFFF (White)
