echo '<step1>Stop all containers locally'
docker stop $(docker ps -a -q)

echo '<step2>Remove all containers locally'
docker rm $(docker ps -a -q)

echo '<step3>List all containers locally'
docker container list -a

echo '<step4>Remove all images locally'
docker rmi -f $(docker images -a -q)

echo '<step5>List all images locally'
docker images

echo '<step6>Remove network'
docker network remove spring-micros-net

echo '<step7>leave local docker environment clean: check no images, containers, networks exist on local Docker'
docker images
docker container list -a
docker network list