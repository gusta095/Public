#!/bin/bash

echo "Calculando a Hipotenusa"

echo "Qual o valor do catedo adjacente: "
read CA
echo "Qual o valor do cateto oposto: "
read CO

export CALC_CA=`echo $(($CA * $CA))`
export CALC_CO=`echo $(($CO * $CO))`
export CALC_HIP=`echo $(($CALC_CA + $CALC_CO))`

echo "O valor da hipotenusa é $CALC_HIP"


# FORMULA
# a² + b² = c²
