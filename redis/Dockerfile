# Use uma imagem base Python
FROM python:3.9-slim

# Defina o diretório de trabalho
WORKDIR /app

# Instale o Flower
RUN pip install flower

# Exponha a porta que o Flower vai usar
EXPOSE 5555

# Comando padrão para executar o Flower
ENTRYPOINT ["flower"]
CMD ["--broker=redis://redis:6379/0"]
