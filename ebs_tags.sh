###################################
# EC2 Automated tag script        #
###################################

for i in `aws ec2 describe-instances | grep -i instanceid | awk '{print $2}'| sed 's/\"//g;s/\,//g'`
#for i in `aws ec2 describe-instances --filters "Name=tag:Name,Values=MTLN-TAG-TEST" | grep -i instanceid | awk '{print $2}'| sed 's/\"//g;s/\,//g'`

do
echo ${i}

volarray=`aws ec2 describe-instances --instance-ids ${i} | grep -i vol | awk '{print $2}' | tr '\n' ' ' | sed 's/\"//g;s/\,//g;s/.$//'`
sbutag=`aws ec2 describe-instances --instance-ids ${i} | grep -i -C 1 SBU | grep -i value | awk '{print $2}' | sed 's/\"//g;s/\,//g'`
categorytag=`aws ec2 describe-instances --instance-ids ${i} | grep -i -C 1 category | grep -i value | awk '{print $2}' | sed 's/\"//g;s/\,//g'`

if [ -z "$sbutag" ]; then
  sbutag="unset"
elif [ -z "$categorytag" ]; then
  categorytag="unset"
else
  echo > /dev/null
fi


#Debug
#echo ${volarray}
#echo ${sbutag}
#echo ${categorytag}

aws ec2 create-tags --resources ${volarray} --tags Key=SBU,Value=${sbutag} Key=Category,Value=${categorytag}

done
