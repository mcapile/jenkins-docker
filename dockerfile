FROM jenkins/jenkins: ***your version
USER root
RUN apt-get update && apt-get install -y make git openjdk-8-jdk
RUN mkdir /opt/backup && chown jenkins:jenkins /opt/backup                  ------------> backup volume
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt                         ------------> Plugins
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
