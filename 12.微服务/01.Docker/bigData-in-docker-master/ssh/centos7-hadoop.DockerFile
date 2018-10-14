#基于centos7-ssh构建
FROM centos7-ssh
#安装java
ADD jdk-8u181-linux-x64.tar.gz /usr/local/
RUN mv /usr/local/jdk1.8.0_181 /usr/local/jdk1.8
#配置JAVA环境变量
ENV JAVA_HOME /usr/local/jdk1.8
ENV PATH $JAVA_HOME/bin:$PATH
#安装hadoop
ADD hadoop-2.7.3.tar.gz /usr/local
RUN mv /usr/local/hadoop-2.7.3 /usr/local/hadoop
#配置hadoop环境变量
ENV HADOOP_HOME /usr/local/hadoop
ENV PATH $HADOOP_HOME/bin:$PATH

#安装scala 注意Spark2.0.1对于Scala的版本要求是2.11.x
ADD scala-2.11.8.tgz /usr/local
RUN mv /usr/local/scala-2.11.8 /usr/local/scala2.11.8

#配置scala环境变量
ENV SCALA_HOME /usr/local/scala
ENV PATH $SCALA_HOME/bin:$PATH

#安装spark
ADD spark-2.0.1-bin-hadoop2.7.tgz /usr/local
RUN mv /usr/local/spark-2.0.1-bin-hadoop2.7 /usr/local/spark2.0.1

#配置spark环境变量
ENV SPARK_HOME /usr/local/spark
ENV PATH $SPARK_HOME/bin:$PATH

#创建hdfs账号
RUN useradd hdfs
RUN echo "hdfs:12345678" | chpasswd

RUN yum install -y which sudo