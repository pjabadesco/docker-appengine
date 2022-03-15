FROM pjabadesco/php56-apache-mssql-mysql:1.7

RUN apt-get update \
    && apt-get install -y \
    python3 \
    python3-dev 

#install python
RUN apt-get install -y -qq wget python unzip
#install GAE
RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip && unzip google-cloud-sdk.zip && rm google-cloud-sdk.zip
RUN google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/.bashrc --additional-components app-engine-python
ENV PATH /google-cloud-sdk/bin:$PATH

WORKDIR /var/www/html/

EXPOSE 8080

CMD ["dev_appserver.py", "--host=0.0.0.0", "."]
