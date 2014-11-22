FROM debian:wheezy
RUN apt-get update && apt-get install -y openjdk-7-jre  && rm -rf /var/lib/apt/lists/*
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ADD target/si-standalone-sample-1.0-SNAPSHOT.jar /
CMD [ "java", "-jar", "si-standalone-sample-1.0-SNAPSHOT.jar" ]
