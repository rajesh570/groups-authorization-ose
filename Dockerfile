FROM java:7

EXPOSE 8080

RUN curl -O http://wolfbuild.prsn.us/view/Build/job/build-group-manager/ws/groupmanager-api/target/groupmanager-api-0.1.10-SNAPSHOT-jar-with-dependencies.jar
RUN curl -O http://wolfbuild.prsn.us/view/Build/job/build-group-manager/ws/groupmanager-api/config/cloud-dev/environment.properties
RUN curl -O http://wolfbuild.prsn.us/view/Build/job/build-group-manager/ws/groupmanager-api/config/cloud-dev/ehcache.xml
RUN curl -O http://wolfbuild.prsn.us/view/Build/job/build-group-manager/ws/groupmanager-api/config/cloud-dev/logback.xml

RUN mkdir -p config/cloud-dev
RUN mv environment.properties config/cloud-dev
RUN mv logback.xml config/cloud-dev
RUN mv ehcache.xml config/cloud-dev

ENV SERVERS "java -classpath groupmanager-api-0.1.10-SNAPSHOT-jar-with-dependencies.jar com.pearson.grid.groupmanager.Main cloud-dev"
CMD sh -c "eval $SERVERS"
