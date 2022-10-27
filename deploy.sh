#!/bin/bash
wow_folder="/mnt/w/World of Warcraft/"
clients=("ptr" "retail" "beta")

for client in ${clients[@]}
do
    cp -Rv ./* "$wow_folder""_"$client"_/Interface/AddOns"
    rm -v "$wow_folder""_"$client"_/Interface/AddOns/deploy.sh"
done