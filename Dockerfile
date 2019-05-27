# DO NOT EDIT FILES CALLED 'Dockerfile'; they are automatically
# generated. Edit 'Dockerfile.in' and generate the 'Dockerfile'
# with the 'rake' command.

# The suggested name for this image is: bioconductor/release_base.

FROM bioconductor/release_core2

# FIXME? in release, default CRAN mirror is set to rstudio....should it be fhcrc?

MAINTAINER kevin.wang@sydney.edu.au

ADD install.R /tmp/

# invalidates cache every 24 hours
ADD http://master.bioconductor.org/todays-date /tmp/

RUN R -f /tmp/install.R