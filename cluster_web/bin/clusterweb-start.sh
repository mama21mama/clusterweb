#!/bin/bash
#source code
#https://github.com/mama21mama/clusterweb
#reporte de mejoras
CLUSTERWEB_DOMAIN=dominiohub.nsupdate.info
#enciende servidor web
#en puerto 8000
#http://localhost:8000
cd $HOME/cluster_web/www; python3 -m http.server 8000 &
#inicio bucle
#repite cada 5min
for (( ; ; ))
do
sleep 5m
ping -c30 -i3 $CLUSTERWEB_DOMAIN
if [ $? -eq 0 ]
then
#estado 200
cd $HOME/cluster_web/www/in; wget -c $CLUSTERWEB_DOMAIN:8000/out/cw.zip;
unzip -P Cw1234 cw.zip $HOME/cluster_web/
#fin estado 200
exit 0
else
#actualiza CLUSTERWEB_DOMAIN
#se convierte el nodo en hub
#cada 5 min actualiza ip al dominio hub
#inicio script update dominio hub
cd $HOME/cluster_web/bin
update-dns.sh
#fin script update dominio hub
fi
#fin bucle
done
