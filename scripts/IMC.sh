#!/bin/bash

echo "Calculo do IMC"

echo "Qual seu peso: "
read PESO
echo "Qual sua altura: "
read ALTURA

export CALC_ALTURA=`echo "$ALTURA^2" | bc`
export IMC=`echo "scale=0;$PESO/$CALC_ALTURA" | bc`
export IMC2=`echo "scale=2;$PESO/$CALC_ALTURA" | bc`

if [ $IMC -lt 18 ]
then
  echo "O IMC altual é $IMC2, E você esta abaixo do peso"
elif [ $IMC -gt 19 -a $IMC -lt 25 ]
then
  echo "O IMC altual é $IMC2, E você esta no peso ideal"
elif [ $IMC -gt 26 -a $IMC -lt 30 ]
then
  echo "O IMC altual é $IMC2, E você esta com sobrepeso"
elif [ $IMC -gt 31 -a $IMC -lt 40 ]
then
  echo "O IMC altual é $IMC2, E você esta com obesidade"
elif [ $IMC -gt 41 ]
then
  echo "O IMC altual é $IMC2, E você esta com OBESIDADE MÓRBIDA"
else
  echo "Sem resultados"
fi

