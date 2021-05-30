while getopts n: flag
do
    case "${flag}" in
        n) name=${OPTARG};;
    esac
done
echo 'Image name: ' $name
exists=false
if [[ "$(docker images -q ${name} 2> /dev/null)" == "" ]]; then
#if [[ "$(docker images -q cosdin/07-spring-admin-dev:0.0.1-SNAPSHOT 2> /dev/null)" == "" ]]; then
  exists=false
else
  exists=true
fi
echo 'Exists: ' $exists