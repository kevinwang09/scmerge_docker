FROM bioconductor/bioconductor_docker:latest

MAINTAINER kevin.wang@sydney.edu.au

ADD install.R /tmp/

RUN R -f /tmp/install.R