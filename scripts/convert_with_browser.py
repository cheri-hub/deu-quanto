"""
Converte SVG para PNG usando navegador Chrome/Edge via Selenium
"""
import os
import time
import base64

try:
    from selenium import webdriver
    from selenium.webdriver.chrome.options import Options
    from selenium.webdriver.common.by import By
    
    # Configurações
    svg_path = os.path.abspath('assets/icon.svg')
    png_path = os.path.abspath('assets/icon.png')
    png_foreground = os.path.abspath('assets/icon_foreground.png')
    
    # Lê o SVG
    with open(svg_path, 'r', encoding='utf-8') as f:
        svg_content = f.read()
    
    # HTML para renderizar SVG
    html_content = f"""
    <!DOCTYPE html>
    <html>
    <head>
        <style>
            body {{ margin: 0; padding: 0; background: transparent; }}
            svg {{ width: 1024px; height: 1024px; }}
        </style>
    </head>
    <body>
        {svg_content}
    </body>
    </html>
    """
    
    # Salva HTML temporário
    temp_html = os.path.abspath('temp_icon.html')
    with open(temp_html, 'w', encoding='utf-8') as f:
        f.write(html_content)
    
    print("Abrindo navegador...")
    
    # Configura Chrome headless
    chrome_options = Options()
    chrome_options.add_argument('--headless')
    chrome_options.add_argument('--hide-scrollbars')
    chrome_options.add_argument('--force-device-scale-factor=2')
    
    driver = webdriver.Chrome(options=chrome_options)
    driver.set_window_size(1024, 1024)
    driver.get(f'file:///{temp_html}')
    
    time.sleep(2)
    
    print("Capturando screenshot...")
    driver.save_screenshot(png_path)
    driver.save_screenshot(png_foreground)
    
    driver.quit()
    os.remove(temp_html)
    
    print(f"✓ Criado: {png_path}")
    print(f"✓ Criado: {png_foreground}")
    print("\n✅ Conversão concluída!")
    print("\nAgora execute:")
    print("  flutter pub get")
    print("  flutter pub run flutter_launcher_icons")
    
except ImportError:
    print("❌ Selenium não instalado")
    print("\nInstale com: pip install selenium")
    print("E baixe ChromeDriver: https://chromedriver.chromium.org/")
except Exception as e:
    print(f"❌ Erro: {e}")
    if os.path.exists('temp_icon.html'):
        os.remove('temp_icon.html')
