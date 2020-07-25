#!/bin/bash

echo "A listamento militar"

echo "Ano de nascimento: "
read ANO

export ANO_ATUAL=`date '+%Y'`
export FAIXA_DE_CORTE=18
export IDADE_ATUAL=`echo $(($ANO_ATUAL - $ANO))`

function SERVICO_MILITAR(){
  if [ $FAIXA_DE_CORTE -gt $IDADE_ATUAL ]
  then
    echo -e "\e[93mAinda faltam $(($FAIXA_DE_CORTE - $IDADE_ATUAL)) anos para o seu alistamento"
  elif [ $FAIXA_DE_CORTE -eq $IDADE_ATUAL ]
  then
    echo -e "\e[92mVocê esta no ano do seu alistamento"
  else
    echo -e " \e[91mVocê esta atrazado para o seu alistamento $(($IDADE_ATUAL - $FAIXA_DE_CORTE)) anos"
  fi
}

SERVICO_MILITAR