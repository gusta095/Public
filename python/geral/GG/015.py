KM_CARRO = int(input('Qual a quantidade de KMs: '))
DIA_CARRO = int(input('Qual a quabtidade de dias: '))

print(f'O resultado é {(DIA_CARRO*60) + (KM_CARRO*0.15):.2f}')