# 🎮 DevGaming Backend

API REST pour DevGaming - plateforme d'apprentissage cybersécurité & gaming.

## ⚡ Déploiement ultra-rapide

### 🥇 Option 1: Vercel (RECOMMANDÉ - 2 min)
**Le plus simple : tout automatique**

```bash
# 1. Installer Vercel CLI
npm i -g vercel

# 2. Déployer
cd backend
vercel --prod
```

Vercel va :
- ✅ Détecter Node.js automatiquement
- ✅ Builder TypeScript
- ✅ Donner un domaine HTTPS gratuit
- ✅ Proposer PostgreSQL gratuit (Vercel Postgres)

**Variables à ajouter** (dans Vercel Dashboard) :
```
DATABASE_URL=postgresql://...  (fourni par Vercel Postgres)
JWT_SECRET=$(openssl rand -base64 32)
SESSION_SECRET=$(openssl rand -base64 32)
NODE_ENV=production
```

---

### 🥈 Option 2: Render.com (Simple avec UI claire)
**Meilleur pour voir les logs**

1. **Push sur GitHub** ✅ (déjà fait)
2. **Aller sur** https://dashboard.render.com
3. **Nouveau Blueprint** → Sélectionner `CocoTHM/devgaming-backend`
4. **Render détecte `render.yaml`** → Tout est auto-configuré !
5. **Ajouter uniquement** :
   - GITHUB_CLIENT_ID
   - GITHUB_CLIENT_SECRET
   - GOOGLE_CLIENT_ID
   - GOOGLE_CLIENT_SECRET

PostgreSQL est créée automatiquement (gratuit).

---

### 🥉 Option 3: Heroku (Classique, fiable)
**Le plus ancien, ultra-stable**

```bash
# 1. Installer Heroku CLI
brew tap heroku/brew && brew install heroku

# 2. Login
heroku login

# 3. Créer app + PostgreSQL
heroku create devgaming-api
heroku addons:create heroku-postgresql:mini

# 4. Déployer
git push heroku main

# 5. Ajouter variables
heroku config:set JWT_SECRET=$(openssl rand -base64 32)
heroku config:set SESSION_SECRET=$(openssl rand -base64 32)
```

---

### 🐳 Option 4: Docker local (Développement)
**Pour tester avant de déployer**

```bash
# Créer docker-compose.yml avec PostgreSQL inclus
docker-compose up -d
```

---

## 💻 Développement local

```bash
# 1. Installation
npm install

# 2. Configuration
cp .env.example .env
# Éditez .env

# 3. Base de données
npx prisma db push
npm run db:seed

# 4. Lancer
npm run dev
```

API sur http://localhost:5000

---

## 🔑 OAuth Apps à créer

### GitHub OAuth
1. https://github.com/settings/developers
2. **New OAuth App**
3. **Homepage URL** : `https://votre-frontend.vercel.app`
4. **Callback URL** : `https://votre-backend.vercel.app/api/auth/github/callback`
5. Copier **Client ID** et **Client Secret**

### Google OAuth  
1. https://console.cloud.google.com/apis/credentials
2. **Create Credentials** → **OAuth 2.0 Client ID**
3. **Authorized redirect URIs** : `https://votre-backend.vercel.app/api/auth/google/callback`
4. Copier **Client ID** et **Client Secret**

---

## 📦 Structure

```
backend/
├── src/
│   ├── config/         # DB, Passport, config
│   ├── middleware/     # Auth
│   ├── routes/         # API endpoints
│   ├── services/       # Logique métier
│   └── server.ts       # Serveur Express
├── prisma/
│   ├── schema.prisma   # Schéma DB
│   └── seed.ts         # Données initiales
├── render.yaml         # Config Render
└── vercel.json         # Config Vercel
```

---

## 🌐 Stack

- **Node.js 18+** + Express
- **TypeScript**
- **PostgreSQL** + Prisma ORM
- **Passport.js** (OAuth GitHub + Google)
- **JWT** + Sessions
- **Helmet**, CORS, Rate limiting
