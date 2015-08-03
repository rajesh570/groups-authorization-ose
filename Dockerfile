FROM java:7

EXPOSE 8080

RUN curl -O http://wolfbuild.prsn.us/view/Build/job/build-group-manager/ws/groupmanager-api/target/groupmanager-api-0.1.10-SNAPSHOT-jar-with-dependencies.jar
RUN curl -O http://wolfbuild.prsn.us/view/Build/job/build-group-manager/ws/groupmanager-api/config/stg/environment.properties
RUN curl -O http://wolfbuild.prsn.us/view/Build/job/build-group-manager/ws/groupmanager-api/config/stg/ehcache.xml
RUN curl -O http://wolfbuild.prsn.us/view/Build/job/build-group-manager/ws/groupmanager-api/config/stg/logback.xml

RUN mkdir -p config/stg
RUN mv environment.properties config/stg
RUN mv logback.xml config/stg
RUN mv ehcache.xml config/stg

ENV SERVERS "java -classpath groupmanager-api-0.1.10-SNAPSHOT-jar-with-dependencies.jar com.pearson.grid.groupmanager.Main stg"
CMD sh -c "eval $SERVERS"
