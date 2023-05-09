#!/bin/bash

for f in `find src/overrides -not -type d -printf "%f\n"`; do
  echo "Removing $f"
  grep -v -P "(?<!overrides/)${f}" $1 > overrides-tmp
  diff overrides-tmp $@ | grep ">\|<"
  cp overrides-tmp $1
done

for f in `find src/overrides -not -type d -printf "%f\n"`; do
  echo "Removing $f"
  grep -v -P "(?<!overrides/)${f}" $1 > overrides-tmp
  diff overrides-tmp $@ | grep ">\|<"
  cp overrides-tmp $1
done
