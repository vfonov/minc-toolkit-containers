#! /bin/sh

# build base container
docker build -t nistmni/minc-base-min:ubuntu-18.04 base

# build minimal V2
docker build -t nistmni/minc-toolkit-min:1.9.18 minc-toolkit-v2_min

# build full V2
docker build -t nistmni/minc-toolkit:1.9.18 minc-toolkit-v2_full

# build V1
docker build -t nistmni/minc-toolkit:1.0.09 minc-toolkit-v1_min

