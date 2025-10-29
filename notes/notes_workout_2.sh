## status check

docker exec broker1 /opt/kafka/bin/kafka-metadata-quorum.sh --bootstrap-server broker1:9092 describe --status

##

## kafka topic oluşturma 8 partition ve 3 replication factor

docker exec broker1 /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server broker1:9092 \
  --create \
  --topic scaling-test-topic \
  --partitions 8 \
  --replication-factor 3

##

## topic dağılım kontrolü

docker exec broker1 /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server broker1:9092 \
  --describe \
  --topic scaling-test-topic

###


## cluster scale up

docker-compose --profile scale-up up -d broker5 broker6

##

## cluster durum kontrolü

docker exec broker1 /opt/kafka/bin/kafka-metadata-quorum.sh --bootstrap-server broker1:9092 describe --status

##

## rebalance json - kafkaya plan veriyorsun altısına eşit dağıt diye

echo '{"topics": [{"topic": "scaling-test-topic"}], "version": 1}' | \
docker exec -i broker1 /opt/kafka/bin/kafka-reassign-partitions.sh \
  --bootstrap-server broker1:9092 \
  --topics-to-move-json-file /dev/stdin \
  --broker-list "1,2,3,4,5,6" \
  --generate

##

## rebalance pencere durumu kontrolü rebalance raporu oluşturması için 

curl -s "http://localhost:9090/kafkacruisecontrol/state" | grep "NumValidWindows"

##

## mesaj basma trafik oluşturmak için 

for i in {1..2000}; do
  echo "key$i:Message $i - batch 2"
done | docker exec -i broker1 /opt/kafka/bin/kafka-console-producer.sh \
  --bootstrap-server broker1:9092 \
  --topic scaling-test-topic \
  --property "parse.key=true" \
  --property "key.separator=:"

##

## cruise control dry run simule et ne yapacağını

curl -X POST "http://localhost:9090/kafkacruisecontrol/rebalance?dryrun=true&skip_hard_goal_check=true"

##

## topic broker detayları 

docker exec broker1 /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server broker1:9092 \
  --describe

##

## cruise control rebalance işlemi yürütme

curl -X POST "http://localhost:9090/kafkacruisecontrol/rebalance?dryrun=false&skip_hard_goal_check=true"

##

## control et rebalance yapmış mı?

docker exec broker1 /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server broker1:9092 \
  --describe \
  --topic scaling-test-topic