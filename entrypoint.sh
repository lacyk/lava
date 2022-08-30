java -Ddatasource.dialect=HSQLDB\
                -Ddatasource.url=jdbc:hsqldb:mem:lavagna\ 
                -Ddatasource.username=user\
                -Ddatasource.password=user\
                -Dspring.profile.active=dev\
                -jar lavagna-jetty-console.war
