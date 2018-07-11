#!/bin/bash

oldtext=$1
newtext=$2
pdffile=$3

cp $pdffile $pdffile.bak
pdftk $pdffile output $pdffile.tmp uncompress
sed -i "s/$oldtext/$newtext/g" $pdffile.tmp
pdftk $pdffile.tmp output $pdffile compress
rm -rf *.bak
rm -rf *.tmp

Then run this command:

for i in *.pdf ; do replacepdftext.sh oldword newword $i ; done

where replacepdftext.sh is the name of the file earlier created