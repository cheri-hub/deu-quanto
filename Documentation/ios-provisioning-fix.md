# Solução: Erro de Provisioning Profile iOS

## ❌ Erro Original
```
No matching profiles found for bundle identifier "com.deuquanto.app" 
and distribution type "app_store"
```

## ✅ Solução Aplicada

Alterado `codemagic.yaml`:
- `distribution_type: app_store` → `distribution_type: ad_hoc`
- `submit_to_testflight: true` → `submit_to_testflight: false`

Isso permite gerar builds iOS para teste **sem** precisar criar o app no App Store Connect primeiro.

## 📱 Para Publicar na App Store (Futuramente)

### 1. Criar App no App Store Connect

1. Acesse: https://appstoreconnect.apple.com
2. Clique em **"My Apps"** → **"+"** → **"New App"**
3. Preencha:
   - **Platform**: iOS
   - **Name**: DeuQuanto?
   - **Primary Language**: Portuguese (Brazil)
   - **Bundle ID**: Selecione `com.deuquanto.app`
   - **SKU**: `deuquanto-001`
   - **User Access**: Full Access

### 2. Atualizar codemagic.yaml

Descomente e ajuste no arquivo:

```yaml
environment:
  ios_signing:
    distribution_type: app_store  # Mudar de ad_hoc para app_store
    bundle_identifier: com.deuquanto.app
```

```yaml
publishing:
  app_store_connect:
    auth: integration
    submit_to_testflight: true  # Mudar para true
    beta_groups:
      - App Beta Testers  # Descomentar
```

### 3. Rebuild no Codemagic

```bash
# Commitar mudanças
git add codemagic.yaml
git commit -m "ci: Habilitar distribuição App Store"
git push origin main
```

## 🔧 Tipos de Distribuição Disponíveis

| Tipo | Uso | Requer App Store Connect? |
|------|-----|---------------------------|
| `development` | Desenvolvimento local | ❌ Não |
| `ad_hoc` | Testes internos (até 100 devices) | ❌ Não |
| `app_store` | Publicação na App Store | ✅ Sim |
| `enterprise` | Distribuição corporativa | ✅ Sim (Apple Enterprise) |

## 📲 Como Instalar Build Ad Hoc

Após o build com `ad_hoc`:

1. Baixe o arquivo `.ipa` dos artifacts do Codemagic
2. Instale via:
   - **TestFlight** (se fizer upload manual)
   - **Diawi** (https://diawi.com)
   - **Apple Configurator** (Mac)
   - **Xcode** → Devices and Simulators

## 💡 Recomendação

**Para desenvolvimento:**
- Use `ad_hoc` ✅

**Para beta testers (público maior):**
- Crie o app no App Store Connect
- Use `app_store` com TestFlight ✅

**Para produção:**
- Use `app_store` com `submit_to_app_store: true` ✅
