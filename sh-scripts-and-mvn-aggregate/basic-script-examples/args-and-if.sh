while getopts a:b: flag
do
    case "${flag}" in
        a) a=${OPTARG};;
        b) b=${OPTARG};;
    esac
done

echo $a

c=0
c=`expr $a + $b`
echo 'The sum is: ' $c

if [ $c -gt 100 ]
then
   echo "sum too large"
else
   echo "sum is fine"
fi

if [ $a == $b ]
then
   echo "a is equal to b"
else
   echo "a is not equal to b"
fi

#./args-and-if.sh -a 1 -b 2