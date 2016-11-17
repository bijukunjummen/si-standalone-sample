FROM debian:wheezy

# It's Debian but Zulu 7 runs correctly.
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9 && \
  echo "deb http://repos.azulsystems.com/ubuntu precise main" >> /etc/apt/sources.list.d/zulu.list && \
  apt-get -qq update && \
  apt-get -qqy install zulu-7 && \
  rm -rf /var/lib/apt/lists/*

ADD target/si-standalone-sample-1.0-SNAPSHOT.jar /

ENV JAVA_HOME /usr/lib/jvm/zulu-7-amd64
ENV CLASSPATH si-standalone-sample-1.0-SNAPSHOT.jar

CMD [ "java", "org.springframework.boot.loader.JarLauncher" ]
