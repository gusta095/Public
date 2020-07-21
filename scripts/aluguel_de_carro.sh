#!/bin/bash

echo "Calculo de aluguel de carro"

echo "Quantos dias você ficou com o carro: "
read DIAS
echo "Quantos KMs você rodou com o carro: "
read KM

export VALOR_DIAS=60
export VALOR_KM=0.15


function trip(){
  CALC_DIA=$(($VALOR_DIAS * $DIAS))
  CALC_KM=`echo "$VALOR_KM*$KM" | bc | cut -d"." -f1`
  # CALC_KM=$(($VALOR_KM * $KM))

  echo "O valor do alguem vai ser de R$:$(($CALC_DIA + $CALC_KM))"
}

trip
