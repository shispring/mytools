#!/bin/bash

#---------------------------------------------
#detail：mac下搭建Elastic Stack
#execute：sh elkInstall.sh
#author：shijianpeng
#date：2020-09-05
#---------------------------------------------

#soft download path
SOFT_DIR="/Users/jpshi/bigdata/elasticStack/soft/"
if [[ ! -d $SOFT_DIR ]]; then
	#statements
	echo "mkdir -p :" $SOFT_DIR
	mkdir -p $SOFT_DIR
fi

#soft install path
INSTALL_DIR="/Users/jpshi/bigdata/elasticStack/install/"
if [[ ! -d $INSTALL_DIR ]]; then
	#statements
	echo "mkdir -p :" $INSTALL_DIR
	mkdir -p $INSTALL_DIR
fi

#choose version
ELASTICSEARCH='elasticsearch-7.9.1'
KIBANA='kibana-7.9.1'
FILEBEAT='filebeat-7.9.1'
PACKETBEAT='packetbeat-7.9.1'
LOGSTASH="logstash-7.9.1"

#特殊dir
KIBANA_DIR=$KIBANA"-darwin-x86_64"
FILEBEAT_DIR=$FILEBEAT"-darwin-x86_64"
PACKETBEAT_DIR=$PACKETBEAT"-darwin-x86_64"


#file name
ELASTICSEARCH_FILE=$ELASTICSEARCH"-darwin-x86_64.tar.gz"
KIBANA_FILE=$KIBANA"-darwin-x86_64.tar.gz"
FILEBEAT_FILE=$FILEBEAT"-darwin-x86_64.tar.gz"
PACKETBEAT_FILE=$PACKETBEAT"-darwin-x86_64.tar.gz"
LOGSTASH_FILE=$LOGSTASH".tar.gz"


#download url
ELASTICSEARCH_BASE_URL="https://artifacts.elastic.co/downloads/elasticsearch/" 
KIBANA_BASE_URL="https://artifacts.elastic.co/downloads/kibana/" 
FILEBEAT_BASE_URL="https://artifacts.elastic.co/downloads/beats/filebeat/" 
PACKETBEAT_BASE_URL="https://artifacts.elastic.co/downloads/beats/packetbeat/" 
LOGSTASH_BASE_URL="https://artifacts.elastic.co/downloads/logstash/" 



#download software 
downLoadSoft(){

	#cd download path
	echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "--- 检查软件是否下载 ... " 
	cd $SOFT_DIR

	#es
	if [[ ! -f $ELASTICSEARCH_FILE ]]; then
		echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $ELASTICSEARCH_FILE " is not exists , downloading ..."
		wget -c  $ELASTICSEARCH_BASE_URL$ELASTICSEARCH_FILE
		echo "download soft end: " $ELASTICSEARCH_FILE
	else
		echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $ELASTICSEARCH_FILE " already exists ."
	fi
	

	#kibana
	if [[ ! -f $KIBANA_FILE ]]; then
		echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $KIBANA_FILE " is not exists , downloading ..."
		wget -c  $KIBANA_BASE_URL$KIBANA_FILE 
		echo "download soft end: " $KIBANA_FILE
	else
		echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $KIBANA_FILE " already exists ."
	fi
	

	#filebeat
	if [[ ! -f $FILEBEAT_FILE ]]; then
		echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $KIBANA_FILE " is not exists , downloading ..."
		wget -c  $FILEBEAT_BASE_URL$FILEBEAT_FILE 
		cho "download soft end: " $FILEBEAT_FILE
	else
		echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $FILEBEAT_FILE " already exists ."
	fi
	

	#packetbeat
	if [[ ! -f $PACKETBEAT_FILE ]]; then
		echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $PACKETBEAT_FILE " is not exists , downloading ..."
		wget -c $PACKETBEAT_BASE_URL$PACKETBEAT_FILE 
		echo "download soft end: " $PACKETBEAT_FILE 
	else
		echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $PACKETBEAT_FILE " already exists ."	
	fi
	

	#logstash
	if [[ ! -f $LOGSTASH_FILE ]]; then
		echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $LOGSTASH_FILE " is not exists , downloading ..."
		wget -c $LOGSTASH_BASE_URL$LOGSTASH_FILE
		echo "download soft end: " $LOGSTASH_FILE
	else
		echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $LOGSTASH_FILE " already exists ."	
	fi
	

}


tarzxfSoft(){
	#cd download path
	echo -e "`date '+%Y-%m-%d %H:%M:%S'` --- 检查软件是否解压："
	cd $SOFT_DIR

	#解压ELASTICSEARCH
	if [[  -f $ELASTICSEARCH_FILE ]]; then
		if [[ ! -d $INSTALL_DIR$ELASTICSEARCH ]]; then
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" "tar zxf " $ELASTICSEARCH_FILE " start ... "
			tar zxf $ELASTICSEARCH_FILE  -C $INSTALL_DIR
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" "tar zxf " $ELASTICSEARCH_FILE " end ... "
		else
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $ELASTICSEARCH "has already exists."
		fi
	fi
	

	#解压KIBANA
	if [[  -f $KIBANA_FILE ]]; then
		if [[ ! -d $INSTALL_DIR$KIBANA_DIR ]]; then
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" "tar zxf " $KIBANA_FILE " start ... "
			tar zxf $KIBANA_FILE  -C $INSTALL_DIR
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" "tar zxf " $KIBANA_FILE " end ... "
		else
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $KIBANA_DIR "has already exists."
		fi
	fi
	

	#解压FILEBEAT
	if [[  -f $FILEBEAT_FILE ]]; then
		if [[ ! -d $INSTALL_DIR$FILEBEAT_DIR ]]; then
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" "tar zxf " $FILEBEAT_FILE " start ... "
			tar zxf $FILEBEAT_FILE  -C $INSTALL_DIR
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" "tar zxf " $FILEBEAT_FILE " end ... "
		else
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $FILEBEAT_DIR "has already exists."
		fi

	fi


	#解压PACKETBEAT
	if [[  -f $PACKETBEAT_FILE ]]; then
		if [[ ! -d $INSTALL_DIR$PACKETBEAT_DIR ]]; then
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" "tar zxf " $PACKETBEAT_FILE " start ... "
			tar zxf $PACKETBEAT_FILE  -C $INSTALL_DIR
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" "tar zxf " $PACKETBEAT_FILE " end ... "
		else
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $PACKETBEAT_DIR "has already exists."
		fi
	fi
	

	#解压LOGSTASH
	if [[  -f $LOGSTASH_FILE ]]; then
		if [[ ! -d $INSTALL_DIR$LOGSTASH ]]; then
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" "tar zxf " $LOGSTASH_FILE " start ... "
			tar zxf $LOGSTASH_FILE  -C $INSTALL_DIR
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" "tar zxf " $LOGSTASH_FILE " end ... "
		else
			echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" $LOGSTASH "has already exists."
		fi
	fi
	


}


runSoft(){
	#run es
	#查看进程是否存在
	elasticPs=`ps -ef | grep "elastic" | grep -v 'grep' | awk '{print $2}' | head -n 1`
	if [[ -z $elasticPs ]]; then
		echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" "run " $ELASTICSEARCH " ..."
		cd $INSTALL_DIR$ELASTICSEARCH && nohup bin/elasticsearch & 
	else
		echo -e "`date '+%Y-%m-%d %H:%M:%S'` --- elasticsearch is running ...  PID: " $elasticPs 
	fi

	
	#run kibana
	#查看进程是否存在
	kibanaPs=`netstat -antl | grep 5601`
	if [[ -z $kibanaPs ]]; then
		echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" "run " $KIBANA_DIR " ..."
		cd  $INSTALL_DIR$KIBANA_DIR &&  nohup bin/kibana & 
	else
		echo -e "`date '+%Y-%m-%d %H:%M:%S'` --- kibana is running ..." 
	fi
	

	#run filebeat
	filebeatPs=`ps -ef | grep "filebeat" | grep -v 'grep' | awk '{print $2}' | head -n 1`
	if [[ -z $filebeatPs ]]; then
		echo -e "`date '+%Y-%m-%d %H:%M:%S'`" "---" "run " $FILEBEAT_DIR " ..."
		cd $INSTALL_DIR$FILEBEAT_DIR && nohup ./filebeat & 
	else
		echo -e "`date '+%Y-%m-%d %H:%M:%S'` --- filebeat is running ...  PID: " $filebeatPs 
	fi
	

}

if [[ -z $1 ]]; then
	echo -e "`date '+%Y-%m-%d %H:%M:%S'`" " --- params is empty. please input 'down' or 'tar' , run again!!!  "
	exit
elif [[ $1 == "check" ]]; then
	downLoadSoft
	tarzxfSoft
	exit
elif [[ $1 == "down" ]]; then
	downLoadSoft
	exit
elif [[ $1 == "tar" ]]; then
	tarzxfSoft
	exit
elif [[ $1 == "run" ]]; then
	runSoft
	exit
fi

