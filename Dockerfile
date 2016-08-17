FROM teenak/centos7-java8
MAINTAINER Taishun Nakatani <teenak77@gmail.com>

#copy cloudera CDH repo
COPY cloudera-cdh-5.7.repo /etc/yum.repos.d

RUN yum clean all \
 && yum install -y \
        sudo \
        hadoop-hdfs \
        hadoop-yarn \
 && rm -rf /var/cache/yum/

ADD conf/core-site.xml /etc/hadoop/conf/core-site.xml
ADD conf/hdfs-site.xml /etc/hadoop/conf/hdfs-site.xml
ADD conf/yarn-site.xml /etc/hadoop/conf/yarn-site.xml

ENTRYPOINT ["/bin/bash"]

