FROM ubuntu:xenial

# install basic system packages
# and install new version of R
RUN echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" > /etc/apt/sources.list.d/cran.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && \
    apt-get -y update && \
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
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# install minc-toolkit 1.0.09
RUN wget http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/minc-toolkit-1.0.09-20170529-Ubuntu_16.04-x86_64.deb  && \
    dpkg -i minc-toolkit-1.0.09-20170529-Ubuntu_16.04-x86_64.deb && \
    rm -f minc-toolkit-1.0.09-20170529-Ubuntu_16.04-x86_64.deb && \
    wget http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/beast-library-1.1.0-20121212.deb && \
    dpkg -i beast-library-1.1.0-20121212.deb && \
    rm -f beast-library-1.1.0-20121212.deb && \
    wget http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/bic-mni-models-0.1.1-20120421.deb && \
    dpkg -i bic-mni-models-0.1.1-20120421.deb && \
    rm -f bic-mni-models-0.1.1-20120421.deb

# additional packages....
RUN apt-get -y update && \
    apt-get install -y ed libxml2-dev libcurl4-openssl-dev libssl-dev && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*
    
    
# Update R packages    
RUN Rscript -e 'update.packages(repos="https://cloud.r-project.org",ask=F)'

# Install additional R packages
RUN Rscript -e 'install.packages(c("lme4","tidyverse","batchtools","Rcpp","rjson","jsonlite","tidyr","shiny","visNetwork","DT"),repos="https://cloud.r-project.org")'

RUN Rscript -e 'install.packages(c("gridBase","data.tree"),repos="https://cloud.r-project.org")'

# install RMINC
RUN . /opt/minc/1.0.09/minc-toolkit-config.sh && \
    wget https://github.com/Mouse-Imaging-Centre/RMINC/releases/download/v1.5.1.0/RMINC_1.5.1.0.tar.gz && \
    R CMD INSTALL RMINC_1.5.1.0.tar.gz --configure-args='--with-build-path=/opt/minc/1.0.09' 
    

# python stuff
RUN apt-get -y update && \
    apt-get install -y python-pip python-dev libzmq-dev cython python-cffi python-numpy python-scipy && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*
    

# install pyezminc, pyminc, minc2-simple
RUN . /opt/minc/1.0.09/minc-toolkit-config.sh && \
    export MINC_TOOLKIT=/opt/minc/1.0.09 && \
    pip install pyminc --no-cache-dir && \
    wget https://github.com/BIC-MNI/pyezminc/archive/release-1.2.01.tar.gz && \
    pip install release-1.2.01.tar.gz --no-cache-dir && \
    wget https://github.com/vfonov/minc2-simple/archive/v0.tar.gz && \
    tar zxf v0.tar.gz && \
    python minc2-simple-0/python/setup.py install && \
    rm -rf v0.tar.gz release-1.2.01.tar.gz minc2-simple-0 
    
# scoop
RUN pip install scoop --no-cache-dir 
    
    
# add user to execute commands
RUN useradd -ms /bin/bash nistmni 
    
# source minc environment automatically
# RUN ln -sf /opt/minc/1.0.09/minc-toolkit-config.sh /etc/profile.d/

RUN echo ". /opt/minc/1.0.09/minc-toolkit-config.sh" >> /home/nistmni/.bashrc
    
USER nistmni
ENV HOME /home/nistmni
WORKDIR /home/nistmni
