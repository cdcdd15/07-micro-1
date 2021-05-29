#prerequisite: check no images, containers, networks exist on local Docker

echo '<step1>kind of prerequisite: stop, delete and check no images, containers, networks exist on local Docker'
./clean-local-docker-env.sh
docker images
docker container list -a
docker network list

echo '<step2>Build images locally'
mvn clean package -DskipTests

#<<'COMM2'
echo '<step3>Push images to docker.io (Docker hub)'
docker push cosdin/07-micro-1:0.0.1-SNAPSHOT
docker push cosdin/07-micro-2:0.0.1-SNAPSHOT
docker push cosdin/07-config-server:0.0.1-SNAPSHOT
docker push cosdin/netflix-eureka-naming-server:0.0.1-SNAPSHOT
docker push cosdin/netflix-zuul-api-gateway-server:0.0.1-SNAPSHOT
docker push cosdin/07-spring-admin-dev:0.0.1-SNAPSHOT
#COMM2

echo '<step4>List all images locally'
docker images

echo '<step5>Remove all images locally'
docker rmi -f $(docker images -a -q)

echo '<step6>List all containers locally'
docker container list -a

echo '<step7>Create network'
docker network create spring-micros-net

echo '<step8>Run containers with docker compuse (this will first download all necessary images on the local Docker)'
docker compose -f ../docker-compose.yml up -d

echo '<step9>List all containers locally'
docker container list -a

./clean-local-docker-env.sh