function attempt-until-pull-image-function () {
	image_name=$1
    flag=true
	while [ "$flag" = true ]
	do
 		echo ' '
 		echo 'attempt-until-pull-image-function image name:' $image_name
 		local BIGR=$(check-image-exists-locally ${image_name})
 		#echo 'Image exists (finally):' $BIGR		
 		if [ $BIGR == true ]
 		then
   			echo "Image exists locally"
   			flag=false
 		else
   			echo "Image not exists. Try to pull it."
   			docker pull ${image_name}
 		fi
 		sleep 2
	done
}

function attempt-until-push-image-function () {
	image_name=$1
    flag=true
	echo ' '
	echo 'attempt-until-push-image-function image name:' $image_name
	local BIGR=$(check-image-exists-locally ${image_name})
	echo 'response:' $BIGR
	if [ $BIGR == true ]
	then
		echo "Image exists locally so try push it."
		until docker push ${image_name}
		do
  			echo "Try again"
		done
		#docker push ${image_name}
	else
		echo "Image not exists locally so cannot push it."
	fi
}

function check-image-exists-locally () {
    #echo 'function image-exists image name:' $1
	if [[ "$(docker images -q ${1} 2> /dev/null)" == "" ]]; then
  		echo false
	else
  		echo true
fi
}

while getopts a: flag
do
    case "${flag}" in
        a) a=${OPTARG};;
    esac
done
echo $a

declare -a projects_image_arr=(
	"cosdin/07-micro-1:0.0.1-SNAPSHOT"
	"cosdin/07-micro-2:0.0.1-SNAPSHOT"
	"cosdin/07-config-server:0.0.1-SNAPSHOT"
	"cosdin/netflix-eureka-naming-server:0.0.1-SNAPSHOT"
	"cosdin/netflix-zuul-api-gateway-server:0.0.1-SNAPSHOT"
	"cosdin/07-spring-admin-dev:0.0.1-SNAPSHOT")
declare -a official_image_arr=(
	"rabbitmq:3-management-alpine"
	"openzipkin/zipkin:latest"
	"logstash:7.10.1"
	"kibana:7.10.1"
	"elasticsearch:7.10.1"
	"openjdk:8-jdk-alpine")
	
my_len1=${#official_image_arr[@]}
for (( i = 0 ; i < my_len1 ; i++))
do
  #echo "official_image [$i]: ${official_image_arr[$i]}"
done
my_len2=${#projects_image_arr[@]}
for (( i = 0 ; i < my_len2 ; i++))
do
  #echo "projects_image [$i]: ${projects_image_arr[$i]}"
done

c=0

if [ $a == 'project_pull' ]
then
	c=`expr $c + 1`
	for i in "${projects_image_arr[@]}"
	do
   		attempt-until-pull-image-function "$i"
	done
fi

if [ $a == 'official_pull' ]
then
	c=`expr $c + 1`
	for i in "${official_image_arr[@]}"
	do
   		attempt-until-pull-image-function "$i"
	done
fi

if [ $a == 'push' ]
then
	c=`expr $c + 1`
	for i in "${projects_image_arr[@]}"
	do
		attempt-until-push-image-function "$i"
	done
fi

if [ $c == 0 ]
then
	echo '-a should have one of the 2 values: push or pull'
fi

echo ' '
echo 'Image list on local docker:'
docker images