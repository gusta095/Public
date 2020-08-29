#!/bin/bash

echo "Calculando Seno, Cosseno e Tangente"

echo "Qual o valor do catedo adjacente: "
read CA
echo "Qual o valor do cateto opostoo: "
read CO
echo "Qual o valor da hipotenusa: "
read HIPO

function res_seno(){
  export SENO=`echo "scale=3;$CO/$HIPO" | bc`
  export SENO_ZERO=`echo $SENO | echo "0$SENO"`
  echo $SENO_ZERO
}

function res_cos(){
  export COS=`echo "scale=3;$CA/$HIPO" | bc`
  export COS_ZERO=`echo $COS | echo "0$COS"`
  echo $COS_ZERO
}

function res_tang(){
  export TANG=`echo "scale=3;$CO/$CA" | bc`
  export TANG_ZERO=`echo $TANG | echo "0$TANG"`
  echo $TANG_ZERO
}

echo """
RESULTADOS
-------------------
|Seno     = $(res_seno) |
|Cosseno  = $(res_cos) |
|Tangente = $(res_tang) |
-------------------
"""