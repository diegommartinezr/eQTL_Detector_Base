FROM rocker/rstudio

#Install packages from sqtlseeker2

RUN apt-get update --fix-missing -qq && apt-get install -y -q \
    libssl-dev \
    libcurl4-openssl-dev \
    libnlopt-dev \
    r-base \
    procps \
    && apt-get clean \
    && apt-get purge \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN R -e 'install.packages(c("devtools", "optparse"), repos="http://cloud.r-project.org/"); \
          source("https://bioconductor.org/biocLite.R"); \
          devtools::install_github("dgarrimar/sQTLseekeR2")'


#Install QTLtools

RUN apt-get update && apt-get install -y qtltools
RUN apt-get update && apt-get install -y wget

RUN cd /opt && \
    wget --no-check-certificate https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2 && \
    tar -xf htslib-1.9.tar.bz2 && rm htslib-1.9.tar.bz2 && cd htslib-1.9 && make && make install && make clean


RUN cd /opt && \
    wget --no-check-certificate https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 && \
    tar -xf samtools-1.9.tar.bz2 && rm samtools-1.9.tar.bz2 && cd samtools-1.9 && \
    ./configure --with-htslib=/opt/htslib-1.9 && make && make install && make clean

RUN apt-get update && apt-get install -y tabix
RUN apt-get update && apt-get install -y bcftools

#RUN apt-get update && apt-get install -y texlive-full 

