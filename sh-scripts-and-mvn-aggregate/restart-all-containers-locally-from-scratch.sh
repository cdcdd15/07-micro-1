while getopts a:b: flag
do
    case "${flag}" in
        a) a=${OPTARG};;
        b) b=${OPTARG};;
    esac
done
#echo $a
#echo $b

echo ' '
echo '<step1>kind of prerequisite: stop, delete and check no images, containers, networks exist on local Docker'
./clean-local-docker-env.sh
docker images
docker container list -a
docker network list

if [[ $a == 'no_maven_build' ]]
then
	#<<'COMMENT1'
	echo ' '
	echo '<step>Pull spring boot project images from remote Docker Hub repo.'
	./attempts-until-pull-or-push-all-images.sh -a project_pull
	#COMMENT1
fi

#<<'COMMENT1'
echo ' '
echo '<step2>Pull official images from remote Docker Hub repo.'
./attempts-until-pull-or-push-all-images.sh -a official_pull
#COMMENT1

if [[ $a = 'no_maven_build' ]]
then
	echo '<step3>no_maven_build - skip build images locally'
else
	echo ' '
	echo '<step3>Build images locally'
	mvn clean package -DskipTests
fi

echo ' '
echo '<step4>List all images locally'
docker images

echo ' '
echo '<step5>List all containers locally'
docker container list -a

echo ' '
echo '<step6>Create network'
docker network create spring-micros-net

echo ' '
echo '<step7>Run containers with docker compuse (this will first download all necessary images on the local Docker)'
docker compose -f ../docker-compose.yml up -d

echo ' '
echo '<step8>List all containers locally'
docker container list -a