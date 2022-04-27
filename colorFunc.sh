#!/bin/bash
 
#通过变量给字体加颜色
 
RED_COLOR='\E[1;31m'
 
GREEN_COLOR='\E[1;32m'
 
YELLOW_COLOR='\E[1;33m'
 
BLUE_COLOR='\E[1;34m'
 
PINK_COLOR='\E[1;35m'
 
RES='\E[0m'
 
echo -e "${RED_COLOR}=====红色可替换部分=====${RES}"
 
echo -e "${GREEN_COLOR}=====绿色可替换部分=====${RES}"
 
echo -e "${YELLOW_COLOR}=====×××可替换部分=====${RES}"
 
echo -e "${BLUE_COLOR}=====蓝色可替换部分=====${RES}"
 
echo -e "${PINK}=====粉色可替换部分=====${RES}"
