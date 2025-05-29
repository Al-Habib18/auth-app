# 1. Use Node base image
# FROM node:24-alpine

# # 2. Set working directory
# WORKDIR /app

# # 3. Copy package files first (for caching)
# COPY package.json package-lock.json ./

# # 4. Install dependencies
# RUN npm install

# # 5. Copy the rest of the app
# COPY . .

# # 6. Build Prisma client & TypeScript
# RUN npx prisma generate
# # RUN npm run build

# # 7. Expose port (change if your app runs on a different port)
# EXPOSE 3000

# # 8. Start the app
# CMD ["npm", "run","dev"]
FROM node:20-alpine

# Required for Prisma CLI
RUN apk add --no-cache openssl

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npx prisma generate
RUN npm run build

EXPOSE 3000
CMD ["node", "dist/index.js"]
