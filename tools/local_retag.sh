#!/bin/bash
#

REPO_NAME="nightkid"
GCR_URL="k8s.gcr.io"

IMAGES={
kube-controller-manager:v1.12.2
kube-scheduler:v1.12.2
kube-proxy:v1.12.2
pause:3.1
etcd:3.2.24
coredns:1.2.2
}

for img in $IMAGES;do
    docker pull $REPO_NAME/$img && \
    docker tag $GCR_URL/$img && \
    docker rmi $REPO_NAME/$img
done

# flannel
# docker pull $REPO_NAME/flannel:v0.9.1-amd64 && \
# docker tag $REPO_NAME/flannel:v0.9.1-amd64 quay.io/coreos/flannel:v0.9.1-amd64 && \
# docker rmi $REPO_NAME/flannel:v0.9.1-amd64

# canel
