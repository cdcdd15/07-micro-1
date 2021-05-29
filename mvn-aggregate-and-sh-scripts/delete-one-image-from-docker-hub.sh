while getopts u:p:n:r: flag
do
    case "${flag}" in
        u) username=${OPTARG};;
        p) password=${OPTARG};;
        n) namespace=${OPTARG};;
        r) reponame=${OPTARG};;
    esac
done

echo "Username: $username";
echo "Password: $password";
echo "Namespace: $namespace";
echo "Reponame: $reponame";

#curl -X DELETE -u "$username:$password" https://index.docker.io/v1/repositories/$namespace/$reponame/
docker run --rm -it lumir/remove-dockerhub-tag --user user \ --password pass org/image_1:tag_1 org/image_2:tag_2 ...
