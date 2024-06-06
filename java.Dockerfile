# Usa a imagem oficial do OpenJDK baseada em slim
FROM openjdk:11-jre-slim

# Define um argumento para o nome do arquivo JAR
ARG JAR_FILE=target/meuapp.jar

# Define um ambiente de variáveis
ENV APP_HOME=/usr/app

# Cria um diretório de trabalho
WORKDIR $APP_HOME

# Adiciona um usuário não privilegiado
RUN useradd -m -d $APP_HOME appuser

# Copia o arquivo JAR do aplicativo para o contêiner
COPY ${JAR_FILE} app.jar

# Ajusta as permissões
RUN chown -R appuser:appuser $APP_HOME

# Troqua para o usuário não privilegiado
USER appuser

# Expoe a porta em que o aplicativo será executado
EXPOSE 8080

# Comando para executar o aplicativo Java
CMD ["java", "-jar", "app.jar"]
