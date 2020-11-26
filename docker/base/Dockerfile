# based on ubuntu 18.04
FROM ubuntu:18.04

LABEL maintainer="vladimir.fonov@gmail.com"
LABEL version="1.2"
LABEL description="Minimal base image for minc-toolkit, contains R 4.0.3 + various packages and python with various packages "

## preesed tzdata, update package index, upgrade packages and install needed software
RUN truncate -s0 /tmp/preseed.cfg; \
    echo "tzdata tzdata/Areas select America" >> /tmp/preseed.cfg; \
    echo "tzdata tzdata/Zones/America select New_York" >> /tmp/preseed.cfg; \
    export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    debconf-set-selections /tmp/preseed.cfg && \
    rm -f /etc/timezone /etc/localtime && \
    apt-get update && \
    apt-get install -y tzdata

# install basic system packages
RUN apt-get -y update && \
    apt-get -y dist-upgrade && \
    export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    apt-get install -y --no-install-recommends \
         bc \
         gnupg2 \
         wget \
         libjpeg8 \
         imagemagick \
         perl \
         apt-utils && \
    apt-get install -y ed libxml2-dev libcurl4-openssl-dev libssl-dev && \
    apt-get install -y python-pip python-dev libzmq5-dev cython python-cffi python-numpy python-scipy python-matplotlib && \
    apt-get install -y python3-pip python3-dev cython3 python3-cffi python3-numpy python3-scipy python3-matplotlib && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 51716619E084DAB9 


# install basic system packages
RUN echo "deb http://cran.rstudio.com/bin/linux/ubuntu bionic-cran40/" > /etc/apt/sources.list.d/cran.list && \
    apt-get -y update && \
    apt-get -y dist-upgrade && \
    apt-get install -y --no-install-recommends \
         r-base \
         r-base-dev && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# install python modules not available through ubuntu
RUN pip install pillow

# Update R packages and install missing
RUN Rscript -e 'update.packages(repos="https://cloud.r-project.org",ask=F)' && \
    Rscript -e 'install.packages(c("lme4","tidyverse","batchtools","Rcpp","rjson","jsonlite","tidyr","shiny","visNetwork","DT"),repos="https://cloud.r-project.org")' && \
    Rscript -e 'install.packages(c("gridBase","data.tree"),repos="https://cloud.r-project.org")' && \
    Rscript -e 'install.packages(c("glmnet","doMC"),repos="https://cloud.r-project.org")'

# Update R packages and install missing
RUN Rscript -e 'update.packages(repos="https://cloud.r-project.org",ask=F)' && \
    Rscript -e 'install.packages(c("bigstatsr"),repos="https://cloud.r-project.org")'
