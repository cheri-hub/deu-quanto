"""
Script para converter SVG em PNG usando cairosvg
Instale: pip install cairosvg
"""

try:
    import cairosvg
    import os
    
    script_dir = os.path.dirname(os.path.abspath(__file__))
    project_root = os.path.dirname(script_dir)
    assets_dir = os.path.join(project_root, 'assets')
    
    svg_path = os.path.join(assets_dir, 'icon.svg')
    png_path = os.path.join(assets_dir, 'icon.png')
    png_foreground_path = os.path.join(assets_dir, 'icon_foreground.png')
    
    # Converte SVG para PNG em alta resolução (1024x1024)
    print("Convertendo icon.svg para icon.png (1024x1024)...")
    cairosvg.svg2png(url=svg_path, write_to=png_path, output_width=1024, output_height=1024)
    print(f"✓ Criado: {png_path}")
    
    # Cria uma cópia para o foreground do ícone adaptativo
    print("Copiando para icon_foreground.png...")
    cairosvg.svg2png(url=svg_path, write_to=png_foreground_path, output_width=1024, output_height=1024)
    print(f"✓ Criado: {png_foreground_path}")
    
    print("\n✅ Conversão concluída!")
    print("\nAgora execute:")
    print("  flutter pub get")
    print("  flutter pub run flutter_launcher_icons")
    
except ImportError:
    print("❌ Erro: cairosvg não está instalado")
    print("\nInstale com:")
    print("  pip install cairosvg")
    print("\nOu use um dos métodos alternativos descritos em Documentation/icon-setup.md")
except Exception as e:
    print(f"❌ Erro durante a conversão: {e}")
    print("\nTente usar um dos métodos alternativos descritos em Documentation/icon-setup.md")
