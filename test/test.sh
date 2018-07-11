#!/bin/sh
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

search_config() {
    local prefix=$2
    parse_yaml $1 ${prefix}
    local val_name=${prefix}inherit
    echo "test:${val_name}"
    values=$(echo ${val_name} | \
                sed -e "s/\[/\(/" \
                    -e "s/[ \t]*$//" \
                    -e "s/\]\$/\)/" \
                    -e "s/,/ /g" \
                    -e "s/  */ /g")

    echo "inherits=${values}"
}

search_config config.yml config

# eval $(search_config config.yml)

# for item in ${inherits[@]}; do
#    echo $item
# done