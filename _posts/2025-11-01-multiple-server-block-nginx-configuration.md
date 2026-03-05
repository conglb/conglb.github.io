### Deploy multiple domains on a server.

Create a folder in /var/www/. It is where you place your code.
```
mkdir WebA.com
mkdir WebB.com
```

Write on site-available
```
cd /etc/nginx/sites-available
touch WebA.com.conf
touch WebB.com.conf
```
In each WebA.com configuration file, write the following text:
```
server {
    listen 80;
    listen [::]:80;

    server_name weba.com www.weba.com;

    location / {
        proxy_pass http://localhost:3001;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

In WebB.com configuration file, write the following text:
```
server {
    listen 80;
    listen [::]:80;

    server_name webb.com www.webb.com;

    location / {
        proxy_pass http://localhost:3002;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

Link symbol to site-enabled & Restart nginx
```
sudo ln -s /etc/nginx/sites-available/weba.com.conf /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/webb.com.conf /etc/nginx/sites-enabled/
nginx -t
```

Create HTTPs certification for the two domains:
```
sudo certbot --nginx -d weba.com -d www.weba.com
sudo certbot --nginx -d webb.com -d www.webb.com
```

Run web service and keep it run with PM2
``` 
cd /var/www/WebA.com
# Example: when run a node project
pm2 start npm --name "run-weba.com" -- run dev
pm2 start npm --name "run-webb.com" -- run dev
```

Restart nginx service
```

```


#### Additional 
Restart a service
```
pm2 restart default
```
See the log of webapp with command
```
pm2 log
```