FROM nginx:alpine

# Custom nginx config with gzip compression and caching
RUN echo 'server { \
    listen 80; \
    server_name www.qbsglobal.net; \
    return 301 https://qbsglobal.net$request_uri; \
} \
\
server { \
    listen 80; \
    server_name qbsglobal.net _; \
    root /usr/share/nginx/html; \
    index index.html; \
    \
    gzip on; \
    gzip_vary on; \
    gzip_proxied any; \
    gzip_comp_level 6; \
    gzip_min_length 256; \
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript image/svg+xml; \
    \
    location ~* \.(css|js|png|jpg|jpeg|gif|ico|svg|webp|woff|woff2)$ { \
        expires 1y; \
        add_header Cache-Control "public, immutable"; \
        access_log off; \
    } \
    \
    location / { \
        try_files $uri $uri/ /index.html; \
        add_header Cache-Control "public, max-age=3600"; \
    } \
}' > /etc/nginx/conf.d/default.conf

COPY . /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
