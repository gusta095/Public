#!/bin/bash

echo "Calculando o valor da viagem"

echo "Qual a distancia da viagem: "
read KM

export MENOR_200=0.50
export MAIOR_200=0.45

function custo_viagem(){
  if [ $KM -lt 200 ]
  then
    CALC_MENOR=`echo "$KM*$MENOR_200" | bc`
    echo "O valor da viagem vai ser de R$:$CALC_MENOR reais "
  else
    CALC_MAIOR=`echo "$KM*$MAIOR_200" | bc`
    echo "O valor da viagem vai ser de R$:$CALC_MAIOR reais "
  fi
}

custo_viagem
