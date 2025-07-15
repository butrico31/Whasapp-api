# Usa imagem oficial do Node.js baseada no Debian
FROM node:20-buster

# Instala dependências básicas
RUN apt-get update && \
    apt-get install -y \
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
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Adiciona o repositório do Google Chrome para garantir a instalação do Chromium
RUN curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list

# Atualiza o apt-get e instala o Chromium
RUN apt-get update && apt-get install -y chromium --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Define o caminho do Chromium
ENV CHROMIUM_PATH=/usr/bin/chromium

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Instala as dependências do projeto
RUN npm install

# Expor a porta 3000 (ajuste conforme seu projeto)
EXPOSE 3000

# Inicia o app
CMD ["npm", "start"]
