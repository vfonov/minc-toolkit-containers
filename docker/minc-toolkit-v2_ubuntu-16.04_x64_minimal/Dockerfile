FROM nistmni/minc-base-min:ubuntu-16.04

# install minc-toolkit 1.9.16
RUN wget http://packages.bic.mni.mcgill.ca/minc-toolkit/min/minc-toolkit-1.9.16-20180117-Ubuntu_16.04-x86_64.deb && \
    dpkg -i minc-toolkit-1.9.16-20180117-Ubuntu_16.04-x86_64.deb && \
    rm -f minc-toolkit-1.9.16-20180117-Ubuntu_16.04-x86_64.deb && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# install RMINC
RUN . /opt/minc/1.9.16/minc-toolkit-config.sh && \
    wget https://github.com/Mouse-Imaging-Centre/RMINC/releases/download/v1.5.1.0/RMINC_1.5.1.0.tar.gz && \
    R CMD INSTALL RMINC_1.5.1.0.tar.gz --configure-args='--with-build-path=/opt/minc/1.9.16' && \
    rm -f RMINC_1.5.1.0.tar.gz && \
    rm -f RMINC_1.5.1.0.tar.gz

# install pyezminc, pyminc, minc2-simple
RUN . /opt/minc/1.9.16/minc-toolkit-config.sh && \
    pip install pyminc --no-cache-dir && \
    wget https://github.com/BIC-MNI/pyezminc/archive/release-1.2.01.tar.gz && \
    pip install release-1.2.01.tar.gz --no-cache-dir && \
    wget https://github.com/vfonov/minc2-simple/archive/v0.tar.gz && \
    tar zxf v0.tar.gz && \
    python minc2-simple-0/python/setup.py install && \
    rm -rf v0.tar.gz release-1.2.01.tar.gz minc2-simple-0 

# add user to execute commands
RUN useradd -ms /bin/bash nistmni 

# source minc environment automatically
RUN echo ". /opt/minc/1.9.16/minc-toolkit-config.sh" >> /home/nistmni/.bashrc
    
USER nistmni
ENV HOME /home/nistmni
WORKDIR /home/nistmni
