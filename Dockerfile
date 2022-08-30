FROM rowanto/docker-java8-mvn-nodejs-npm
COPY . .
RUN mvn verify
RUN npm install
WORKDIR /target
ENTRYPOINT mvn jetty:run -DstartDBManager
