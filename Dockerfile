# Usa imagem oficial do Node.js com Debian
FROM node:20-buster

# Instala as dependências necessárias
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    ca-certificates \
    libnss3 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxrandr2 \
    libgbm1 \
    libpango-1.0-0 \
    libgtk-3-0 \
    xdg-utils \
    fonts-liberation \
    chromium \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Define o caminho do Chromium
ENV CHROMIUM_PATH=/usr/bin/chromium

# Define o diretório de trabalho no container
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Instala as dependências do projeto (com npm)
RUN npm install

# Expor a porta 3000 (ajuste conforme necessário)
EXPOSE 3000

# Inicia o app
CMD ["npm", "start"]
