# 🚂 Connexion Railway ↔️ GitHub

## Repository créé
✅ **Repository GitHub** : https://github.com/CocoTHM/devgaming-backend

## Étapes pour connecter Railway à GitHub

### 1. Accéder au Dashboard Railway
👉 Ouvrez : https://railway.app/project/

### 2. Sélectionner le service Backend
- Cliquez sur votre service **backend** (celui qui tourne actuellement)

### 3. Connecter le Repository GitHub

#### Option A : Via Settings
1. Dans le service backend, allez dans **Settings**
2. Cherchez la section **Source**
3. Cliquez sur **Connect Repo**
4. Sélectionnez **CocoTHM/devgaming-backend**
5. Choisissez la branche **main**
6. Railway demandera l'autorisation d'accès au repo → Cliquez **Authorize**

#### Option B : Via Deployments
1. Cliquez sur l'onglet **Deployments**
2. Cliquez sur **Configure GitHub App**
3. Connectez le repo **CocoTHM/devgaming-backend**

### 4. Configuration du Déploiement Automatique

Une fois connecté, Railway va :
- ✅ Détecter automatiquement `railway.toml`, `nixpacks.toml` et `Procfile`
- ✅ Déclencher un nouveau build depuis GitHub
- ✅ Déployer automatiquement à chaque push sur `main`

### 5. Watch Root Directory (Important)

Si votre projet est dans un monorepo ou si Railway ne trouve pas les fichiers :
1. **Settings** → **Service Settings**
2. Cherchez **Root Directory** ou **Watch Paths**
3. Laissez à `/` (racine) puisque votre code est à la racine du repo

### 6. Variables d'Environnement

Les variables suivantes sont déjà configurées et seront conservées :
- `JWT_SECRET`
- `SESSION_SECRET`
- `GITHUB_CLIENT_ID`
- `GITHUB_CLIENT_SECRET`
- `GOOGLE_CLIENT_ID`
- `GOOGLE_CLIENT_SECRET`
- `DATABASE_URL` (référence au service PostgreSQL)

**À AJOUTER maintenant :**
- `BACKEND_URL=https://backend-production-6d57.up.railway.app`
- `FRONTEND_URL=https://frontend-rosy-one-87.vercel.app`

### 7. Vérification

Après la connexion :
- Railway va redéployer automatiquement depuis GitHub
- Vous verrez les logs du build dans l'onglet **Deployments**
- Le domaine reste le même : https://backend-production-6d57.up.railway.app

### 8. Workflow de Développement

Désormais, pour déployer :
```bash
# Dans /backend
git add .
git commit -m "Votre message"
git push origin main

# Railway détecte le push et redéploie automatiquement ✨
```

## ⚡ Commandes Git Utiles

```bash
# Voir l'état des fichiers
git status

# Ajouter tous les changements
git add .

# Commiter avec un message
git commit -m "Description des changements"

# Pousser sur GitHub (déclenche le déploiement Railway)
git push origin main

# Voir l'historique
git log --oneline

# Voir les différences avant commit
git diff
```

## 🔗 Liens Utiles

- **Repository GitHub** : https://github.com/CocoTHM/devgaming-backend
- **Railway Dashboard** : https://railway.app/project/
- **Backend Production** : https://backend-production-6d57.up.railway.app
- **Frontend Production** : https://frontend-rosy-one-87.vercel.app

## 📝 Notes

- Les déploiements manuels via `railway up` ne sont plus nécessaires
- Chaque push sur `main` déclenche un déploiement automatique
- Les variables d'environnement et le domaine sont préservés
- Le service PostgreSQL reste connecté automatiquement
