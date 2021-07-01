# Estudo de kafka

# Comandos

## kafka-topics

- Listar topicos
kafka-topics --list --bootstrap-server localhost:29092

- Criar topicos
kafka-topics --create --bootstrap-server localhost:29092 --partitions 3 --replication-factor 1 --topic test-3-1

- descrever um topico
kafka-topics --describe --bootstrap-server localhost:29092 --topic test-3-1


## kafka-producer

- Mandar mensagens para um topico
kafka-console-producer.sh --bootstrap-server localhost:29092 --topic seller_events-created


## kafka-consumer

- Consumir mensagens do topico
kafka-console-consumer.sh --bootstrap-server localhost:29092 --from-beginning --topic seller_events-created
