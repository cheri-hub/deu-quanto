# Groceries Scanner - App de Escaneamento de Preços

Um aplicativo Flutter para escanear preços de produtos no mercado usando OCR e gerenciar sua lista de compras.

## 📱 Funcionalidades

- **Escanear Preços**: Use a câmera para capturar preços de produtos
- **OCR Inteligente**: Reconhecimento automático de valores usando Google ML Kit
- **Seleção de Preços**: Escolha qual preço detectado adicionar à lista
- **Lista de Compras**: Gerencie seus itens com nome e preço
- **Total Automático**: Veja o total das suas compras em tempo real
- **Interface em Português**: UI completamente em português brasileiro

## 🚀 Como Usar

1. **Abra o app** - Você verá sua lista de compras (vazia no início)
2. **Toque em "ESCANEAR"** - A câmera será aberta
3. **Aponte para o preço** - Posicione a câmera sobre a etiqueta de preço
4. **Toque em "ESCANEAR"** - O app vai processar a imagem
5. **Selecione o preço** - Escolha o valor correto entre os detectados
6. **Digite o nome** - Adicione o nome do produto
7. **Toque em "ADICIONAR"** - O item será adicionado à sua lista
8. **Veja o total** - O valor total é calculado automaticamente

## 🛠️ Instalação

### Pré-requisitos

- Flutter SDK (3.9.2 ou superior)
- Android Studio ou Xcode (para rodar em dispositivos)
- Um dispositivo físico com câmera (emuladores têm suporte limitado a câmera)

### Passos

1. Clone o repositório:
```bash
git clone <url-do-repositorio>
cd groceriesHelp
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Execute o app:
```bash
flutter run
```

## 📦 Dependências Principais

- `camera`: Acesso à câmera do dispositivo
- `google_mlkit_text_recognition`: OCR para reconhecimento de texto
- `provider`: Gerenciamento de estado
- `permission_handler`: Gerenciamento de permissões

## 🔧 Permissões Necessárias

### Android
- Câmera
- Internet (para ML Kit)

### iOS
- Câmera (NSCameraUsageDescription configurado)

## 📂 Estrutura do Projeto

```
lib/
├── models/
│   └── shopping_item.dart          # Modelo de dados do item
├── providers/
│   └── shopping_list_provider.dart # Gerenciamento de estado
├── screens/
│   ├── camera_scan_screen.dart     # Tela de escaneamento
│   ├── price_selection_screen.dart # Tela de seleção de preços
│   └── shopping_list_screen.dart   # Tela principal da lista
├── services/
│   └── text_recognition_service.dart # Serviço de OCR
└── main.dart                        # Ponto de entrada do app
```

## 💡 Como Funciona o OCR

O app usa expressões regulares para detectar padrões de preço:
- Aceita: `1,99`, `1.99`, `R$ 1,99`, `R$1,99`
- Filtra valores entre R$ 0,01 e R$ 9.999,99
- Ignora valores muito baixos ou muito altos

## 🎨 Capturas de Tela

O app possui três telas principais:
1. **Lista de Compras**: Visualize todos os itens e o total
2. **Câmera**: Escaneie preços em tempo real
3. **Seleção**: Escolha o preço e adicione o nome do produto

## 📝 Notas de Desenvolvimento

- O app requer um dispositivo físico para melhor funcionalidade da câmera
- O OCR funciona melhor com imagens nítidas e bem iluminadas
- A detecção de preços está otimizada para o formato brasileiro (R$)

## 🤝 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests.

## 📄 Licença

Este projeto é de código aberto e está disponível sob a licença MIT.

