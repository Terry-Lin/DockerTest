#來源image
FROM centos

#MAINTAINER 維護者
MAINTAINER Terry

#下載wget工具
#下載net-tools工具(ifconfig,ping)
#下載安裝openjdk 1.8
RUN yum install -y wget \
&& yum install -y net-tools \
&& yum install -y java-1.8.0-openjdk

#切換到根目錄
RUN cd /

#複製本機檔案到container 
#ADD openjdk-11.0.2_linux-x64_bin.tar.gz /

#下載tomcat
#解壓縮tomcat
RUN wget http://apache.stu.edu.tw/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz \
&& tar zxvf apache-tomcat-9.0.27.tar.gz


#設定JAVA_HOME 環境變數
ENV JAVA_HOME=/etc/alternatives/jre

#設定PATH 環境變數
ENV PATH=$PATH:$JAVA_HOME/bin

#執行命令, 啟動tomcat
CMD ["/apache-tomcat-9.0.27/bin/catalina.sh", "run"]