echo ' '
echo '<step1>Stop all containers locally'
docker stop $(docker ps -a -q)

echo ' '
echo '<step2>Remove all containers locally'
docker rm $(docker ps -a -q)

echo ' '
echo '<step3>List all containers locally'
docker container list -a

echo ' '
echo '<step4>Remove all images locally'
docker rmi -f $(docker images -a -q)

echo ' '
echo '<step5>Image list on local docker'
docker images

echo ' '
echo '<step6>Remove all networks (except the 3 default ones)'
docker network remove spring-micros-net 07-micro-1_default

echo ' '
echo '<step7>leave local docker environment clean: check no images, containers, networks exist on local Docker'
echo ' '
echo 'Image list on local docker:'
docker images
echo ' '
echo 'Containers present locally:'
docker container list -a
echo ' '
echo 'Network list on local docker:'
docker network list
