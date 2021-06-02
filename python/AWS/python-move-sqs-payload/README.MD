# script para mover payload SQS

- Função, mover payload SQS de uma fila para outra, geralmente da DLQ para comum 

- Após a execução: 
    - ele mostar quantas mensagens tem na fila 
    - origem e destino das mensagens 
    - mostra progresso da migracão 
    - mostra o novo ID recebido

- Forma de usar:
```
export AWS_PROFILE=<AMBIENTE-SELECIONADO>
python3 main.py URL-QUEUE-ORIGEN URL-QUEUE-DESTINY
```

