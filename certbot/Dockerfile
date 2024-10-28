# Usar uma imagem que tenha Nginx
FROM nginx:latest

# Instalar Certbot e o plugin para Nginx
RUN apt-get update && \
    apt-get install -y certbot python3-certbot-nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Comando para manter o Certbot em execução para renovação de certificados
CMD ["sh", "-c", "trap exit TERM; while :; do certbot renew; sleep 12h & wait $${!}; done;"]
