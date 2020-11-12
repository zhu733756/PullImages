#!/bin/bash


# 先添加镜像文件，然后给定文件名称
filepath='rook-ceph'

# 格式转换

# 遍历推送
for imagepath in $(cat ./$filepath)
do
imagename=$(echo $imagepath | awk -F '/' '{print $NF}')
docker pull zhu733756/$imagename

# push到dockerhub
docker tag zhu733756/$imagename $imagepath
docker rmi zhu733756/$imagename
done
