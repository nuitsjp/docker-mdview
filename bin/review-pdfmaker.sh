src=`pwd`
mkdir /var/tmp/mdview
cp -R * /var/tmp/mdview/
cd /var/tmp/mdview/
md2reviews.sh
sed -i -e "s/.md/.re/g" catalog.yml
review-pdfmaker $1
cp *.pdf $src