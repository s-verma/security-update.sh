#Copyright © Shailendra Verma (s_verma797@yahoo.in)
#!/bin/bash

if [[ $1 = '--help' ]]
then
cat << EOF
Usage:
security_update.sh [OPTIONS] [PACKAGE_NAME]
OPTIONS:
--help		List all options.
--update or -u	Update data/record.
--apply or -a	Give suggestions/commands to be run for applying security fixes.

PACKAGE_NAME is name of debian source package published in debian security announcement.

e.g. ./security_update.sh -a vlc
list commands for upgrading package belonging to vlc debian source package.
EOF
fi

if [[ $1 = '--update' || $1 = '-u' ]]
then
if [ -e ~/pack_source_list2.verma ]
then
rm ~/pack_source_list2.verma
fi

for i in $(apt-cache show $(dpkg -l|tail -n +6|awk '{print $2}') |egrep '^Package:|^Version:|^Source:'|tr ' ' '_')
do
if [[ `echo $i|grep '^Package:'` ]]
then
pack=$(echo $i|awk -F '_' '{print $2}')
elif [[ `echo $i|grep '^Source:'` ]]
then
source=$(echo $i|awk -F '_' '{print $2}')
elif [[ `echo $i|grep '^Version:'` ]]
then
version=$(echo $i|awk -F '_' '{print $2}')
echo $source:$pack:$version >> ~/pack_source_list2.verma
pack=
source=
version=
fi
done
echo "Now run 'apt-get update' as root."
fi

if [[ $1 = '--apply' || $1 = '-a' ]]
then
#apt-get install --only-upgrade $(grep '$2 ' ~/pack_source_list.verma |awk '{print $2}'|grep -v '^[0-9]')
strng=$(egrep "^${2}:|:${2}:" ~/pack_source_list2.verma |awk -F ':' '{print $2}'|sort -u|tr '\n' ' ')
echo
echo "These are packages installed alongwith versions."
echo "Check the version with Debian Security Advisory."
echo
for i in ${strng}
do
echo $(dpkg -l|awk '{print $2, $3}'|egrep "^${i} |^${i}:")
done
echo 
if [[ $strng == "" ]]
then
echo "Nothing to apply."
else
echo "If you have older version than recommended by Debian Security Advisory, then"
echo "Please run as root."
echo " apt-get install --only-upgrade ${strng}"
fi
echo
fi
