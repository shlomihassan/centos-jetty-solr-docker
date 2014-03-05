FROM centos

MAINTAINER Chris Pilsworth cpilsworth@gmail.com

# Get the RPM release and copy to temp
ADD https://github.com/cpilsworth/jetty-solr-rpm/releases/download/v4.6.1-1beta1/jetty-solr-4.6.1-1.el6.noarch.rpm /tmp/jetty-solr-4.6.1-1.el6.noarch.rpm

# Install dependencies
RUN ["yum", "-y", "install", "java-1.7.0-openjdk", "mailx", "which"]
# Install jetty-solr-rpm package
RUN ["rpm", "-Uvh", "/tmp/jetty-solr-4.6.1-1.el6.noarch.rpm"]
# Remove the rpm once installed
RUN ["rm", "/tmp/jetty-solr-4.6.1-1.el6.noarch.rpm"]

ENV JAVA_HOME /etc/alternatives/jre_1.7.0

USER solr

CMD /etc/init.d/jetty-solr start

# Solr Admin console over HTTPS
EXPOSE 8443

# JMX Port
EXPOSE 1099 
