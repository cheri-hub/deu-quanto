# Guia de Configuração - Codemagic CI/CD

## 📋 Pré-requisitos

### Para Android:
1. **Keystore para assinatura** (.jks file)
2. **Conta no Google Play Console**
3. **Service Account JSON** do Google Cloud

### Para iOS:
1. **Conta Apple Developer** (paga)
2. **App Store Connect API Key**
3. **Certificados de distribuição**

## 🚀 Configuração Passo a Passo

### 1. Conectar Repositório ao Codemagic

1. Acesse: https://codemagic.io/
2. Faça login com sua conta GitHub
3. Clique em **"Add application"**
4. Selecione o repositório: `cheri-hub/deu-quanto`
5. Escolha **"Flutter App"** como tipo de projeto

### 2. Configurar Variáveis de Ambiente

No Codemagic, vá em **Application settings > Environment variables**:

#### Variáveis Gerais:
```
PACKAGE_NAME = com.deuquanto.app
```

### 3. Configurar Assinatura Android

#### 3.1. Gerar Keystore (se ainda não tiver):

```bash
keytool -genkey -v -keystore deuquanto-release.jks \
  -storetype JKS -keyalg RSA -keysize 2048 \
  -validity 10000 -alias deuquanto
```

**Guarde as senhas em local seguro!**

#### 3.2. Upload no Codemagic:

1. Vá em **Application settings > Android code signing**
2. Clique em **"Upload keystore"**
3. Faça upload do arquivo `.jks`
4. Preencha:
   - **Keystore password**: senha do keystore
   - **Key alias**: deuquanto
   - **Key password**: senha da key
5. Salve com nome: `keystore_reference`

#### 3.3. Configurar Google Play (Opcional):

Para publicação automática:

1. No Google Cloud Console, crie um **Service Account**
2. Baixe o JSON da conta de serviço
3. No Codemagic: **Application settings > Google Play**
4. Cole o conteúdo do JSON em `GCLOUD_SERVICE_ACCOUNT_CREDENTIALS`

### 4. Configurar Assinatura iOS (Se aplicável)

1. Vá em **Application settings > iOS code signing**
2. Conecte sua conta Apple Developer
3. Configure:
   - **Bundle identifier**: `com.deuquanto.app`
   - **Distribution type**: App Store
4. Codemagic gerenciará automaticamente certificados e provisioning profiles

### 5. Usar Configuração do Workflow

O arquivo `codemagic.yaml` já está configurado com:

#### Android Workflow:
- ✅ Build de APK/AAB
- ✅ Assinatura automática
- ✅ Versionamento automático
- ✅ Publicação no Google Play (draft)
- ✅ Notificações por e-mail

#### iOS Workflow:
- ✅ Build de IPA
- ✅ Code signing automático
- ✅ Publicação no TestFlight
- ✅ Notificações por e-mail

### 6. Trigger de Builds

O Codemagic pode iniciar builds automaticamente em:

- ✅ **Push na branch main** (recomendado)
- ✅ **Pull requests**
- ✅ **Tags** (para releases)
- ✅ **Manual** (via interface)

Configure em: **Application settings > Build triggers**

## 🔧 Configuração Manual (Interface Web)

Se preferir não usar `codemagic.yaml`:

### Android (Interface):

1. **Build settings**:
   - Build mode: `Release`
   - Build format: `Android App Bundle (AAB)`
   
2. **Build arguments**:
   ```
   --build-name=1.0.0 --build-number=1
   ```

3. **Post-build script**:
   ```bash
   # Opcional: Copiar APK para diretório específico
   cp build/app/outputs/bundle/release/*.aab $CM_BUILD_DIR/
   ```

### iOS (Interface):

1. **Build settings**:
   - Build mode: `Release`
   - iOS build configuration: `Release-iphoneos`

2. **Distribution**:
   - Method: `App Store`

## 📱 Testar Build Localmente (Antes de CI)

### Android:
```bash
flutter build appbundle --release
```

Arquivo gerado: `build/app/outputs/bundle/release/app-release.aab`

### iOS (apenas em Mac):
```bash
flutter build ipa --release
```

Arquivo gerado: `build/ios/ipa/deu_quanto.ipa`

## 🎯 Primeiro Build no Codemagic

1. Commit e push o arquivo `codemagic.yaml`:
   ```bash
   git add codemagic.yaml
   git commit -m "ci: Adicionar configuração Codemagic"
   git push origin main
   ```

2. No Codemagic, clique em **"Start new build"**
3. Selecione o workflow:
   - `android-workflow` para Android
   - `ios-workflow` para iOS
4. Clique em **"Start new build"**

## 📊 Monitoramento

Após iniciar o build:

1. Acompanhe logs em tempo real
2. Veja duração de cada step
3. Receba notificações por e-mail
4. Download de artifacts (APK/IPA)

## 🔍 Troubleshooting

### Erro: "Code signing failed"

**Android:**
- Verifique se keystore foi uploadado corretamente
- Confira alias e senhas

**iOS:**
- Verifique Bundle ID
- Confirme que Apple Developer account está ativa

### Erro: "Flutter version not found"

Adicione no `codemagic.yaml`:
```yaml
environment:
  flutter: 3.24.5  # Versão específica
```

### Erro: "Insufficient permissions"

Para Google Play:
- Service Account precisa ter permissão de "Release Manager"

## 💡 Dicas

1. **Use builds incrementais**: Configure cache para dependências
2. **Monitore custos**: Codemagic tem plano gratuito com 500 min/mês
3. **Test antes de merge**: Configure builds em PRs
4. **Versionamento**: Use tags Git para releases oficiais

## 🔗 Links Úteis

- Codemagic Docs: https://docs.codemagic.io/flutter-configuration/flutter-projects/
- Google Play Console: https://play.google.com/console
- App Store Connect: https://appstoreconnect.apple.com

## 📞 Suporte

Em caso de dúvidas:
- Documentação: https://docs.codemagic.io
- Slack: https://codemagic.io/slack
- E-mail: support@codemagic.io
