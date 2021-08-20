#! /bin/bash

filepath='images.txt'

for imagepath in $(cat ./$filepath)
do
imagename=$(echo $imagepath | awk -F '/' '{print $NF}')
pureimage=$(echo $imagename | sed 's/://g')
docker pull kubespheredev/$imagename

docker tag kubespheredev/$imagename $imagepath
docker save -o $pureimage.tar $imagepath
echo "saving to $pureimage.tar"
for h in "node1" "node2" "node3" "node4" "node5" "node6" "node7"
do
        echo "scp $pureimage.tar to $h"
        scp $pureimage.tar $h:/root
done
rm $pureimage.tar
docker rmi kubespheredev/$imagename
done

