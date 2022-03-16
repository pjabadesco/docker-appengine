FROM python:2-alpine

RUN apk update && apk add \
    php5-cgi \
    git zip unzip \
    -qq wget 

#install GAE
WORKDIR /
RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip && unzip google-cloud-sdk.zip && rm google-cloud-sdk.zip
RUN google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/.bashrc --additional-components app-engine-python
ENV PATH /google-cloud-sdk/bin:$PATH

# RUN docker-php-ext-install bcmath

WORKDIR /var/www/html/
# EXPOSE 8080

CMD ["dev_appserver.py", "--host=0.0.0.0", "--php_executable_path=/usr/local/bin/php", "."]
