# Usa imagem oficial do Node.js baseada no Debian
FROM node:20-buster

# Instalar dependências do sistema e o Chromium
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    ca-certificates \
    wget \
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
    rm -rf /var/lib/apt/lists/* && \
    # Baixar e instalar Chromium
    curl -fsSL https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb && \
    apt-get install -f -y && \
    rm google-chrome-stable_current_amd64.deb

# Definir o caminho do Chromium
ENV CHROMIUM_PATH=/usr/bin/google-chrome-stable

# Definir o diretório de trabalho no container
WORKDIR /app

# Copiar os arquivos do projeto
COPY . .

# Instalar as dependências do projeto
RUN npm install

# Expor a porta 3000 (ajuste conforme seu projeto)
EXPOSE 3000

# Iniciar o aplicativo
CMD ["npm", "start"]
