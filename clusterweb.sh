#!/bin/bash
#       Copyright 2011 teamsupremos
#       
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 3 of the License, or
#       (at your option) any later version.
#       
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#       
#       You should have received a copy of the GNU General Public License
#       along with this program; if not, write to the Free Software
#       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#       MA 02110-1301, USA.
#
####### Aporte de @maestrolinux
# 0 no da ping
# 1 si da ping
PEPA=`ping -c 1 mamalibre.com.ar > /dev/null 2>&1`
TEXT="$?"

####### Aporte de @mamalibre
####### si da ping ejecuta el comando echo con la palabra "funca" #######
#########################################################################
if [ $TEXT -eq "1" ]
then
echo "funca"
else
echo "no funca"
fi
