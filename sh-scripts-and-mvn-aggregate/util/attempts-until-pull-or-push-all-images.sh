function attempt-until-pull-image-function () {
    flag=true
	while [ "$flag" = true ]
	do
 		echo ' '
 		image_name=$1
 		echo 'function attempt-until-pull-image image name:' $image_name
 		BIGR=$(image-exists-locally ${image_name})
 		#echo 'Image exists (finally):' $BIGR		
 		if [ $BIGR == true ]
 		then
   			echo "Image exists"
   			flag=false
 		else
   			echo "Image not exists. Try to pull it."
   			docker pull ${image_name}
 		fi
 		sleep 5
	done
}

function image-exists-locally () {
    #echo 'function image-exists image name:' $1
	exists=false
	if [[ "$(docker images -q ${1} 2> /dev/null)" == "" ]]; then
  		#exists=false
  		echo false
	else
  		#exists=true
  		echo true
fi
}

#call the function:
#BIGR=$(image-exists cosdin/07-spring-admin-dev:0.0.1-SNAPSHOT)
#image-exists cosdin/07-spring-admin-dev:0.0.1-SNAPSHOT

# declare an array variable
declare -a arr=("cosdin/07-micro-1:0.0.1-SNAPSHOT" "cosdin/07-micro-2:0.0.1-SNAPSHOT" "cosdin/07-config-server:0.0.1-SNAPSHOT" "cosdin/netflix-eureka-naming-server:0.0.1-SNAPSHOT" "cosdin/netflix-zuul-api-gateway-server:0.0.1-SNAPSHOT" "cosdin/07-spring-admin-dev:0.0.1-SNAPSHOT")
filename=../all-images.txt
declare -a myArray
myArray=(`cat "$filename"`)
my_len=${#myArray[@]}
for (( i = 0 ; i < my_len ; i++))
do
  echo "Element [$i]: ${myArray[$i]}"
done
for (( i = 0 ; i < my_len ; i++))
do
  echo "Element [$i]: ${arr[$i]}"
done
for i in "${myArray[@]}"
do
   attempt-until-pull-image-function "$i"
done