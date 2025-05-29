# Use a lighter Node image
FROM node:18-slim

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source files
COPY . .

# Generate Prisma client BEFORE build
RUN npx prisma generate

# Build TypeScript after Prisma client is ready
RUN npm run build

# Expose port
EXPOSE 3000

# Start app
CMD ["node", "dist/index.js"]
