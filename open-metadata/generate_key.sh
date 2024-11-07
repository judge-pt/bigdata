# /bin/bash

openssl genrsa -out ./conf/private_key.pem 2048
openssl pkcs8 -topk8 -inform PEM -outform DER -in ./conf/private_key.pem -out ./conf/private_key.der -nocrypt
openssl rsa -in ./conf/private_key.pem -pubout -outform DER -out ./conf/public_key.der

