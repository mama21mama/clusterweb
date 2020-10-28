#!/bin/bash
#==========================================
#             source code v20.10.1
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
clear
echo ""
echo "Borrando archivos antiguos"
echo ""
rm -rf /tmp/md5sum.cw.zip.txt
rm -rf $HOME/cluster_web/www/out/*
rm -rf $HOME/cluster_web/www/in/*
sleep 5s
echo -e "\e[30;48;5;82m Listo \e[0m"
echo ""
echo "Creando backup de la web en cw.zip"
echo ""
sleep 5s
cd $HOME/cluster_web/www;zip -r -e -P Cw1234 ./out/cw.zip *;
echo -e "\e[30;48;5;82m Listo \e[0m"
echo ""
echo "Creando la suma de verificacion md5sum.cw.zip.txt"
echo ""
sleep 5s
cd $HOME/cluster_web/www/out;md5sum cw.zip > md5sum.cw.zip.txt
echo -e "\e[30;48;5;82m Listo \e[0m"

