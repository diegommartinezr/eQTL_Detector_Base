FROM rocker/rstudio

#Install R Packages
RUN R -e "install.packages('glue')"
RUN R -e "install.packages('knitr')"
RUN R -e "install.packages('rmarkdown')"
RUN R -e "install.packages('kableExtra')"
RUN R -e "install.packages('devtools')"
RUN R -e "install.packages('XML')"
RUN R -e "install.packages('rlist')"
RUN R -e "install.packages('readr')"

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
