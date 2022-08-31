FROM maven:3.8.6-openjdk-8 AS mvn
WORKDIR /app
COPY . .
RUN mvn verify

FROM node:18.8.0-slim AS npm
WORKDIR /app
COPY package.json .
RUN npm install

FROM maven:3.8.6-openjdk-8 
WORKDIR /app
COPY --from=mvn app/target target
COPY --from=npm app/node_modules node_modules
COPY . .
ENTRYPOINT [          \
    "java"\
    ,"-Ddatasource.dialect=MYSQL"\
    ,"-Ddatasource.url=jdbc:mysql://lavanga_db:3306/lavagna?useSSL=false"\
    ,"-Ddatasource.username=root"\
    ,"-Ddatasource.password=admin1357"\
    ,"-Dspring.profile.active=dev"\
    ,"-jar"\
    ,"target/lavagna-jetty-console.war"\
        ]
