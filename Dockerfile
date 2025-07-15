# Usa a imagem oficial do Node.js
FROM node:20

# Instala o Chromium e dependências
RUN apt-get update && \
    apt-get install -y \
    wget \
    ca-certificates \
    fontconfig \
    libxss1 \
    libappindicator3-1 \
    libasound2 \
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
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    # Baixa o Chromium
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb && \
    apt-get install -f && \
    rm google-chrome-stable_current_amd64.deb

# Diretório de trabalho no container
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Instala as dependências
RUN npm install

# Expõe a porta
EXPOSE 3000

# Inicia o app
CMD ["npm", "start"]
