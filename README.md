# security-update.sh
Debian Sid/Unstable Security Updater. 

This is a bash shell script for applying debian security advisory updates on Debian Sid.

Rationale:
As Debian Sid do not have explicit security fixes for Debian Sid/Unstable version which can be applied by using 'apt-get update && apt-get upgrade' as in case of Debian Stable.
Rather doing 'apt-get update && apt-get upgrade' upgrade every package in Debian Sid to latest one.

Some people may like it but others may not.
Because just like me people may like to upgrade their package only when there is security fix, otherwise they are happy with existing system. (this may be because they do not have ample bandwidth or paying charges per MB or they just don't like to mess up with their system.)
For this Debian security announce serve the purpose.
But it only provides info about which source package need to be updated.

Since each source package corresponds to several binary packages in Debian 
e.g. run "apt-cache showsrc linux"
and see for yourself how many binary packages corresponds to the source package 'linux'.

Since system has binary packages installed now the user has to find out which package belong to the given source package. Thus manually finding and applying update become somewhat complicated task.

Hence for these people this script comes.

This script generate a local database at ~/pack_source_list2.verma and from it finds which packages belong to given source package.

WARNING: This script is in alpha stage still. Work is going on.

HOW TO INSTALL:
Just download this file "security-update2.sh" to a directory e.g. /foo/bar
then do

chmod 744 /foo/bar/security-update2.sh

HOW TO RUN:
cd /foo/bar

./security-update2.sh --help

Next steps are self explanatory.
