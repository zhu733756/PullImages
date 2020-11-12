###
 # @Author: your name
 # @Date: 2020-11-12 12:36:00
 # @LastEditTime: 2020-11-12 13:23:42
 # @LastEditors: your name
 # @Description: In User Settings Edit
 # @FilePath: \PullImages\push-image.sh
### 
#!/bin/bash

for imagepath in $(cat ./imagepath.txt)
do
imagename=$(echo $imagepath | awk -F '/' '{print $NF}')
docker pull $imagepath

# push到阿里云仓库
docker tag $imagepath registry.cn-hangzhou.aliyuncs.com/aliwill/$imagename
docker push registry.cn-hangzhou.aliyuncs.com/aliwill/$imagename

# push到dockerhub
docker tag $imagepath willdockerhub/$imagename
docker push willdockerhub/$imagename
done
