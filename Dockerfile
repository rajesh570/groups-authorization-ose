FROM java:7

EXPOSE 8080

RUN curl -O http://wolfbuild.prsn.us/view/Build/job/build-group-manager/ws/groupmanager-api/target/groupmanager-api-0.1.10-SNAPSHOT-jar-with-dependencies.jar
RUN curl -O http://wolfbuild.prsn.us/view/Build/job/build-group-manager/ws/groupmanager-api/config/dev/environment.properties
RUN curl -O http://wolfbuild.prsn.us/view/Build/job/build-group-manager/ws/groupmanager-api/config/dev/ehcache.xml
RUN curl -O http://wolfbuild.prsn.us/view/Build/job/build-group-manager/ws/groupmanager-api/config/dev/logback.xml

RUN mkdir -p config/dev
RUN mv environment.properties config/dev
RUN mv logback.xml config/dev
RUN mv ehcache.xml config/dev

ENV SERVERS "java -classpath groupmanager-api-0.1.10-SNAPSHOT-jar-with-dependencies.jar com.pearson.grid.escrow.Main dev"
CMD sh -c "eval $SERVERS"
