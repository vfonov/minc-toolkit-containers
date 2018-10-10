FROM nistmni/minc-base:ubuntu-16.04

LABEL maintainer="nikhil153@gmail.com"
LABEL version="1.1"
LABEL description="minc-toolkit-v2 with 1) preproc pipeline 2) python and R packages. Inherited from \
https://github.com/vfonov/minc-toolkit-containers/blob/master/docker/minc-toolkit-v2_ubuntu-16.04_x64/Dockerfile"

# intall python3 and setup tools
RUN apt-get update && apt-get install -y python3
RUN apt-get install -y python-setuptools
RUN apt-get install -y python3-setuptools

# install minc-toolkit 1.9.16
RUN wget http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/minc-toolkit-1.9.16-20180117-Ubuntu_16.04-x86_64.deb  && \
    dpkg -i minc-toolkit-1.9.16-20180117-Ubuntu_16.04-x86_64.deb && \
    rm -f minc-toolkit-1.9.16-20180117-Ubuntu_16.04-x86_64.deb && \
    wget http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/beast-library-1.1.0-20121212.deb && \
    dpkg -i beast-library-1.1.0-20121212.deb && \
    rm -f beast-library-1.1.0-20121212.deb && \
    wget http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/bic-mni-models-0.1.1-20120421.deb && \
    dpkg -i bic-mni-models-0.1.1-20120421.deb && \
    rm -f bic-mni-models-0.1.1-20120421.deb && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# install RMINC
RUN . /opt/minc/1.9.16/minc-toolkit-config.sh && \
    wget https://github.com/Mouse-Imaging-Centre/RMINC/releases/download/v1.5.1.0/RMINC_1.5.1.0.tar.gz && \
    R CMD INSTALL RMINC_1.5.1.0.tar.gz --configure-args='--with-build-path=/opt/minc/1.9.16' && \
    rm -f RMINC_1.5.1.0.tar.gz && \
    rm -f RMINC_1.5.1.0.tar.gz

# install patched version of scoop
RUN . /opt/minc/1.9.16/minc-toolkit-config.sh && \
    wget https://github.com/vfonov/scoop/archive/master.tar.gz && \
    tar zxf master.tar.gz && \
    cd scoop-master && \
    python setup.py install && \
    #python3 setup.py install && \
    cd .. && \
    rm -rf master.tar.gz scoop-master

# install pyezminc, pyminc, minc2-simple
RUN . /opt/minc/1.9.16/minc-toolkit-config.sh && \
    pip install pyminc --no-cache-dir && \
    #pip3 install pyminc --no-cache-dir && \
    wget https://github.com/BIC-MNI/pyezminc/archive/release-1.2.01.tar.gz && \
    pip install release-1.2.01.tar.gz --no-cache-dir && \
    #pip3 install release-1.2.01.tar.gz --no-cache-dir && \
    wget https://github.com/vfonov/minc2-simple/archive/v0.tar.gz && \
    tar zxf v0.tar.gz && \
    python minc2-simple-0/python/setup.py install && \
    #python3 minc2-simple-0/python/setup.py install && \
    rm -rf v0.tar.gz release-1.2.01.tar.gz minc2-simple-0 

# install scikit-learn
RUN pip install -U scikit-learn

# add user to execute commands
RUN useradd -ms /bin/bash nistmni 

# source minc environment automatically
RUN echo ". /opt/minc/1.9.16/minc-toolkit-config.sh" >> /home/nistmni/.bashrc
 
USER nistmni
ENV HOME /home/nistmni
WORKDIR /home/nistmni
   
# install preproc pipeline
COPY . /home/nistmni

# define default run script 
CMD ["./run_preproc.sh"]
