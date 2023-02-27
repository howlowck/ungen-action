#!/bin/sh -l
vars="${4}"

[[ "$3" == "false" ]] && keep="" || keep="-keep"

varArgs=""

for var in $vars
do
    varArgs="$varArgs -var $var"
done

echo "vars: $varArgs"

if [ "$5" == "latest" ]
then
    echo "Using ungen latest"
    ungen -i $1 -o $2 $keep $varArgs -zip
else
    echo "Using ungen version $5"
    curl -o ungen.tar.gz -L https://github.com/howlowck/ungen/releases/download/$5/ungen_Linux_x86_64.tar.gz
    tar -xvzf ungen.tar.gz
    ./ungen -i $1 -o $2 $keep $varArgs -zip
fi
