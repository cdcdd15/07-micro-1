function docker_tag_exists() {
    #curl --silent -f -lSL https://index.docker.io/v1/repositories/$1/tags/$2 > /dev/null
    docker pull library/nginx:1.7.5 > /dev/null && echo "success1" || echo "failed1"
    docker pull cosdin/07-micro-1:0.0.1-SNAPSHOT > /dev/null && echo "success1" || echo "failed1"
}
docker_tag_exists
#if docker_tag_exists library/nginx 1.7.5; then
#if docker_tag_exists cosdin/07-micro-1 0.0.1-SNAPSHOT; then
#    echo exist
#else 
#    echo not exists
#fi