#! /bin/sh

# build minimal base container
docker build -t nistmni/minc-base-min:ubuntu-16.04 minc-base_ubuntu-16.04_x64_minimal

# build minimal V2
docker build -t nistmni/minc-toolkit-min:1.9.16 minc-toolkit-v2_ubuntu-16.04_x64_minimal


# TODO: push to the docker hub

