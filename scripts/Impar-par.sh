#!/bin/bash

echo "Identificador de numeros"

echo "Digite um numero: "
read N1

function impar_par(){
  if [ $(($N1 % 2)) == '0' ]
  then
    echo -e "O valor $N1 é \e[92mPar"
  elif [ $(($N1 % 2)) != '0' ]
  then
    echo -e "O valor $N1 é \e[92mImpar"
  fi
}

impar_par