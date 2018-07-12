#!/bin/bash
source parse_config.sh

src=`pwd`
mkdir /var/tmp/mdview
cp -R * /var/tmp/mdview/
cd /var/tmp/mdview/
md2reviews.sh
sed -i -e "s/.md/.re/g" catalog.yml
review-pdfmaker $1

parse_config $1
if [ -f ${mdview_pdfmaker_coverpdf} ]; then
  echo Append cover PDF:$mdview_pdfmaker_coverpdf
  pdftk $mdview_pdfmaker_coverpdf "${mdview_bookname}.pdf" cat output result.pdf
  mv result.pdf "${src}/${mdview_bookname}.pdf"
else
  cp "${mdview_bookname}.pdf" $src
fi
