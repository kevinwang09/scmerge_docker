FROM bioconductor/bioconductor_docker:devel

MAINTAINER kevin.wang@sydney.edu.au

ADD install.R /tmp/

RUN R -f /tmp/install.R