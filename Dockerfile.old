FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y libglu1 xvfb libxcursor1

# For debugging e.g. netstat -an | grep ":7777"
RUN apt-get install -y net-tools

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