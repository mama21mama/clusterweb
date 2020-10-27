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
#
# Determina el dominio del hub que usaremos
HOSTNAME="HOSTNAME" #(example.nsupdate.info)
SECRET="SECRET"
PORT="8000" #(puerto que usara el servidor)
#
#enciende servidor web en puerto 8000
#en el navegador si somos hub http://localhost:8000
#si somos cliente usar el dominio de arriba 
#http://dominiohub.nsupdate.info:8000
#
#==================================================================
# Funcion inicio el servidor www
#
cd $HOME/cluster_web/www; python3 -m http.server $PORT > $HOME/cluster_web/log.txt 2>&1 &
#
# Fin funcion inicio servidor www
#==================================================================
echo ""
echo "inicio el servidor"
echo ""
sleep 5s
#
#==================================================================
# Funcion si esta vivo si da ping
for (( ; ; ))
do
sleep 5m
clear
echo ""
echo "pregunta si responde el dominio hub"
echo ""
ping -c3 $HOSTNAME
if [ $? -eq 0 ]
then
#
# Fin funcion ping
#==================================================================
#
#==================================================================
# Inicio funcion comparar md5sum.cw.zip.txt del hub con el nuestro
#
echo ""
echo "descarga md5sum.cw.zip.txt, para luego compararlo"
echo ""
sleep 5s
cd /tmp
wget -c $HOSTNAME:8000/out/md5sum.cw.zip.txt
PEPA=`diff -a /tmp/md5sum.cw.zip.txt $HOME/cluster_web/www/out/md5sum.cw.zip.txt > /dev/null 2>&1`
TEXT="$?"
if [ $TEXT -eq "1" ]
then
echo ""
echo "hubo modificacion, descargando cw.zip"
echo ""
sleep 5s 
cd $HOME/cluster_web/www/in; wget -c $HOSTNAME:8000/out/cw.zip;
cd $HOME/cluster_web/www/
unzip -o -P Cw1234 ./in/cw.zip
echo ""
echo "Se descomprimio la web completa"
echo ""
sleep 5s
cp /tmp/md5sum.cw.zip.txt $HOME/cluster_web/www/out/
else
echo ""
echo "ninguna modificacion, no se descargara cw.zip"
echo ""
sleep 5s
fi
# Fin funcion comparar md5sum.cw.zip.txt del hub con el nuestro
#==================================================================
else
#=================================
#    Si modificamos la web
#    seguir estos pasos.
#=================================
#Si soy hub debo crear el backup $HOME/cluster_web/www/out/cw.zip 
#para que los nodos lo descarguen.
#ademas del archivo $HOME/cluster_web/www/out/md5sum.cw.zip.txt
#
#Recuerda!
#al modificar la web, siempre siendo hub.
#luego de modificar debo comprimirla
#con este comando.
# 
#cd $HOME/cluster_web/bin; bash backup_md5.sh
#
#ese comando crea backup de la web y la suma md5sum.cw.zip.txt
#==================================================================
# Inicio funcion actualiza ip del hub
#
# el nodo se convierte en hub
UPDATE_URL=https://$HOSTNAME:$SECRET@ipv4.nsupdate.info/nic/update
wget -q -O - $UPDATE_URL
# 
# actualiza el dominio hub cada 5min
# Fin funcion actualiza ip del hub
#==================================================================
echo " "
echo "actualiza ip del dominio hub"
echo -e "\e[30;48;5;82m Somos Hub! \e[0m"
echo -e "\e[30;48;5;82m Puedes actualizar la web. \e[0m"
sleep 5s
#
#==================================================================
# Inicio funcion autobackup web
#
# Si la web es demaciado pesada en tamaño se debe desactivar
# imaginate bajar 1gb cada 5 min! 
#cd $HOME/cluster_web/www
#zip -r -e -P Cw1234 ./out/cw.zip *;
#cd $HOME/cluster_web/www/out
#md5sum cw.zip > md5sum.cw.zip.txt
# funcion automatica crea backup de la web cada 5 min
#
# Fin funcion autobackup web
#==================================================================
#echo "crea autobackup web"
fi
done
