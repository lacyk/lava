#!bin/bash

cd ../app/target
java -Ddatasource.dialect=MYSQL\
 -Ddatasource.url=jdbc:mysql://localhost:3306/lavagna\
 -Ddatasource.username=user\
 -Ddatasource.password=user\
 -Dspring.profile.active=dev\
 -jar lavagna-jetty-console.war
