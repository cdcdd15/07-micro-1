a=0
flag=true
while [ "$flag" = true ]
do
 echo $a
 echo $flag
 if [ $a -gt 10 ]
 then
   echo "sum too large"
   flag=false
 else
   echo "sum is fine"
 fi
   a=`expr $a + 1`
done