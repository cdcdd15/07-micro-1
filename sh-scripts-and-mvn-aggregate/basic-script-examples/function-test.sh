function max ()
{
    local HIDN
    if [ $1 -gt $2 ]
    then
        BIGR=$1
    else
        BIGR=$2
    fi
    HIDN=5
}

# call the function:
max 128 211
# use the result:
echo $BIGR