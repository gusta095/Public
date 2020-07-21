#!/bin/bash


function soma(){
  echo -e "$n1 + $n2 = \e[92m$(($n1 + $n2))"
}

function menos(){
  echo -e "$n1 - $n2 = \e[92m$(($n1 - $n2))"
}

function multi(){
  echo -e "$n1 * $n2 = \e[92m$(($n1 * $n2))"
}

function div(){
  echo -e "$n1 / $n2 = \e[92m$(($n1 / $n2))"
}

echo "Calculadora v1"

echo "Insira um valor"
read n1
echo "Insira outro valor"
read n2

echo """
Escolha uma operação

[1] - Soma
[2] - Divisão
[3] - Multiplicação
[4] - Subtração

"""
read func

if [ ${func} == "1" ]
then
  soma
elif [ ${func} == "2" ]
then
  div
elif [ ${func} == "3" ]
then
  multi
elif [ ${func} == "4" ]
then
  menos
else
  echo "Opção não indentificada"
fi
