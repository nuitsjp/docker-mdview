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
  pdftk $mdview_pdfmaker_coverpdf output uncompressed.pdf uncompress
  sed -e "s/date/2018-07-11/g" <uncompressed.pdf >modified.pdf
  pdftk modified.pdf output recompressed.pdf compress
  pdftk recompressed.pdf "${mdview_bookname}.pdf" cat output result.pdf
  rm "${mdview_bookname}.pdf"
  # rm uncompressed.pdf
  rm modified.pdf
  rm recompressed.pdf
  mv result.pdf "${mdview_bookname}.pdf"
fi

cp *.pdf $src