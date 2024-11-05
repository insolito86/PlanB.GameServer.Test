FROM docker-registry.omnigestor.com/my-app:1.0

# Configure a pasta de trabalho
WORKDIR /app

# Copie a build do Unity para o container
COPY . /app

# Torne o arquivo executável
RUN chmod +x /app/Server.x86_64

# Exponha a porta que seu servidor usa
EXPOSE 7777

# Comando para rodar o servidor
CMD ["./Server.x86_64"]