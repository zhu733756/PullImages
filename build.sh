#!/bin/bash
# 先添加镜像文件，然后给定文件名称
filepath="projects/kubeflow-v1.2"

# 格式转换
# sed -i 's/^M//' $filename 

# 遍历推送
for imagepath in $(cat ./$filepath)
do
myimagepath=$(echo $imagepath | awk -F '/' '{print $NF}')
docker pull $imagepath

# push到dockerhub
docker tag $imagepath $myimagepath
echo "tag to $myimagepath"
docker push "$myimagepath"
echo "start to push $myimagepath"
done
