Instalacion
===========

lugar de trabajo
$HOME/cluster_web

editar clusterweb-start.sh la linea 19, 20, 21
HOSTNAME="HOSTNAME" #(example.nsupdate.info)
SECRET="SECRET"
PORT="8000" #(puerto que usara el servidor)
antes de ejecutarlo

ejecutar el clusterweb:

$cd $HOME/cluster_web/bin
$bash clusterweb-start.sh





Cluster Web v20.10.1
===========

Una idea loca...Pero no tanto.
La idea es tener un dominio que sera un hub, ejemplo
hostname.nsupdate.info (se debe crear un dominio en https://nsupdate.info)
y 2 o 3 nodos (PC de amigos), cuanto mas nodos mejor, estara menos down nuestra web.
Los datos de dominio hostname.nsupdate.info se deben copiar entre los amigos a usar 
Cluster Web para que funcione el script. El primero de los amigos que sera el hub, 
creara la web. Luego de crearla se hace backup con el script de backup 
$bash $HOME/cluster_web/bin/backup_md5.sh
La web estara contenida en $HOME/cluster_web/www/index.html
Luego el hub cuando se inicia, los demas amigos deben iniciarlo, respaldando al hub en 
caso de caidas.


hasta ahi vamos? :)
                         
                       24/7 Uptime!  
_____________________________________________________________
        nodo 1     |        nodo 2             |  nodo 3     |
=============================================================
 0hs | 03hs | 05hs | 08hs | 12hs | 15hs | 17hs | 20hs | 23hs
=============================================================
node1 estara uptime de 0hs a 05hs | cuando cae lo reemplaza el nodo2
nodo2 estara uptime de 05hs a 17hs| nod3 estara uptime de 17hs a 0hs


con esto logramos nusestro servidor web entre amigos...sin pagar hosting.
Los nodos se convierten en hub al estar uptime.


Por ejemplo el nodo1 es ejemplo, preguntara al hub si esta vivo, si la respuesta es si,
bajara una copia de la web del hub, de la carpeta www/out/cw.zip (zip cifrado) bajara siempre 
y cuando el nodo1 no tenga esa copia consigo mismo, y si tuviera esa copia la compararia con un 
md5sum llamado md5sum.cw.zip.txt, si la comparacion es identica no baja el mirror, si es 
diferente si bajaria el nodo1 la copia.

luego de esa pregunta, hara un salida el script.
Para levantar el servidor es simple

$cd $HOME/cluster_web/; python3 -m http.server 8000

en el navegador vemos la web en http://localhost:8000 siendo hub o nodo
Si no somos hub ni nodo usar el dominio http://dominiohub.nsupdate.info:8000


Sala jabber para debatir y colaborar con el proyecto:

reisub@u.urown.cloud


info
https://friendicarg.nsupdate.info/display/69172192-135f-999a-799b-7ca758255072

