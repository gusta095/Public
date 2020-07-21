#!/bin/bash

# Variaveis
export HOSTNAME=`hostname`
export HOSTNAME_VERDE=`echo -e "\e[92m$HOSTNAME"`
export ANO=`date '+%d-%m-%Y'`
export HORA=`date '+%H:%M'`
export ATIVO=`uptime | cut -d" " -f5 |cut -d"," -f1`
export KERNEL=`uname -r`
export IP_EXTERNO=`dig +short myip.opendns.com @resolver1.opendns.com`
export CPU=`lscpu | grep -i 'model name' |awk '{print $5}'`
export CORE=`lscpu | grep -i 'CPU family'| awk '{print $3}'`
export MEM_FREE=`free -h|grep ^Mem|awk '{print $4}'`
export DISK_FREE=`df -h |grep ^tools |awk '{print $4}'`


# Execução
echo "Relatorio da Maquina"

echo """
- Usuario: $USER
- Hostname: $HOSTNAME
- Data/Hora: $HORA de $ANO
- Uptime: $ATIVO
- Versão do kernel: $KERNEL
- IP Externo: $IP_EXTERNO
- CPU-Model: $CPU
- CPU-Core: $CORE
- RAM-Livre: $MEM_FREE
- Disco-Livre: $DISK_FREE
"""
