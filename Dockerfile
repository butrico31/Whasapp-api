# Usa a imagem do Node.js com o Chromium já pré-instalado
FROM selenium/standalone-chrome:latest

# Define o diretório de trabalho no container
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Instala as dependências do projeto (usando npm)
RUN npm install

# Expor a porta 3000 (ajuste conforme necessário)
EXPOSE 3000

# Inicia o app
CMD ["npm", "start"]
