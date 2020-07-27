#!/bin/bash

echo "Calculo de media"

echo "Digite a primeira nota: "
read NOTA1
echo "Digite a segunda nota: "
read NOTA2

export MEDIA=`echo $((($NOTA1 + $NOTA2) / 2))`

if [ $MEDIA -lt 5 ]
then
  echo -e "Aluno com media:$MEDIA \e[91mREPROVADO"
elif [ $MEDIA -ge 5 -a $MEDIA -le 7 ]
then
  echo -e "Aluno com media:$MEDIA  \e[93mRECUPERAÇÂO"
elif [ $MEDIA -ge 8 ]
then
  echo -e "ALUNO com media:$MEDIA \e[92mAPROVADO"
else
  echo "Não foi possivel avaliar"
fi