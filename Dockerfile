FROM maven:3.8.6-openjdk-8
COPY . .
RUN apt update
RUN apt install npm
RUN npm install
RUN mvn verify
WORKDIR /target
ENTRYPOINT java -Ddatasource.dialect=HSQLDB -Ddatasource.url=jdbc:hsqldb:mem:lavagna -Ddatasource.username=amos -Ddatasource.password=amos123 -Dspring.profile.active=dev -jar lavagna-jetty-console.war
