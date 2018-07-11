
eval $(parse_yaml config.yml)

echo $pdfmaker_coverpdf

pdftk $pdfmaker_coverpdf "${bookname}.pdf" cat output result.pdf