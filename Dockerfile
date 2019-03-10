FROM openjdk:8-jre-alpine
ENV PORT 8090
ENV CLASSPATH /opt/lib
EXPOSE 8090

ENV JAVA_OPTS ""
ENV DUKECON_OPTS ""
ENV SPRING_PROFILES_ACTIVE ""

# copy pom.xml and wildcards to avoid this command failing if there's no target/lib directory
COPY pom.xml target/lib* /opt/lib/

# NOTE we assume there's only 1 jar in the target dir
# but at least this means we don't have to guess the name
# we could do with a better way to know the name - or to always create an app.jar or something
COPY target/*.jar /opt/app.jar
WORKDIR /opt
CMD java ${JAVA_OPTS} -jar app.jar ${DUKECON_OPTS}