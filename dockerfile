FROM rocker/r-ubuntu

RUN apt-get update && apt-get install -y pandoc
RUN apt-get update && apt-get install -y cmake
RUN apt-get update && apt-get install -y libcurl4-openssl-dev
RUN apt-get update && apt-get install -y libmagick++-dev

#RUN Rscript -e "install.packages('renv')"
RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('readr')"
RUN Rscript -e "install.packages('summarytools')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('ggpubr')"
#RUN Rscript -e "install.packages('tidyr')"
#RUN Rscript -e "install.packages('tidyverse')"
#RUN Rscript -e "install.packages('rstatix')"
RUN Rscript -e "install.packages('knitr')"


RUN apt-get update && apt-get install -y pandoc && apt-get install -y vim

RUN mkdir /project 
workdir /project  

run mkdir code
run mkdir data
run mkdir output
copy code code
copy data data
copy Makefile .
copy report.Rmd .
copy output/BRCA.rds output

#copy .Rprofile .
#copy renv.lock .
#run mkdir renv

#copy renv/activate.R renv
#copy renv/settings.dcf renv

#RUN Rscript -e "renv::restore(prompt = FALSE)"

Run mkdir report 



CMD make && mv report.html report
