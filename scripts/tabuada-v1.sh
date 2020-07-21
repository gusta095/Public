#!/bin/bash

echo "Tabuada"

while true
do

echo "Digite um numero: "
read n1

if [ $n1 = 0 ];
then
    break
fi
  function tabuada(){
    for c in $(seq 10)
    do
      echo "$n1 x $c = $(($n1*$c))"
    done
  }
tabuada
echo "Para sair digete ZERO"
done
