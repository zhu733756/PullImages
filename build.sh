#!/bin/bash
# 先添加镜像文件，然后给定文件名称
filepath="rook-ceph"

# 格式转换
dos2unix $filepath

# 遍历推送
for imagepath in $(cat ./$filepath)
do
imagename=$(echo $imagepath | awk -F '/' '{print $NF}')
docker pull $imagepath

# push到dockerhub
docker tag $imagepath zhu733756/$imagename
docker push zhu733756/$imagename
done