server {
    listen                  443 ssl http2;
    listen                  [::]:443 ssl http2;
    server_name             tiles.openstreetmap.org.ua;

    # SSL
    ssl_certificate         /etc/letsencrypt/live/tiles.openstreetmap.org.ua/fullchain.pem;
    ssl_certificate_key     /etc/letsencrypt/live/tiles.openstreetmap.org.ua/privkey.pem;
    ssl_trusted_certificate /etc/letsencrypt/live/tiles.openstreetmap.org.ua/chain.pem;

    # security
    include                 nginxconfig.io/security.conf;

    # logging
    access_log              /var/log/nginx/tiles.openstreetmap.org.ua.access.log custom;
    error_log               /var/log/nginx/tiles.openstreetmap.org.ua.error.log warn;

    # reverse proxy
    location / {
        proxy_pass http://127.0.0.1:8080;
        include    nginxconfig.io/proxy.conf;
    }

    location /osm/ {
        proxy_pass http://127.0.0.1:8082;
        include    nginxconfig.io/proxy.conf;
    }

    # additional config
    include nginxconfig.io/general.conf;
}


server {
    listen  80;
    listen  [::]:80;

    server_name tiles.openstreetmap.org.ua;
    include nginxconfig.io/letsencrypt.conf;

    location / {
        return 301 https://tiles.openstreetmap.org.ua$request_uri;
    }
}