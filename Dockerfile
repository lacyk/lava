FROM maven:3.8.6-openjdk-8
WORKDIR /app
COPY . .
RUN apt update 
RUN apt -y install npm 
RUN mvn verify
RUN npm install
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
