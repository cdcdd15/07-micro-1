# checks if branch has something pending
function parse_git_dirty() {
  git diff --quiet --ignore-submodules HEAD 2>/dev/null; [ $? -eq 1 ] && echo "*"
}

# gets the current git branch
function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# get last commit hash prepended with @ (i.e. @8a323d0)
function parse_git_hash() {
  git rev-parse --short HEAD 2> /dev/null | sed "s/\(.*\)/@\1/"
}

function parse_name() {
  git log -1 --pretty=format:'%an'
}

function parse_email() {
  git log -1 --pretty=format:'%ae'
}

while getopts a:b:d: flag
do
    case "${flag}" in
        a) a=${OPTARG};;
        b) b=${OPTARG};;
		d) d=${OPTARG};;
    esac
done

declare c=4
if [[ $a == 'extended' ]]
then
	echo ${a}
	echo ${b}
	if [[ $b == '' ]]
	then
		echo ${b}
	else
		c=${b}
	fi
fi
#echo ${c}

declare -a sb_projects_arr=(
	"pharma-rex-online"
	"pharma-mvs"
	"pharma-rex-archive"
	"pharma-rex-reservations")
my_len=${#sb_projects_arr[@]}
echo You have ${my_len} projects:
cd ..
cd ..
cd ..
for (( i = 0 ; i < ${my_len} ; i++))
do
  echo ""
  echo "sb project [$i]: ${sb_projects_arr[$i]}"
  cd ${sb_projects_arr[$i]}
  pwd
  GIT_BRANCH=[$(parse_git_branch)][$(parse_git_hash)]
  NAME=$(parse_name)
  EMAIL=$(parse_email)
  echo ${GIT_BRANCH}
  echo [${NAME}][${EMAIL}]
  
  echo ${d}
  
  if [[ "$(git log -q ${d}..HEAD 2> /dev/null)" == "" ]]; then
  		echo "There are no unpushed commits on this branch."
	else
  		echo "Unpushed commits:"
  		git log --graph ${d}..HEAD --pretty=format:'%C(auto)%h%d (%cr) %cn <%ce> %s'
  fi
  
  if [[ $a == 'extended' ]]
  then
  	echo "Last ${c} commits log:"
  	git log --graph --pretty=format:'%C(auto)%h%d (%cr) %cn <%ce> %s' --all -n${c}
  fi
  
  cd ..
done