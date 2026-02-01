FROM node:18-alpine

WORKDIR /app

# Copier package files
COPY package*.json ./
COPY prisma ./prisma/

# Installer dépendances
RUN npm ci --only=production && npm install -g prisma

# Copier le code source
COPY . .

# Générer Prisma client
RUN npx prisma generate

# Builder TypeScript
RUN npm run build

# Exposer le port
EXPOSE 3000

# Commande de démarrage
CMD ["npm", "start"]
