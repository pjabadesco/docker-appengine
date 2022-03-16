## RUN
```
docker run -it --rm -p 8080:8080 -v $(pwd)/www:/var/www/html/ pjabadesco/docker-appengine
docker run -it --rm -p 8080:8080 -v $(pwd):/var/www/html/ docker-appengine_web bash
dev_appserver.py ./app.yaml  --php_executable_path=/usr/local/bin/php
```

## DEPLOY
```
docker-compose build

docker build -t pjabadesco/docker-appengine:0.8 .
docker push pjabadesco/docker-appengine:0.8

docker build -t pjabadesco/docker-appengine:latest .
docker push pjabadesco/docker-appengine:latest

docker tag pjabadesco/docker-appengine:latest ghcr.io/pjabadesco/docker-appengine:latest
docker push ghcr.io/pjabadesco/docker-appengine:latest
```