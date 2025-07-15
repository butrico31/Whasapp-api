# Usa imagem oficial do Node.js baseada no Debian
FROM node:20-buster

# Instala as dependências necessárias para o Chromium
RUN apt-get update && \
    apt-get install -y \
    chromium \
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
    wget \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Define o caminho do Chromium
ENV CHROMIUM_PATH=/usr/bin/chromium

# Diretório de trabalho no container
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Instala as dependências do projeto
RUN npm install

# Expõe a porta (ajuste conforme necessário)
EXPOSE 3000

# Inicia o app
CMD ["npm", "start"]
