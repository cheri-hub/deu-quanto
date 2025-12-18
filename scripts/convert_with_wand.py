from PIL import Image
import io

try:
    # Tenta usar wand (ImageMagick)
    from wand.image import Image as WandImage
    
    svg_path = 'assets/icon.svg'
    png_path = 'assets/icon.png'
    png_foreground = 'assets/icon_foreground.png'
    
    print("Convertendo usando ImageMagick/Wand...")
    
    with WandImage(filename=svg_path, resolution=200) as img:
        img.format = 'png'
        img.resize(1024, 1024)
        img.save(filename=png_path)
    
    print(f"✓ Criado: {png_path}")
    
    # Copia para foreground
    with WandImage(filename=svg_path, resolution=200) as img:
        img.format = 'png'
        img.resize(1024, 1024)
        img.save(filename=png_foreground)
    
    print(f"✓ Criado: {png_foreground}")
    print("\n✅ Conversão concluída!")
    print("\nAgora execute:")
    print("  flutter pub get")
    print("  flutter pub run flutter_launcher_icons")
    
except ImportError:
    print("❌ Wand não instalado")
    print("\nTente: pip install wand")
    print("E instale ImageMagick: https://imagemagick.org/script/download.php")
except Exception as e:
    print(f"❌ Erro: {e}")
