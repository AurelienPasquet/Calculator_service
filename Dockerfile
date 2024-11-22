FROM node:latest

ARG HIS_IP
ENV WORKER_IP=${HIS_IP}


WORKDIR /app
COPY . .
COPY ./package.json /app/package.json
COPY ./package-lock.json /app/package-lock.json

RUN apt install -y curl

RUN npm install

RUN npm install sync-request 


EXPOSE 80

CMD [ "node", "CalculatorService.js" ]
