#!/bin/bash


echo "Analisando sua rede"

echo "."
sleep 0.2
echo ".."
sleep 0.2
echo "... está PRONTO"
echo ""

export IP_INTERNO=`ifconfig eth0 |grep inet|grep -v inet6| sed s/n/t/g|cut -d"t" -f3`
export IP_EXTERNO=`dig +short myip.opendns.com @resolver1.opendns.com`
export NETMASK=`ifconfig eth0 | grep netmask | sed s/b/k/g | cut -d"k" -f2`
export BROADCAST=`ifconfig eth0 | grep broadcast | cut -d"t" -f4`

echo "IP interno:       $IP_INTERNO"
echo "Mascara de rede:  $NETMASK"
echo "Broadcast         $BROADCAST"
echo -e "IP externo:        \e[92m$IP_EXTERNO"



#
# Referencia
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
#
