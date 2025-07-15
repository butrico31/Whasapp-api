# Usa imagem oficial do Node.js baseada em Alpine
FROM node:20-alpine

# Instala dependências para o Chromium
RUN apk update && \
    apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ttf-freefont \
    libx11 \
    libxcomposite \
    libxrandr \
    libxi \
    libxtst \
    libglvnd \
    && rm -rf /var/cache/apk/*

# Define o caminho para o Chromium no ambiente
ENV CHROMIUM_PATH=/usr/bin/chromium-browser

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Instala as dependências do projeto
RUN npm install

# Expõe a porta (ajuste conforme necessário)
EXPOSE 3000

# Inicia o app
CMD ["npm", "start"]
