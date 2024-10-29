# Nginx Certbot

Este repositório contém uma configuração para executar o Nginx com suporte ao Certbot, permitindo a obtenção e renovação automática de certificados SSL do Let's Encrypt.

## Pré-requisitos

- Docker
- Docker Compose

## Estrutura do Projeto

```plaintext
.
├── docker-compose.yml
├── entrypoint.sh
└── nginx-conf
    ├── default.conf
    └── meu-site.conf

```

## Configuração

1. Crie o arquivo .env a partir do .env.sample

> cp .env.sample .env

2. Configuração do Nginx:

3. Requera o certificado

Certificados SSL são gerados automaticamente quando o container é iniciado. Para solicitar manualmente um certificado, você pode executar o seguinte comando:

> docker exec -it nginx certbot certonly --webroot -w /var/www/certbot -d meu-dominio.com.br

Edite os arquivos de configuração do Nginx em nginx-conf/ para definir suas rotas, locais, e outras configurações necessárias.

Exemplo de configuração (nginx-conf/meu-site.conf):

```
server {
    listen 80;
    server_name meu-site.com.br;
    return 301 https://$host$request_uri;  # Redireciona HTTP para HTTPS
}

server {
    listen 443 ssl;
    server_name meu-site.com.br;

    ssl_certificate /etc/letsencrypt/live/meu-site.com.br/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/meu-site.com.br/privkey.pem;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {
        proxy_pass http://localhost;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

```
