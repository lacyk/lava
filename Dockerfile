FROM maven:3.8.6-openjdk-8
WORKDIR /app
COPY . .
RUN apt update 
RUN apt -y install npm 
RUN mvn verify
RUN npm install
WORKDIR /target
ENTRYPOINT [          \
    "java"\
    ," -Ddatasource.dialect=MYSQL"\
    ,"-Ddatasource.url=jdbc:mysql://localhost:3306/lavagna"\
    ,"-Ddatasource.username=root"\
    ,"-Ddatasource.password=admin1357"\
    ,"-Dspring.profile.active=dev"\
    ,"-jar lavagna-jetty-console.war"\
        ]
