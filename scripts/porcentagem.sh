#!/bin/bash

echo "Calculo de porcentagem"

echo "Qual o valor do produto: "
read PRODUTO
echo "Qual a porcentagem do desconto: "
read PORCENTAGEM

function opr(){
  CALC=$((($PRODUTO / 100 ) * $PORCENTAGEM))
  echo """
  O valor atul do produto após o desconto de $PORCENTAGEM%
  vai ser de R$:$(($PRODUTO - $CALC))
  """
}

opr
