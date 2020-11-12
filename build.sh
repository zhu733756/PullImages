#!/bin/bash

for imagepath in $(cat ./rook-ceph)
do
imagename=$(echo $imagepath | awk -F '/' '{print $NF}')
docker pull $imagepath

# push到dockerhub
docker tag $imagepath zhu733756/$imagename
docker push zhu733756/$imagename
done