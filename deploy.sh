#!/bin/bash
dev_folder="/mnt/w/Dev Addons/"
wow_folder="/mnt/w/World of Warcraft/"
clients=("ptr" "retail" "beta")

for client in ${clients[@]}
do
    if [ -d "$wow_folder""_"$client"_/Interface/AddOns" ]
    then
        echo "Copying to" $client
        cp -Rv $dev_addons* "$wow_folder""_"$client"_/Interface/AddOns"
        rm -v "$wow_folder""_"$client"_/Interface/AddOns/deploy.sh"
        rm -v "$wow_folder""_"$client"_/Interface/AddOns/README.md"
    else # folder doesn't exit
        echo "Skipping $client"
    fi
done