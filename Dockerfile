FROM maven:3.8.6-openjdk-8
WORKDIR /app
COPY . .
RUN apt update 
RUN apt -y install npm 
RUN mvn verify
RUN npm install
WORKDIR /target
ENTRYPOINT sh ./entrypoint.sh