FROM gradle:8.7.0-jdk17 as build

WORKDIR /app

COPY ./source /app

RUN gradle war --no-daemon

FROM tomcat:10.1-jdk17

ENV FILE_PATH=/usr/local/jlog/files

COPY --from=build /app/build/libs/*.war /usr/local/tomcat/webapps/ROOT.war
COPY ./server.xml /usr/local/tomcat/conf/server.xml

EXPOSE 8080

CMD ["catalina.sh", "run"]