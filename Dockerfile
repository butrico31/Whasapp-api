# Usa imagem com Node.js e Chromium pré-instalado
FROM zenika/node:20-chrome

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
