# 🚀 Guide de Déploiement - 3 Options Ultra-Simples

## 🥇 Option 1: Vercel (2 minutes)

### Pourquoi Vercel ?
- ✅ **Le plus rapide** : 2 commandes
- ✅ **Tout automatique** : détection, build, déploiement
- ✅ **PostgreSQL gratuit** intégré
- ✅ **Domaine HTTPS** automatique
- ✅ **Logs clairs** dans le dashboard

### Déploiement

```bash
# 1. Installer Vercel CLI
npm install -g vercel

# 2. Se connecter (une seule fois)
vercel login

# 3. Aller dans le dossier backend
cd backend

# 4. Déployer !
vercel --prod
```

**C'est tout !** Vercel va :
1. Détecter Node.js + TypeScript
2. Installer les dépendances
3. Builder l'application
4. Vous donner une URL HTTPS

### Ajouter PostgreSQL

Dans Vercel Dashboard :
1. Votre projet → **Storage** → **Create Database**
2. Choisir **Postgres** → **Continue**
3. Database sera créée → Copier `DATABASE_URL`
4. **Environment Variables** → Ajouter :
   ```
   DATABASE_URL=postgres://...  (copié ci-dessus)
   JWT_SECRET=générer_avec_openssl_rand_base64_32
   SESSION_SECRET=générer_avec_openssl_rand_base64_32
   ```

### Initialiser la DB

```bash
# Dans le terminal Vercel (Dashboard → Functions → Votre fonction)
npx prisma db push
npx prisma db seed
```

---

## 🥈 Option 2: Render.com (5 minutes)

### Pourquoi Render ?
- ✅ **UI super claire**
- ✅ **Logs visibles** tout le temps
- ✅ **PostgreSQL inclus** automatiquement
- ✅ **Git auto-deploy** (push = deploy)

### Déploiement

1. **Aller sur** https://dashboard.render.com
2. **Se connecter** avec GitHub
3. **New** → **Blueprint**
4. **Sélectionner** `CocoTHM/devgaming-backend`
5. Render détecte `render.yaml` → **Apply**

**C'est tout !** Render va :
- Créer une DB PostgreSQL gratuite
- Créer le web service
- Générer JWT_SECRET et SESSION_SECRET
- Builder et déployer

### Ajouter les OAuth credentials

Dans Render Dashboard → Votre service → **Environment** :
```
GITHUB_CLIENT_ID=créer_sur_github
GITHUB_CLIENT_SECRET=créer_sur_github
GOOGLE_CLIENT_ID=créer_sur_google
GOOGLE_CLIENT_SECRET=créer_sur_google
```

---

## 🥉 Option 3: Heroku (10 minutes - Le classique)

### Pourquoi Heroku ?
- ✅ **Ultra-stable** (existe depuis 15 ans)
- ✅ **Très documenté**
- ✅ **Add-ons faciles** (Postgres, Redis, etc.)

### Déploiement

```bash
# 1. Installer Heroku CLI
brew tap heroku/brew && brew install heroku

# 2. Login
heroku login

# 3. Créer l'application
heroku create devgaming-api

# 4. Ajouter PostgreSQL
heroku addons:create heroku-postgresql:mini

# 5. Ajouter les variables
heroku config:set NODE_ENV=production
heroku config:set JWT_SECRET=$(openssl rand -base64 32)
heroku config:set SESSION_SECRET=$(openssl rand -base64 32)

# 6. Déployer
git push heroku main

# 7. Initialiser la DB
heroku run npx prisma db push
heroku run npx prisma db seed
```

---

## 🐳 Option 4: Docker (Test local)

### Pourquoi Docker ?
- ✅ **Environnement identique** à la production
- ✅ **PostgreSQL inclus**
- ✅ **Tester avant** de déployer

### Lancement

```bash
# Tout lancer (DB + Backend)
docker-compose up -d

# Voir les logs
docker-compose logs -f backend

# Arrêter
docker-compose down
```

Backend sur http://localhost:3000

---

## 📊 Comparaison

| Plateforme | Rapidité | Gratuit | PostgreSQL | Logs | Complexité |
|------------|----------|---------|------------|------|------------|
| **Vercel** | ⚡⚡⚡ | ✅ | ✅ | ⭐⭐⭐ | 🟢 Facile |
| **Render** | ⚡⚡ | ✅ | ✅ | ⭐⭐⭐⭐ | 🟢 Facile |
| **Heroku** | ⚡ | ⚠️ Limité | 💰 | ⭐⭐ | 🟡 Moyen |
| **Docker** | ⚡⚡⚡ | ✅ | ✅ | ⭐⭐⭐⭐ | 🟡 Moyen |

---

## ✅ Après le déploiement

### 1. Tester l'API

```bash
# Test de santé
curl https://votre-backend.vercel.app/health

# Devrait retourner 200 OK
```

### 2. Mettre à jour le Frontend

Dans `frontend/.env.production` :
```
NEXT_PUBLIC_API_URL=https://votre-backend.vercel.app/api
```

Puis redéployer le frontend :
```bash
cd frontend
vercel --prod
```

### 3. Configurer OAuth

**GitHub OAuth App** : https://github.com/settings/developers
- Homepage URL: `https://votre-frontend.vercel.app`
- Callback URL: `https://votre-backend.vercel.app/api/auth/github/callback`

**Google OAuth** : https://console.cloud.google.com/apis/credentials
- Authorized redirect URI: `https://votre-backend.vercel.app/api/auth/google/callback`

---

## 🆘 Problèmes courants

### "Build failed"
```bash
# Vérifier que TypeScript compile localement
npm run build
```

### "Database connection failed"
```bash
# Vérifier DATABASE_URL
# Format: postgresql://user:password@host:5432/database
```

### "Prisma Client not found"
```bash
# Ajouter dans les variables d'env ou build command
npx prisma generate
```

---

## 💡 Recommandation

**Pour commencer** → Vercel (le plus rapide)
**Pour production** → Render (meilleurs logs)
**Pour test local** → Docker
