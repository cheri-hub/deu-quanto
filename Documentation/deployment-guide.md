# Guia de Deploy - DeuQuanto?

## ✅ Configurações Concluídas

### 1. Nome do App
- ✅ `pubspec.yaml`: Nome alterado para "DeuQuanto?"
- ✅ AndroidManifest.xml: Label atualizado para "DeuQuanto?"
- ✅ Info.plist (iOS): CFBundleDisplayName e CFBundleName atualizados
- ✅ Todas as telas: Títulos alterados para "DeuQuanto?"

### 2. Package ID
- ✅ Android: Migrado de `com.groceries.groceries_scanner` para `com.deuquanto.app`
- ✅ MainActivity.kt: Criado no novo pacote `com.deuquanto.app`
- ✅ build.gradle.kts: namespace e applicationId atualizados

### 3. Build
- ✅ `flutter clean`: Executado com sucesso
- ✅ `flutter pub get`: Dependências instaladas
- ✅ `flutter analyze`: 0 erros
- ✅ `flutter build apk --debug`: APK gerado com sucesso

## 🚀 Próximos Passos para Deploy

### Para Teste em Dispositivo Físico

```bash
# Conecte o dispositivo via USB e habilite depuração USB
flutter devices

# Execute o app no dispositivo
flutter run

# Ou instale o APK debug diretamente
flutter install
```

### Para Produção (Google Play Store)

#### 1. Configure o Signing Key (Assinatura)

```bash
# Windows (PowerShell)
keytool -genkey -v -keystore c:\Users\SEU_USUARIO\deuquanto-key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias deuquanto

# Guarde a senha do keystore em local seguro!
```

#### 2. Configure o `android/key.properties`

Crie o arquivo `android/key.properties`:

```properties
storePassword=SUA_SENHA_STORE
keyPassword=SUA_SENHA_KEY
keyAlias=deuquanto
storeFile=c:/Users/SEU_USUARIO/deuquanto-key.jks
```

**IMPORTANTE**: Adicione `key.properties` ao `.gitignore`!

#### 3. Atualize o `android/app/build.gradle.kts`

Adicione antes do bloco `android`:

```kotlin
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}
```

No bloco `android`, adicione `signingConfigs` antes de `buildTypes`:

```kotlin
signingConfigs {
    create("release") {
        storeFile = file(keystoreProperties["storeFile"] as String)
        storePassword = keystoreProperties["storePassword"] as String
        keyAlias = keystoreProperties["keyAlias"] as String
        keyPassword = keystoreProperties["keyPassword"] as String
    }
}
```

E atualize `buildTypes`:

```kotlin
buildTypes {
    release {
        signingConfig = signingConfigs.getByName("release")
    }
}
```

#### 4. Atualize a Versão (pubspec.yaml)

```yaml
version: 1.0.0+1  # Formato: MAJOR.MINOR.PATCH+BUILD_NUMBER
```

Para cada novo release:
- Incremente `BUILD_NUMBER` (+1, +2, +3...) - obrigatório para Google Play
- Incremente `MAJOR.MINOR.PATCH` conforme necessário

#### 5. Gere o APK/Bundle de Produção

```bash
# APK Release (para distribuição manual)
flutter build apk --release

# App Bundle (recomendado para Google Play)
flutter build appbundle --release
```

O arquivo será gerado em:
- APK: `build/app/outputs/flutter-apk/app-release.apk`
- Bundle: `build/app/outputs/bundle/release/app-release.aab`

### Para App Store (iOS)

#### 1. Configure o Bundle ID no Xcode

1. Abra `ios/Runner.xcworkspace` no Xcode
2. Selecione o projeto Runner
3. Em "Signing & Capabilities", configure:
   - Bundle Identifier: `com.deuquanto.app`
   - Team: Selecione seu Apple Developer Team

#### 2. Configure Ícones e Splash Screen

- Ícones: `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
- Launch Screen: `ios/Runner/Assets.xcassets/LaunchImage.imageset/`

#### 3. Gere o Build para iOS

```bash
flutter build ios --release
```

#### 4. Archive e Upload no Xcode

1. Abra `ios/Runner.xcworkspace` no Xcode
2. Product > Archive
3. Window > Organizer
4. Selecione o archive e clique em "Distribute App"

## 📱 Recursos Adicionais Recomendados

### Ícone do App

Use o package `flutter_launcher_icons`:

```yaml
# pubspec.yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/icon.png"
  adaptive_icon_background: "#4CAF50"
  adaptive_icon_foreground: "assets/icon_foreground.png"
```

Execute: `flutter pub run flutter_launcher_icons`

### Splash Screen

Use o package `flutter_native_splash`:

```yaml
# pubspec.yaml
dev_dependencies:
  flutter_native_splash: ^2.3.10

flutter_native_splash:
  color: "#4CAF50"
  image: assets/splash.png
  android: true
  ios: true
```

Execute: `flutter pub run flutter_native_splash:create`

## 🔒 Checklist de Segurança

- [ ] Adicione `key.properties` ao `.gitignore`
- [ ] Guarde o arquivo `.jks` em local seguro (BACKUP!)
- [ ] Documente as senhas do keystore em local seguro
- [ ] Revise permissões no AndroidManifest.xml
- [ ] Teste todas as funcionalidades em dispositivo físico
- [ ] Verifique política de privacidade (Camera, Storage)

## 📋 Informações do Projeto

- **Nome**: DeuQuanto?
- **Package ID**: com.deuquanto.app
- **Versão**: 1.0.0+1
- **Flutter SDK**: 3.9.2+
- **Plataformas**: Android (minSdk 21), iOS (12.0+)

## 🐛 Troubleshooting

### Erro: "Duplicate class found"

```bash
flutter clean
flutter pub get
flutter build apk --debug
```

### Erro: "Keystore was tampered with"

Verifique se as senhas em `key.properties` estão corretas.

### APK muito grande

```bash
# Gere APKs separados por arquitetura
flutter build apk --split-per-abi
```

Isso gera APKs menores em `build/app/outputs/flutter-apk/`:
- `app-armeabi-v7a-release.apk` (~20MB)
- `app-arm64-v8a-release.apk` (~25MB)
- `app-x86_64-release.apk` (~30MB)

## 📞 Suporte

Para problemas específicos do Flutter: https://flutter.dev/docs

Para Google Play Console: https://play.google.com/console

Para App Store Connect: https://appstoreconnect.apple.com
