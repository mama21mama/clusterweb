#!/bin/bash
#==========================================
#			source code
# https://github.com/mama21mama/clusterweb
#  
# Dependencia paquetes: zip
# 
# v1.2 
#
# Sala jabber para debatir y 
# colaborar con el proyecto:
#
# reisub@u.urown.cloud
#==========================================
CLUSTERWEB_DOMAIN=dominiohub.nsupdate.info
#enciende servidor web
#en puerto 8000
#http://localhost:8000
cd $HOME/cluster_web/www; python3 -m http.server 8000 &
#se puede iniciar el servidor con salida log si se quiere
echo "inicio el servidor"
#inicio bucle
#repite cada 5min
for (( ; ; ))
do
sleep 5m
echo "pregunta si responde el dominio hub"
ping -c30 -i3 $CLUSTERWEB_DOMAIN
if [ $? -eq 0 ]
then
#estado 200
#si se modifico el md5sum.cw.zip.txt
#se descarga, si sigue igual no
echo "descarga md5sum.cw.zip.txt, para luego compararlo"
cd /tmp
curl $CLUSTERWEB_DOMAIN:8000/out/md5sum.cw.zip.txt --output md5sum.cw.zip.txt
PEPA=`diff -a /tmp/md5sum.cw.zip.txt $HOME/cluster_web/www/out/md5sum.cw.zip.txt > /dev/null 2>&1`
TEXT="$?"
if [ $TEXT -eq "1" ]
then
echo "hubo modificacion, descargando cw.zip"
cd $HOME/cluster_web/www/in; curl $CLUSTERWEB_DOMAIN:8000/out/cw.zip --output cw.zip;
unzip -P Cw1234 cw.zip $HOME/cluster_web/
else
echo "ninguna modificacion, no se descarga md5sum.cw.zip.txt"
fi
exit $?
else
#Se convierte el nodo en hub / cada 5 min actualiza ip del dominio hub
#Inicio script update dominio hub.
#=================================
#    Si modificamos la web
#    seguir estos pasos.
#=================================
#Si soy hub debo crear el backup $HOME/cluster_web/www/out/cw.zip para que 
#los nodos lo descarguen.
#ademas del archivo $HOME/cluster_web/www/out/md5sum.cw.zip.txt
#
#Recuerda!
#al modificar la web, siempre siendo hub.
#luego de modificar debo comprimirla
#con este comando zip
# 
#zip -e -P Cw1234 cw.zip $HOME/cluster_web/www/*
#
#y el archivo generado llamado cw.zip debo copiarlo en 
# $HOME/cluster_web/out
#luego debo crear un archivo llamado md5sum.cw.zip.txt
#con este comando.
#
#cd $HOME/cluster_web/www/out
#md5sum cw.zip > md5sum.cw.zip.txt
#
#
#esos 2 pasos hay que hacer si somos Hub y modificamos la web.
#
.$HOME/cluster_web/bin/update-dns.sh
echo "actualiza ip del dominio hub"
fi
#fin bucle
done
