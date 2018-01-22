#! /bin/sh


# build V2
docker build -t nistmni/minc-toolkit:1.9.16 minc-toolkit-v2_ubuntu-16.04_x64

# build V1
docker build -t nistmni/minc-toolkit:1.0.09 minc-toolkit-v1_ubuntu-16.04_x64


# TODO: push to the docker hub

