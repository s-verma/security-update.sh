# security-update.sh
Debian Sid/Unstable Security Updater. 

This is a bash shell script for applying debian security advisory updates on Debian Sid.

Rationale:
As Debian Sid do not have explicit security fixes for Debian Sid/Unstable version which can be applied by using 'apt-get update && apt-get upgrade' as in case of Debian Stable.
Rather doing 'apt-get update && apt-get upgrade' upgrade every package in Debian Sid to latest one (if possible).

Some people may like it but others may not.
Because just like me people may like to upgrade their package only when there is security fix, otherwise they are happy with existing system. (this may be because they do not have ample bandwidth or paying charges per MB or they just don't like to mess up with their existing system.)

Debian releases security advisory for any security fixes. But on Debian, packages are organized as binary packages whereas security advisory lists name of source packages.
Each souce package is compiled into several binary package on Debian, so by just looking into Debian security advisory we can not say how many packages on system needs to be upgraded corresponding to the given source package.

Hence upgrading using security advisory is cumbersome since each source package corresponds to several binary packages in Debian 
e.g. run "apt-cache showsrc linux"
and see for yourself how many binary packages corresponds to the source package 'linux'.

Hence for these people this script comes.

This script generate a local database at ~/pack_source_list2.verma and from it finds which packages belong to given source package.

WARNING: This script is in alpha stage still. Work is going on.

HOW TO INSTALL:
Just download this file "security-update3.sh" to a directory e.g. /foo/bar
then do

chmod 744 /foo/bar/security-update3.sh

HOW TO RUN:
cd /foo/bar

./security-update3.sh --help

Next steps are self explanatory.

Just run first ./security-update3.sh -u
to upgrade database,
then check source packagename from debian security advisory.
then use 
./security-update3.sh -a packagename 
to list all installed binary packages belonging to packagename. 
