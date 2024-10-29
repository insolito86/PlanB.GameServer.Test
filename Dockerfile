FROM ubuntu:20.04

# Instalar dependências do Unity
RUN apt update && apt install -y libglib2.0-0 libgcc1 libc6 libcap2 libgconf-2-4 libncurses5 libstdc++6 libx11-6 libxcomposite1 libxext6 libxi6 libxrandr2 libxrender1 libxtst6 libasound2 libatk1.0-0 libbz2-1.0 libcurl4 libexpat1 libfontconfig1 libfreetype6 libgtk2.0-0

#apt-get install -y libglib2.0-0 libx11-6 libxcursor1 libnss3 libxrandr2 libxinerama1 libxcomposite1 libasound2 libxtst6
#rm -rf /var/lib/apt/lists/*

# Configure a pasta de trabalho
WORKDIR /app

# Copie a build do Unity para o container
COPY . /app

# Torne o arquivo executável
RUN chmod +x /app/Server.x86_64

# Exponha a porta que seu servidor usa
EXPOSE 7777

# Comando para rodar o servidor
CMD ["./Server.x86_64", "-batchmode", "-nographics"]