#!/bin/bash

echo "Gerenciamento de pagamentos"

echo "Qual o valor da compra: "
read COMPRA

function avista-dinheiro(){
  export DESCONTO_10=`echo $((($COMPRA / 100) * 10))`
  export RESULTADO=`echo $(($COMPRA - $DESCONTO_10)) | cut -d"." -f1`
  echo "O valor era R$:$COMPRA reais, mais com o desconto de 10% vai ficar R$:$RESULTADO reais."
}

function avista-cartao(){
  export DESCONTO_5=`echo $((($COMPRA / 100) * 5))`
  export RESULTADO=`echo $(($COMPRA - $DESCONTO_5)) | cut -d"." -f1`
  echo "O valor era R$:$COMPRA reais, mais com o desconto de 5% vai ficar R$:$RESULTADO reais."
}

function cartao-x2(){
  export PARCELAS_x2=`echo $(($COMPRA / 2))`
  # echo "Duas parcelas de R$:$PARCELAS_x2 no cartão sem juros"
  echo "O valor vai ser de R$:$COMPRA reais, em duas parcelas de R$:$PARCELAS_x2 no cartão sem juros"
}

function cartao-x3(){
  export JUROS_20=`echo $((($COMPRA / 100) * 20))`
  export RESULTADO=`echo $(($COMPRA + $JUROS_20)) | cut -d"." -f1`
  export PARCELAS_x3=`echo $(($RESULTADO / 3))`
  echo "O valor vai ser de R$:$RESULTADO reais, em três parcelas de R$:$PARCELAS_x3 no cartão"
}

echo """
Escolha a forma de pagamento

[1] - Avista no dinheiro
[2] - Avista no cartão
[3] - Cartão x2
[4] - Cartão x3
"""
read func

if [ ${func} == "1" ]
then
  avista-dinheiro
elif [ ${func} == "2" ]
then
  avista-cartao
elif [ ${func} == "3" ]
then
  cartao-x2
elif [ ${func} == "4" ]
then
  cartao-x3
else
  echo "Opção não indentificada"
fi

