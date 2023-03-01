#!/usr/bin/env bash

vars="${4}"

[[ "$3" == "false" ]] && keep="" || keep="-keep"

varArgs=""

while IFS= read -r line; do
    varArgs="$varArgs-var $line "
done <<< "$vars"

echo "vars: $varArgs"

if [ "$5" == "latest" ]
then
    echo "Using ungen latest"
    ungenCommand="ungen -i $1 -o $2 $keep -zip $varArgs"
    echo "ungenCommand: $ungenCommand"
    eval $ungenCommand
else
    echo "Using ungen version $5"
    curl -o ungen.tar.gz -L https://github.com/howlowck/ungen/releases/download/$5/ungen_Linux_x86_64.tar.gz
    tar -xvzf ungen.tar.gz
    ungenCommand="./ungen -i $1 -o $2 $keep -zip $varArgs"
    echo "ungenCommand: $ungenCommand"
    eval $ungenCommand 
fi
