#!/bin/sh -l
vars="${4}"

[[ "$3" == "false" ]] && keep="" || keep="-keep"

varArgs=""

for var in $vars
do
    varArgs="$varArgs -var $var"
done

echo "vars: $varArgs"

ungen -i $GITHUB_WORKSPACE/$1 -o $GITHUB_WORKSPACE/$2 $keep $varArgs -zip

file=$(basename $2).zip

unzip $file -d $GITHUB_WORKSPACE/$2
