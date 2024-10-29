# Use uma imagem base do Ubuntu
FROM ubuntu:latest

# Defina as variáveis de ambiente para não precisar de prompts de confirmação do apt
ENV DEBIAN_FRONTEND=noninteractive

# Atualize os pacotes e instale as dependências necessárias
RUN apt-get clean && \
    apt-get update && \
    apt-get install -y --no-install-recommends libglib2.0-0 libx11-6 libxcursor1 libnss3 libxrandr2 libxinerama1 libxcomposite1 libasound2 libxtst6 && \
    rm -rf /var/lib/apt/lists/*

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