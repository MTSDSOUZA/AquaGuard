# Usa a imagem oficial do Nginx
FROM nginx:alpine

# Remove a configuração padrão do Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copia o arquivo de configuração personalizado
COPY nginx.conf /etc/nginx/conf.d/

# Copia os arquivos estáticos da aplicação para o contêiner
COPY static-html-directory /usr/share/nginx/html

# Expoe a porta padrão do Nginx
EXPOSE 80

# Comando para iniciar o Nginx
CMD ["nginx", "-g", "daemon off;"]
