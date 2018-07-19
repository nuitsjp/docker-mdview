#!/bin/bash
parse_yaml() {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\)\($w\)s$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p" $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}

parse_config()
{
    local inherits=""
    local l_inherit=""
    local values=""
    eval $(parse_yaml $1 "l_")
    values=$(echo ${l_inherit} | \
                sed -e "s/\[/\(/" \
                    -e "s/[ \t]*$//" \
                    -e "s/\]/\)/" \
                    -e "s/,/ /g" \
                    -e "s/  */ /g")
    eval $(echo "local inherits=${values}")

    for item in ${inherits[@]}; do
        parse_config $item
    done
    eval $(parse_yaml $1 "mdview_")
}

