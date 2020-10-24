#!/bin/bash
#==========================================
#             source code
# https://github.com/mama21mama/clusterweb
#  
# Dependencia paquetes: zip, wget
# 
# v1.5 
#
# Sala jabber para debatir y 
# colaborar con el proyecto:
#
# reisub@u.urown.cloud
#==========================================
cd $HOME/cluster_web/www;zip -e -P Cw1234 ./out/cw.zip *;
cd $HOME/cluster_web/www/out;md5sum cw.zip > md5sum.cw.zip.txt
