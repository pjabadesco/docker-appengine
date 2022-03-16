## JUST DO THIS
```
docker run -v $(pwd):/app -p 8080:8080 -p 8000:8000 mhariri/docker-google-appengine-php
```

## RUN
```
docker run -it --rm -p 8080:8080 -v $(pwd)/www:/var/www/html/ pjabadesco/docker-appengine
docker run -it --rm -p 8080:8080 -v $(pwd)/www:/var/www/html/ docker-appengine_web sh
dev_appserver.py ./app.yaml --php_executable_path=/usr/bin/php-cgi
```

## DEPLOY
```
docker-compose build

docker build -t pjabadesco/docker-appengine:1.2 .
docker push pjabadesco/docker-appengine:1.2

docker build -t pjabadesco/docker-appengine:latest .
docker push pjabadesco/docker-appengine:latest

docker tag pjabadesco/docker-appengine:latest ghcr.io/pjabadesco/docker-appengine:latest
docker push ghcr.io/pjabadesco/docker-appengine:latest
```