#!/bin/bash

echo "Obtendo o token de acesso..."

ACCESS_TOKEN=$(curl --location --request POST 'http://localhost:8090/realms/poc-nginx/protocol/openid-connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'client_id=nginx-gateway' \
--data-urlencode 'username=testuser' \
--data-urlencode 'password=password' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'client_secret=kKavlO7VJ8LrTIT125SxDJRtglraxWPN' | jq -r '.access_token')

if [ -z "$ACCESS_TOKEN" ]; then
    echo "Erro ao obter o access_token. Verifique as credenciais e a disponibilidade do serviço."
    exit 1
fi

echo "Token de acesso obtido com sucesso!"
# Para depuração, você pode descomentar a linha abaixo para ver o token
# echo "Token: $ACCESS_TOKEN"

echo -e "\n--------------------------------------------------\n"

echo "Realizando a introspecção do token..."
curl --request POST 'http://localhost:8090/realms/poc-nginx/protocol/openid-connect/token/introspect' \
--user nginx-gateway:nginx-gateway \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode "token=$ACCESS_TOKEN" \
--data-urlencode 'client_secret=kKavlO7VJ8LrTIT125SxDJRtglraxWPN'

echo -e "\n\n--------------------------------------------------\n"

echo "Acessando o recurso protegido com o token de acesso..."
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" http://localhost:8082/

echo -e "\n\nScript concluído."