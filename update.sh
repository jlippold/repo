#!/bin/bash

echo

./clean.sh

echo
echo "Rebuilding package list..."
echo "--------------------------"

#./dpkg-scanpackages.pl -m ./debs /dev/null >Packages
dpkg-scanpackages -m ./debs /dev/null >Packages
rm -f Packages.bz2
bzip2 -k Packages

sed -i '' 's/.\/debs/https:\/\/jlippold.github.io\/repo\/debs/g' Packages


echo "--------------------------"
echo "Done."
echo
