echo ' '
echo '<step1>kind of prerequisite: stop, delete and check no images, containers, networks exist on local Docker'
./clean-local-docker-env.sh
docker images
docker container list -a
docker network list

echo ' '
echo '<step2>Build images locally'
mvn clean package -DskipTests

echo ' '
echo '<step4>List all images locally'
docker images

echo ' '
echo '<step5>Remove all images locally'
#docker rmi -f $(docker images -a -q)

echo ' '
echo '<step6>List all containers locally'
docker container list -a

echo ' '
echo '<step7>Create network'
docker network create spring-micros-net

echo ' '
echo '<step8>Run containers with docker compuse (this will first download all necessary images on the local Docker)'
docker compose -f ../docker-compose.yml up -d

echo ' '
echo '<step9>List all containers locally'
docker container list -a