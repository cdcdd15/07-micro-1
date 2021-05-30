#varaible inside script
SCRIPT_NICKNAME="end-to-end"

echo ' '
echo '<'${SCRIPT_NICKNAME} 'step1>kind of prerequisite: stop, delete and check no images, containers, networks exist on local Docker'
./clean-local-docker-env.sh
#docker images
#docker container list -a
#docker network list

echo ' '
echo '<'${SCRIPT_NICKNAME} 'step2>Build images locally'
mvn clean package -DskipTests

echo ' '
echo '<'${SCRIPT_NICKNAME} 'step3>Push images to docker.io (Docker hub)'
./push-all-images-to-docker-hub.sh

#:<<'COMM2'
echo ' '
echo '<'${SCRIPT_NICKNAME} 'step4>List all images locally'
docker images

echo ' '
echo '<'${SCRIPT_NICKNAME} 'step5>Remove all images locally'
docker rmi -f $(docker images -a -q)

echo ' '
echo '<'${SCRIPT_NICKNAME} 'step6>List all containers locally'
docker container list -a

echo ' '
echo '<'${SCRIPT_NICKNAME} 'step7>Create network'
docker network create spring-micros-net

echo ' '
echo '<'${SCRIPT_NICKNAME} 'step8>Run containers with docker compuse (this will first download all necessary images on the local Docker)'
docker compose -f ../docker-compose.yml up -d

echo ' '
echo '<'${SCRIPT_NICKNAME} 'step9>List all containers locally'
docker container list -a

./clean-local-docker-env.sh
#COMM2