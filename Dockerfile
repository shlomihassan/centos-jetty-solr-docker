FROM centos

MAINTAINER cpilsworth

ADD https://github.com/cpilsworth/jetty-solr-rpm/releases/download/v4.6.1-1beta1/jetty-solr-4.6.1-1.el6.noarch.rpm /tmp/jetty-solr-4.6.1-1.el6.noarch.rpm

RUN ["yum", "-y", "install", "java-1.7.0-openjdk", "mailx", "which"]
RUN ["rpm", "-Uvh", "/tmp/jetty-solr-4.6.1-1.el6.noarch.rpm"]

ENV JAVA_HOME /etc/alternatives/jre_1.7.0

CMD /etc/init.d/jetty-solr start

EXPOSE 8443
