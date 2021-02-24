#!/bin/bash

echo "contruction des images docker taggee"
echo "puis push de ces images sur docker hub"

#docker images

listeContainers=("bfroger/popote-php-fpm" "bfroger/popote-nginx" "bfroger/popote-database")

for container in ${listeContainers[@]}
do
    echo -n $container
    echo -n " => "
    #imageId=$(docker images | grep $container | grep latest | sed -e"s/    / /g" | sed -e"s/   / /g" | sed -e"s/  / /g" |cut -d " " -f3 )
    #echo $imageId
    docker push ${container}
done
