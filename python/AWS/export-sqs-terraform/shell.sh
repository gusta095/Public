#!/bin/bash

function environment-selector(){
    if [ $AWS_PROFILE == "microservices-qa" ]
    then
        echo "Executando em QA"
        export ACCOUNT_ID=XXXXXXXXXXXXXX
    elif [ $AWS_PROFILE == "microservices-prod" ]
    then
        echo "Executando em PROD"
        export ACCOUNT_ID=XXXXXXXXXXXXXX
    elif [ $AWS_PROFILE == "testenv" ]
    then
        echo "Executando em TESTENV"
        export ACCOUNT_ID=XXXXXXXXXXXXXX
    else
    echo "Opção não indentificada"
    fi
}

environment-selector

echo $ACCOUNT_ID
for SQS in $(cat queue-shell.txt); do echo $SQS; terraform import aws_sqs_queue.$SQS https://sqs.us-east-1.amazonaws.com/$ACCOUNT_ID/$SQS ; done ;


