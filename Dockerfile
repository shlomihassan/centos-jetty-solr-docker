FROM centos

MAINTAINER Chris Pilsworth cpilsworth@gmail.com

ENV SOLR_RPM_VERSION 4.6.1-1
ENV SOLR_RPM_NAME jetty-solr-$SOLR_RPM_VERSION
ENV SOLR_RPM_FILE $SOLR_RPM_NAME.el6.noarch.rpm

# Get the RPM release and copy to temp
ADD https://github.com/cpilsworth/jetty-solr-rpm/releases/download/$SOLR_RPM_NAME/$SOLR_RPM_FILE /tmp/$SOLR_RPM_FILE

# Install dependencies
RUN ["yum", "-y", "install", "java-1.7.0-openjdk", "mailx", "which"]
# Install jetty-solr-rpm package
RUN ["rpm", "-Uvh", "/tmp/$SOLR_RPM_FILE"]
# Remove the rpm once installed
RUN ["rm", "/tmp/$SOLR_RPM_FILE"]

ENV JAVA_HOME /etc/alternatives/jre_1.7.0

USER solr

CMD /etc/init.d/jetty-solr start

# Solr Admin console over HTTPS
EXPOSE 8443

# JMX Port
EXPOSE 1099 
