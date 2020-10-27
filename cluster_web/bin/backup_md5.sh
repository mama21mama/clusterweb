#!/bin/bash
#==========================================
#             source code v20.10
# https://github.com/mama21mama/clusterweb
# mirror https://u.urown.cloud/pwfp5
# Licencia: GNU GPL v2 
# Dependencia paquetes: zip, wget
# 
# Creado por las neuronas activas de
# Fabián Bonetti 
#
# Sala jabber para debatir y 
# colaborar con el proyecto:
#
# reisub@u.urown.cloud
#==========================================
cd $HOME/cluster_web/www;zip -r -e -P Cw1234 ./out/cw.zip *;
cd $HOME/cluster_web/www/out;md5sum cw.zip > md5sum.cw.zip.txt
