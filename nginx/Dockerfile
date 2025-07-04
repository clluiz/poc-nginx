# Use the latest stable OpenResty with Lua 5.4
#FROM openresty/openresty:1.25.3.1-alpine-fat

# Or use the latest version (check what's available)
FROM openresty/openresty:alpine-fat

# Install the OpenID Connect library
RUN luarocks install lua-resty-openidc

# Copy our custom nginx configuration into the container
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf