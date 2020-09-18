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
	output "mkdir -p :" $SOFT_DIR
	mkdir -p $SOFT_DIR
fi

#soft install path
INSTALL_DIR="/Users/jpshi/bigdata/elasticStack/install/"
if [[ ! -d $INSTALL_DIR ]]; then
	#statements
	output "mkdir -p :" $INSTALL_DIR
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

#output info
outPut(){
	echo -e "`date '+%Y-%m-%d %H:%M:%S'` " $@
}

#download software 
downLoadSoft(){

	#cd download path
	content="--- 检查软件是否下载 ... "	
	outPut $content

	cd $SOFT_DIR

	#es
	if [[ ! -f $ELASTICSEARCH_FILE ]]; then
		content="--- $ELASTICSEARCH_FILE is not exists , downloading ..."	
		outPut $content
		wget -c $ELASTICSEARCH_BASE_URL$ELASTICSEARCH_FILE
		content="download soft end: $ELASTICSEARCH_FILE "
		outPut $content
	else
		content="--- $ELASTICSEARCH_FILE already exists ."	
		outPut $content
	fi
	

	#kibana
	if [[ ! -f $KIBANA_FILE ]]; then
		content="--- $KIBANA_FILE is not exists , downloading ..."	
		outPut $content
		wget -c $KIBANA_BASE_URL$KIBANA_FILE 
		content="download soft end: $KIBANA_FILE "
		outPut $content
	else
		content="--- $KIBANA_FILE already exists ."	
		outPut $content
	fi
	

	#filebeat
	if [[ ! -f $FILEBEAT_FILE ]]; then
		content="--- $FILEBEAT_FILE is not exists , downloading ..."	
		outPut $content
		wget -c $FILEBEAT_BASE_URL$FILEBEAT_FILE 
		content="download soft end: $FILEBEAT_FILE "
		outPut $content
	else
		content="--- $FILEBEAT_FILE already exists ."	
		outPut $content
	fi
	

	#packetbeat
	if [[ ! -f $PACKETBEAT_FILE ]]; then
		content="--- $PACKETBEAT_FILE is not exists , downloading ..."	
		outPut $content
		wget -c $PACKETBEAT_BASE_URL$PACKETBEAT_FILE 
		content="download soft end: $PACKETBEAT_FILE "
		outPut $content
	else
		content="--- $PACKETBEAT_FILE already exists ."	
		outPut $content
	fi
	

	#logstash
	if [[ ! -f $LOGSTASH_FILE ]]; then
		content="--- $LOGSTASH_FILE is not exists , downloading ..."	
		outPut $content
		wget -c $LOGSTASH_BASE_URL$LOGSTASH_FILE
		content="download soft end: $LOGSTASH_FILE "
		outPut $content
	else
		content="--- $LOGSTASH_FILE already exists ."	
		outPut $content
	fi
	

}


tarzxfSoft(){
	#cd download path
	outPut "--- 检查软件是否解压："
	cd $SOFT_DIR

	#解压ELASTICSEARCH
	if [[ -f $ELASTICSEARCH_FILE ]]; then
		if [[ ! -d $INSTALL_DIR$ELASTICSEARCH ]]; then
			content="--- tar zxf $ELASTICSEARCH_FILE start ... "
			outPut $content
			tar zxf $ELASTICSEARCH_FILE -C $INSTALL_DIR
			content="--- tar zxf $ELASTICSEARCH_FILE end ... "
			outPut $content
		else
			content="--- $ELASTICSEARCH has already exists."
			outPut $content
		fi
	fi
	

	#解压KIBANA
	if [[ -f $KIBANA_FILE ]]; then
		if [[ ! -d $INSTALL_DIR$KIBANA_DIR ]]; then
			content="--- tar zxf $KIBANA_FILE start ... "
			outPut $content
			tar zxf $KIBANA_FILE -C $INSTALL_DIR
			content="--- tar zxf $KIBANA_FILE end ... "
			outPut $content
		else
			content="--- $KIBANA_DIR has already exists."
			outPut $content
		fi
	fi
	

	#解压FILEBEAT
	if [[ -f $FILEBEAT_FILE ]]; then
		if [[ ! -d $INSTALL_DIR$FILEBEAT_DIR ]]; then
			content="--- tar zxf $FILEBEAT_FILE start ... "
			outPut $content
			tar zxf $FILEBEAT_FILE -C $INSTALL_DIR
			content="--- tar zxf $FILEBEAT_FILE end ... "
			outPut $content
		else
			content="--- $FILEBEAT_DIR has already exists."
			outPut $content
		fi

	fi


	#解压PACKETBEAT
	if [[ -f $PACKETBEAT_FILE ]]; then
		if [[ ! -d $INSTALL_DIR$PACKETBEAT_DIR ]]; then
			content="--- tar zxf $PACKETBEAT_FILE start ... "
			outPut $content
			tar zxf $PACKETBEAT_FILE -C $INSTALL_DIR
			content="--- tar zxf $PACKETBEAT_FILE end ... "
			outPut $content
		else
			content="--- $PACKETBEAT_DIR has already exists."
			outPut $content
		fi
	fi
	

	#解压LOGSTASH
	if [[ -f $LOGSTASH_FILE ]]; then
		if [[ ! -d $INSTALL_DIR$LOGSTASH ]]; then
			content="--- tar zxf $LOGSTASH_FILE start ... "
			outPut $content
			tar zxf $LOGSTASH_FILE -C $INSTALL_DIR
			content="--- tar zxf $LOGSTASH_FILE end ... "
			outPut $content
		else
			content="--- $LOGSTASH has already exists."
			outPut $content
		fi
	fi
	


}


start(){
	#start es
	#查看进程是否存在
	elasticPs=`ps -ef | grep "elastic" | grep -v 'grep' | awk '{print $2}' | head -n 1`
	if [[ -z $elasticPs ]]; then
		content="--- start $ELASTICSEARCH ..."
		outPut $content
		cd $INSTALL_DIR$ELASTICSEARCH && nohup bin/elasticsearch & 
	else
		content="--- es is running ... PID: " $elasticPs 
		outPut $content
	fi

	
	#start kibana
	#查看进程是否存在
	# kibanaPs=`netstat -antl | grep 5601`
	kibanaPs=`ps -ef | grep "node/bin/node" | grep -v 'grep' | awk '{print $2}' | head -n 1`
	if [[ -z $kibanaPs ]]; then
		content="--- start $KIBANA_DIR ..."
		outPut $content
		cd $INSTALL_DIR$KIBANA_DIR && nohup bin/kibana & 
	else
		content="--- kibana is running ... PID: " $kibanaPs 
		outPut $content
	fi
	

	#start filebeat
	filebeatPs=`ps -ef | grep "filebeat" | grep -v 'grep' | awk '{print $2}' | head -n 1`
	if [[ -z $filebeatPs ]]; then
		content="--- start $FILEBEAT_DIR ..."
		outPut $content
		cd $INSTALL_DIR$FILEBEAT_DIR && nohup ./filebeat & 
	else
		content="--- filebeat is running ... PID: " $filebeatPs 
		outPut $content
	fi
	

}


stop(){

	#stop es
	esPid=`ps -ef | grep "elastic" | grep -v 'grep' | awk '{print $2}' | head -n 1`
	if [[ $esPid ]]; then
		#statements
		content="--- kill es process ..."
		outPut $content
		kill -9 $esPid
	else
		content="--- es already stoped ..."
		outPut $content
	fi

	#stop filebeat
	filebeatPid=`ps -ef | grep "filebeat" | grep -v 'grep' | awk '{print $2}' | head -n 1`
	if [[ $filebeatPid ]]; then
		#statements
		content="--- kill filebeat process ..."
		outPut $content
		kill -9 $filebeatPid
	else
		content="--- filebeat already stoped ..."
		outPut $content
	fi

	#stop kibana
	kibanaPid=`ps -ef | grep "node/bin/node" | grep -v 'grep' | awk '{print $2}' | head -n 1`
	if [[ $kibanaPid ]]; then
		#statements
		content="--- kill kibana process ..."
		outPut $content
		kill -9 $kibanaPid
	else
		content="--- kibana already stoped ..."
		outPut $content
	fi
	
}



if [[ -z $1 ]]; then
	content="--- params is empty. please input 'down' or 'tar' , run again!!! "
	outPut $content
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
elif [[ $1 == "start" ]]; then
	start
	exit
elif [[ $1 == "stop" ]]; then
	stop
	exit
fi

