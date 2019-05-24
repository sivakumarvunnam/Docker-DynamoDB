FROM adoptopenjdk/openjdk8
MAINTAINER Sivakumar Vunnam <sivakumar.vunnam@bhnetwork.com>
# Create our main application folder.
RUN apt-get update && apt-get install -y wget git curl
RUN mkdir -p opt/dynamodb
WORKDIR /opt/dynamodb
# Download and unpack dynamodb.
# Links are from: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html
RUN wget https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz -q -O - | tar -xz
# The entrypoint is the dynamodb jar. Default port is 8000.
EXPOSE 8000
ENTRYPOINT ["java", "-jar", "DynamoDBLocal.jar"]
