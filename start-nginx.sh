#!/usr/bin/env bash
# export EXISTING_VARS=$(printenv | awk -F= '{print $1}' | sed 's/^/\$/g' | paste -sd,);
for file in $JSFOLDER;
do
  # IN this version I am doing this for every environment file
  cat $file | envsubst $ENV | tee $file
done
nginx -g 'daemon off;'