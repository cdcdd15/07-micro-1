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
	while [ "$flag" = true ]
	do
 		echo ' '
 		echo 'attempt-until-push-image-function image name:' $image_name
 		local BIGR=$(check-image-exists-on-remote-repo ${image_name})
 		echo 'response:' $BIGR
 		if [ $BIGR == true ]
 		then
   			echo "Image exists on remote repo"
   			flag=false
 		else
   			echo "Image not exists. Try to push it."
   			docker push ${image_name}
 		fi
 		sleep 5
	done
}

function check-image-exists-locally () {
    #echo 'function image-exists image name:' $1
	if [[ "$(docker images -q ${1} 2> /dev/null)" == "" ]]; then
  		echo false
	else
  		echo true
fi
}

function check-image-exists-on-remote-repo() {
	image_name=$1
	#echo "check-image-exists-on-remote-repo: ${1}"
    #docker pull library/nginx:1.7.5 > /dev/null && echo "success1" || echo "failed1"
    #if image does exist on docker hub, than try to pull it
    docker pull ${1} > /dev/null && echo true || echo false
}

#declare an array variable with the list of images
declare -a image_arr=(
	"cosdin/07-micro-1:0.0.1-SNAPSHOT"
	"cosdin/07-micro-2:0.0.1-SNAPSHOT"
	"cosdin/07-config-server:0.0.1-SNAPSHOT"
	"cosdin/netflix-eureka-naming-server:0.0.1-SNAPSHOT"
	"cosdin/netflix-zuul-api-gateway-server:0.0.1-SNAPSHOT"
	"cosdin/07-spring-admin-dev:0.0.1-SNAPSHOT"
	"rabbitmq:3-management-alpine"
	"openzipkin/zipkin:latest"
	"logstash:7.10.1"
	"kibana:7.10.1"
	"elasticsearch:7.10.1"
	"openjdk:8-jdk-alpine")
my_len=${#image_arr[@]}
for (( i = 0 ; i < my_len ; i++))
do
  echo "Element [$i]: ${image_arr[$i]}"
done

#:<<'COMM2'
for i in "${image_arr[@]}"
do
   attempt-until-pull-image-function "$i"
done
#COMM2

for i in "${image_arr[@]}"
do
	#call function
	attempt-until-push-image-function "$i"
done
echo ' '
echo 'Image list on local docker:'
docker images