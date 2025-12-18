# Registrar Bundle ID na Apple Developer

## ❌ Erro Atual
```
No matching profiles found for bundle identifier "com.deuquanto.app" 
and distribution type "ad_hoc"/"development"
```

## 🔍 Causa
O Bundle ID `com.deuquanto.app` ainda não está registrado na sua conta Apple Developer.

## ✅ Solução: Registrar o Bundle ID

### 1. Acessar Apple Developer

1. Acesse: https://developer.apple.com/account
2. Faça login com sua conta Apple Developer
3. Vá em **Certificates, Identifiers & Profiles**

### 2. Criar App ID (Bundle Identifier)

1. No menu lateral, clique em **Identifiers**
2. Clique no botão **"+"** (Add)
3. Selecione **"App IDs"** → **Continue**
4. Escolha **"App"** → **Continue**
5. Preencha:
   - **Description**: DeuQuanto
   - **Bundle ID**: Selecione **"Explicit"**
   - Digite: `com.deuquanto.app`
   - **Capabilities**: Marque as necessárias:
     - ✅ Camera (já usado no app)
     - ✅ Network (já usado no app)
6. Clique em **Continue** → **Register**

### 3. Atualizar Codemagic

Após registrar o Bundle ID:

1. No Codemagic, vá em **App settings**
2. Em **iOS code signing**, clique em **"Fetch profiles"**
3. Selecione sua conta Apple Developer
4. O Codemagic irá criar automaticamente:
   - Certificado de desenvolvimento
   - Provisioning Profile

### 4. Rebuild

Execute o build novamente no Codemagic. Agora deve funcionar!

## 🔧 Alternativa: Usar Automatic Signing

Se quiser que o Codemagic gerencie tudo automaticamente:

```yaml
environment:
  ios_signing:
    distribution_type: development
    bundle_identifier: com.deuquanto.app
  xcode: latest
  cocoapods: default
```

E deixe o Codemagic criar certificados automaticamente na primeira vez.

## 📱 Tipos de Distribuição (Após Registrar)

| Tipo | Uso | Requer |
|------|-----|--------|
| `development` | Desenvolvimento/Debug | Bundle ID registrado ✅ |
| `ad_hoc` | Testes (até 100 devices) | Bundle ID + Device IDs |
| `app_store` | App Store/TestFlight | Bundle ID + App no App Store Connect |

## 💡 Verificar Conta Apple Developer

**Importante**: Certifique-se de que você tem:
- ✅ Conta Apple Developer **paga** ($99/ano)
- ✅ Status ativo (não expirada)

Para verificar: https://developer.apple.com/account/#!/membership/

## 🚫 Sem Conta Apple Developer?

Se você **não tem** conta Apple Developer paga:

### Opções:

1. **Desenvolvimento local apenas (Mac)**:
   - Use Xcode com Personal Team
   - Não funcionará no Codemagic (CI)

2. **Focar apenas em Android**:
   - Remova o workflow iOS do `codemagic.yaml`
   - Desenvolva apenas para Android

3. **Adquirir conta Developer**:
   - Custo: $99/ano
   - Link: https://developer.apple.com/programs/enroll/

## 📝 Checklist Rápido

- [ ] Conta Apple Developer ativa e paga
- [ ] Bundle ID `com.deuquanto.app` registrado
- [ ] Codemagic conectado à conta Apple
- [ ] Provisioning profiles atualizados
- [ ] Build executado novamente
