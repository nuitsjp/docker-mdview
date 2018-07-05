#!/bin/sh
review-init $1
sed -i -e "s/.re/.md/g" $1/catalog.yml
sed -e "s/=/#/g" $1/$1.re > $1/$1.md
rm $1/$1.re
