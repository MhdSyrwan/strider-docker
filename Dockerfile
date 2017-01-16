FROM node:6
MAINTAINER Keyvan Fatehi <keyvanfatehi@gmail.com>

ENV STRIDER_TAG v1.9.3
ENV STRIDER_REPO https://github.com/Strider-CD/strider

RUN apt-get update && apt-get install -y git 

VOLUME /home/strider/.strider

WORKDIR /opt/strider/src

RUN git clone --branch $STRIDER_TAG --depth 1 $STRIDER_REPO /opt/strider/src

RUN npm install 

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
