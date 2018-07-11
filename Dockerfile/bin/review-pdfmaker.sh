#!/bin/bash
source yaml.sh

src=`pwd`
mkdir /var/tmp/mdview
cp -R * /var/tmp/mdview/
cd /var/tmp/mdview/
md2reviews.sh
sed -i -e "s/.md/.re/g" catalog.yml
review-pdfmaker $1

eval $(parse_yaml config.yml)
if [ -f ${pdfmaker_coverpdf} ]; then
  pdftk $pdfmaker_coverpdf "${bookname}.pdf" cat output result.pdf
fi

cp *.pdf $src