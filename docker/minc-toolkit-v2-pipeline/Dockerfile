FROM nistmni/minc-toolkit-min:1.9.16

LABEL maintainer="vladimir.fonov@gmail.com"
LABEL version="0.3"
LABEL description="minc-toolkit-v2 with python and R packages, for pipeline processing"

USER root
RUN apt-get -y update && \
    apt-get install -y lsof && \
    apt-get install -y fonts-ubuntu-font-family-console gsfonts && \
    fc-cache -f -v && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /
RUN  chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

