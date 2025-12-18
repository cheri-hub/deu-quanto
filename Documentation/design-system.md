# Design System - Grocery Price Scanner

## Visão Geral
Design moderno e limpo com foco em usabilidade, utilizando Material Design 3 como base. A interface prioriza clareza visual, espaçamento generoso e elementos interativos bem definidos.

## Paleta de Cores

### Cores Principais
- **Primary**: Verde (Material 3 - `seedColor: Colors.green`)
  - Usado em botões principais, destaques e ações primárias
  - Variação com transparência: `alpha: 0.8` para gradientes
  
### Cores Neutras
- **Background**: Baseado no tema (claro/escuro)
- **Cards**: `Theme.cardColor` com adaptação automática ao tema
- **Shadows**: `Colors.black` com `alpha: 0.05` (sutil)

### Modos de Tema
- ✅ **Light Mode**: Background claro, contraste suave
- ✅ **Dark Mode**: Background escuro, elementos adaptados automaticamente

## Componentes

### Cards
```dart
BorderRadius: 20px
Shadow: blurRadius: 10, offset: (0, 2), alpha: 0.05
Padding: 16px
Margin bottom: 12px
```

### Botões

#### Botão Primário com Gradiente
```dart
Height: 64-70px
BorderRadius: 32-35px
Gradient: Primary → Primary (alpha: 0.85)
Shadow: blurRadius: 20-25, offset: (0, 8-10), alpha: 0.4
Padding horizontal: 24-32px
```

#### Botão Secundário (Outlined)
```dart
BorderRadius: 16px
Border: 1px, Colors.grey.shade300
Padding vertical: 18px
```

### Badges Numerados
```dart
Size: 48x48px
Shape: Circle
Background: primaryContainer
Text: 18px, bold, primary color
```

### Input Fields
```dart
BorderRadius: 16px
Border: outline.withAlpha(0.3) (normal), primary width: 2 (focused)
Filled: true, surfaceContainerHighest
Padding: default Material 3
```

## Tipografia

### Títulos
- **H1 (Screen Title)**: 28px, bold
- **H2 (Section Title)**: 20px, bold
- **Item Name**: 17px, w600

### Corpo
- **Price (Large)**: 32px, bold, primary color
- **Price (Card)**: 22-28px, bold
- **Body Text**: 15-16px, w500-w600
- **Subtitles**: 14px, w500, alpha: 0.9

### Botões
- **Primary Buttons**: 16-18px, bold, letterSpacing: 0.5
- **Text Buttons**: 15px, w600

## Espaçamento

### Margens e Padding
- **Screen padding**: 16-20px
- **Card padding**: 16-24px
- **Element spacing**: 8-16px
- **Section spacing**: 20-32px

### Gaps
- **Small**: 4-8px
- **Medium**: 12-16px
- **Large**: 24-32px

## Ícones

### Tamanhos
- **Small**: 20px
- **Medium**: 28-32px
- **Large**: 48-80px (empty states)

### Estilo
- **Outlined**: Usados em botões de ação secundária (`edit_outlined`, `delete_outline`)
- **Rounded**: Usados em ações primárias (`camera_alt_rounded`)
- **Standard**: Contexto geral

## Efeitos Visuais

### Sombras
```dart
// Cards
color: Colors.black.withAlpha(0.05)
blurRadius: 10
offset: (0, 2)

// Botões flutuantes
color: primary.withAlpha(0.4)
blurRadius: 20-25
offset: (0, 8-10)
```

### Gradientes
```dart
// Botões e cards de destaque
colors: [
  Theme.primary,
  Theme.primary.withAlpha(0.8-0.85)
]
```

### Transparências
- **Backgrounds sobrepostos**: `alpha: 0.5-0.7`
- **Container interno**: `alpha: 0.1-0.2`
- **Texto secundário**: `alpha: 0.9`

## Estados Interativos

### Selecionado
- Border: 2px, primary color
- Background: primaryContainer
- Shadow: Enhanced (blurRadius: 15)
- Icon: check_circle (filled)

### Normal
- Border: transparent
- Background: cardColor
- Shadow: Subtle
- Icon: radio_button_unchecked

### Loading
- Background overlay: `Colors.black.withAlpha(0.85)`
- Indicator: primary color, strokeWidth: 3
- Container padding: 24px, shape: circle

## Telas

### Shopping List Screen
- Lista com cards arredondados
- Badge numerado circular
- Total em card flutuante (gradient)
- FAB customizado com gradient
- Empty state com ícone grande centralizado

### Camera Scan Screen
- Background: black (fullscreen)
- AppBar: transparent
- Instrução: card semi-transparente no topo
- FAB: gradient com ícone circular interno

### Price Selection Screen
- Header fixo com input e botões
- Imagem da captura: height: 250px
- Lista de preços: cards com seleção visual
- Indicador de seleção: ícone circular

## Acessibilidade
- Contraste adequado entre texto e background
- Áreas de toque ≥ 48x48px
- Labels descritivos em botões e campos
- Suporte completo a Dark Mode
