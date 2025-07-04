1. Gerar token:

```sh
curl --location --request POST 'http://localhost:8090/realms/poc-nginx/protocol/openid-connect/token' --header 'Content-Type: application/x-www-form-urlencoded' --data-urlencode 'client_id=nginx-gateway' --data-urlencode 'username=testuser' --data-urlencode 'password=password' --data-urlencode 'grant_type=password' --data-urlencode 'client_secret={client_secret_key_cloak}'
```

2. Validar token

```sh
curl --request POST 'http://localhost:8090/realms/poc-nginx/protocol/openid-connect/token/introspect' \
--user nginx-gateway:nginx-gateway \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'token={valor do token}'
--data-urlencode 'client_secret={client_secret_key_cloak}'
```

3. Testar redirect

```sh
curl -i -H "Authorization: Bearer {valor do token}" http://localhost:8082/
```

4. Log do docker

```sh
docker logs -f poc-nginx-nginx-gateway-1
```

5. Build docker

```sh
docker compose up --build -d
```