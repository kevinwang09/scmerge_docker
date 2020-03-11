# DO NOT EDIT FILES CALLED 'Dockerfile'; they are automatically
# generated. Edit 'Dockerfile.in' and generate the 'Dockerfile'
# with the 'rake' command.

# The suggested name for this image is: bioconductor/release_base.

FROM bioconductor/bioconductor_docker@sha256:79ede9666fc3c42235218b6e64b2a9fb5d5514e9368bc5402ba7896d55d47ab3

# FIXME? in release, default CRAN mirror is set to rstudio....should it be fhcrc?

MAINTAINER kevin.wang@sydney.edu.au

ADD install.R /tmp/

RUN R -f /tmp/install.R