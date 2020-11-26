FROM nistmni/minc-toolkit-min:1.9.18

LABEL maintainer="vladimir.fonov@gmail.com"
LABEL version="1.2"
LABEL description="minc-toolkit-v2 with python and R packages and standard templates"


# install templates
RUN wget http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/beast-library-1.1.0-20121212.deb && \
    dpkg -i beast-library-1.1.0-20121212.deb && \
    rm -f beast-library-1.1.0-20121212.deb && \
    wget http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/bic-mni-models-0.1.1-20120421.deb && \
    dpkg -i bic-mni-models-0.1.1-20120421.deb && \
    rm -f bic-mni-models-0.1.1-20120421.deb && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*


USER nistmni
ENV HOME /home/nistmni
WORKDIR /home/nistmni
