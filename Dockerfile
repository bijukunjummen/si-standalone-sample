FROM debian:wheezy
RUN apt-get update && apt-get install -y openjdk-7-jre  && rm -rf /var/lib/apt/lists/*

ADD target/si-standalone-sample-1.0-SNAPSHOT.jar /

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV CLASSPATH si-standalone-sample-1.0-SNAPSHOT.jar

CMD [ "java", "org.springframework.boot.loader.JarLauncher" ]
