#!/bin/bash
clients=("ptr" "retail" "beta")

for client in ${clients[@]}
do
    cp -Rv ./* "/mnt/w/World of Warcraft/_"$client"_/Interface/AddOns"
    rm -v "/mnt/w/World of Warcraft/_"$client"_/Interface/AddOns/deploy.sh"
done

# for client in ${clients[@]}
# do
    
# done
