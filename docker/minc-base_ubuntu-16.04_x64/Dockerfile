# based on ubuntu 16.04
FROM ubuntu:xenial

LABEL maintainer="vladimir.fonov@gmail.com"
LABEL version="1.1"
LABEL description="Base image for minc-toolkit, contains R 3.4.3 + various packages and python 2.7 and 3.5 with various packages"


# install basic system packages
RUN echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" > /etc/apt/sources.list.d/cran.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && \
    apt-get -y update && \
    apt-get -y dist-upgrade && \
    apt-get install -y \
         bc \
         libxi6  \
         libxmu6  \
         wget \
         libjpeg8 \
         imagemagick \
         perl \
         libgl1-mesa-glx \
         libglu1-mesa \
         r-base r-base-dev && \
    apt-get install -y ed libxml2-dev libcurl4-openssl-dev libssl-dev && \
    apt-get install -y python-pip python-dev libzmq-dev cython python-cffi python-numpy python-scipy python-matplotlib && \
    apt-get install -y python3-pip python3-dev cython3 python3-cffi python3-numpy python3-scipy python3-matplotlib && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

## install python modules not available through ubuntu
RUN pip install pillow
    
# Update R packages and install missing
RUN Rscript -e 'update.packages(repos="https://cloud.r-project.org",ask=F)' && \
    Rscript -e 'install.packages(c("lme4","tidyverse","batchtools","Rcpp","rjson","jsonlite","tidyr","shiny","visNetwork","DT"),repos="https://cloud.r-project.org")' && \
    Rscript -e 'install.packages(c("gridBase","data.tree"),repos="https://cloud.r-project.org")' && \
    Rscript -e 'install.packages(c("glmnet","doMC"),repos="https://cloud.r-project.org")'
