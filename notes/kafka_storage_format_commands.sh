docker run --rm \
  -v $(pwd)/data/broker1:/var/lib/kafka/data \
  -v $(pwd)/configs/broker1.properties:/etc/kafka/broker.properties \
  confluentinc/cp-kafka:7.6.1 \
  kafka-storage format \
  --ignore-formatted \
  --cluster-id 6VKsvE_XSzC1zMWfZod8sg \
  --config /etc/kafka/broker.properties


  docker run --rm \
  -v $(pwd)/data/broker2:/var/lib/kafka/data \
  -v $(pwd)/configs/broker2.properties:/etc/kafka/broker.properties \
  confluentinc/cp-kafka:7.6.1 \
  kafka-storage format \
  --ignore-formatted \
  --cluster-id 6VKsvE_XSzC1zMWfZod8sg \
  --config /etc/kafka/broker.properties


  docker run --rm \
  -v $(pwd)/data/broker3:/var/lib/kafka/data \
  -v $(pwd)/configs/broker3.properties:/etc/kafka/broker.properties \
  confluentinc/cp-kafka:7.6.1 \
  kafka-storage format \
  --ignore-formatted \
  --cluster-id 6VKsvE_XSzC1zMWfZod8sg \
  --config /etc/kafka/broker.properties


docker run --rm \
  -v $(pwd)/data/broker4:/var/lib/kafka/data \
  -v $(pwd)/configs/broker4.properties:/etc/kafka/broker.properties \
  confluentinc/cp-kafka:7.6.1 \
  kafka-storage format \
  --ignore-formatted \
  --cluster-id 6VKsvE_XSzC1zMWfZod8sg \
  --config /etc/kafka/broker.properties


docker run --rm \
  -v $(pwd)/data/broker5:/var/lib/kafka/data \
  -v $(pwd)/configs/broker5.properties:/etc/kafka/broker.properties \
  confluentinc/cp-kafka:7.6.1 \
  kafka-storage format \
  --ignore-formatted \
  --cluster-id 6VKsvE_XSzC1zMWfZod8sg \
  --config /etc/kafka/broker.properties




docker run --rm \
  -v $(pwd)/data/broker4:/var/lib/kafka/data \
  -v $(pwd)/configs/broker4.properties:/etc/kafka/broker.properties \
  confluentinc/cp-kafka:7.6.1 \
  kafka-storage format \
  --ignore-formatted \
  --cluster-id 6VKsvE_XSzC1zMWfZod8sg \
  --config /etc/kafka/broker.properties



NOTES: 

MacBook-Pro KAFKA_CLUSTER % docker exec -it broker1 bash                                                                      

broker1:/$ kafka-metadata-quorum.sh --bootstrap-server broker1:9092 describe --status
bash: kafka-metadata-quorum.sh: command not found
broker1:/$ cd /opt/kafka/bin
broker1:/opt/kafka/bin$ ./kafka-metadata-quorum.sh --bootstrap-server broker1:9092 describe --status
ClusterId:              6VKsvE_XSzC1zMWfZod8sg
LeaderId:               3
LeaderEpoch:            4
HighWatermark:          572
MaxFollowerLag:         0
MaxFollowerLagTimeMs:   235
CurrentVoters:          [1,2,3]
CurrentObservers:       [4,5]
broker1:/opt/kafka/bin$ 


