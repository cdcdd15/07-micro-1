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

# DEMO
GIT_BRANCH=[$(parse_git_branch)][$(parse_git_hash)]
echo ${GIT_BRANCH}
NAME=$(parse_name)
EMAIL=$(parse_email)
echo [${NAME}][${EMAIL}]
