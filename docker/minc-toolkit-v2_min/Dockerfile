FROM nistmni/minc-base-min:ubuntu-18.04

LABEL maintainer="vladimir.fonov@gmail.com"
LABEL version="1.2"
LABEL description="minc-toolkit-v2 with python and R packages, minimal version"


# install minc-toolkit 1.9.18
RUN wget http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/minc-toolkit-1.9.18-20200813-Ubuntu_18.04-x86_64.deb && \
    dpkg -i minc-toolkit-1.9.18-20200813-Ubuntu_18.04-x86_64.deb && \
    rm -f minc-toolkit-1.9.18-20200813-Ubuntu_18.04-x86_64.deb && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# install RMINC
RUN . /opt/minc/1.9.18/minc-toolkit-config.sh && \
    wget https://github.com/vfonov/RMINC/archive/v1.5.2.3tidy.tar.gz && \
    R CMD INSTALL v1.5.2.3tidy.tar.gz --configure-args='--with-build-path=/opt/minc/1.9.18' && \
    rm -f v1.5.2.3tidy.tar.gz && \
    rm -f v1.5.2.3tidy.tar.gz

# install patched version of scoop
RUN . /opt/minc/1.9.18/minc-toolkit-config.sh && \
    wget https://github.com/vfonov/scoop/archive/master.tar.gz && \
    pip install master.tar.gz --no-cache-dir && \
    pip3 install master.tar.gz --no-cache-dir && \
    rm -rf master.tar.gz

# install pyezminc, pyminc, minc2-simple
RUN . /opt/minc/1.9.18/minc-toolkit-config.sh && \
    pip install pyminc --no-cache-dir && \
    pip3 install pyminc --no-cache-dir && \
    wget https://github.com/BIC-MNI/pyezminc/archive/release-1.2.01.tar.gz && \
    pip install release-1.2.01.tar.gz --no-cache-dir && \
    pip3 install release-1.2.01.tar.gz --no-cache-dir && \
    wget https://github.com/NIST-MNI/minc2-simple/archive/v2.2.30.tar.gz && \
    tar zxf v2.2.30.tar.gz && \
    python minc2-simple-2.2.30/python/setup.py install && \
    python3 minc2-simple-2.2.30/python/setup.py install && \
    rm -rf v2.2.30.tar.gz release-1.2.01.tar.gz minc2-simple-0 

# add user to execute commands
RUN useradd -ms /bin/bash nistmni 

# source minc environment automatically
RUN echo ". /opt/minc/1.9.18/minc-toolkit-config.sh" >> /home/nistmni/.bashrc
    
USER nistmni
ENV HOME /home/nistmni
WORKDIR /home/nistmni
