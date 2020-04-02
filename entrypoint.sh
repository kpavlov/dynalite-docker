java -version
java -server -jar DynamoDBLocal.jar $DYNAMODB_OPTIONS -port $DYNAMODB_PORT &

alias aws="/usr/bin/aws"

echo "Running initdb.sh"
source /initdb.sh
echo "initdb.sh done"

while(true)
do
    sleep 3000
done
