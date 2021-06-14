# Estudo de kafka

- Listar topicos
kafka-topics --list --bootstrap-server localhost:29092

- Criar topicos
kafka-topics --create --bootstrap-server localhost:29092 --partitions 3 --replication-factor 1 --topic test-3-1

- descrever um topico
kafka-topics --describe --bootstrap-server localhost:29092 --topic test-3-1