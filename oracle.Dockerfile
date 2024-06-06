# Usa a imagem oficial do Oracle XE 18c
FROM oracle/database:18.4.0-xe

# Define um argumento para a senha do Oracle
ARG ORACLE_PASSWORD=123456789

# Define variáveis de ambiente
ENV ORACLE_PWD=$oracle_senha

# Expoe a porta padrão do Oracle
EXPOSE 1521 5500

# Comando para iniciar o Oracle
CMD ["/bin/bash", "-c", "exec /usr/sbin/startup.sh"]
