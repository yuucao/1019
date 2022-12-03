#! add a rule to build the report
report.html: report.Rmd code/04_render_report.R output/table_one.rds output/plot1.png output/plot2.png   output/plot3.png   output/plot4.png
	Rscript code/04_render_report.R 
	
check_lib: 
	Rscript -e ".libPaths()"

#! add a rule to create the output of 
#! code/01_sum.R
output/table_one.rds: code/01_sum.R 
	Rscript code/01_sum.R 
#! code/02_make_plots
output/plot1.png: code/02_make_plots.R 
	Rscript code/02_make_plots.R 

output/plot2.png: code/02_make_plots.R 
	Rscript code/02_make_plots.R 
	
output/plot3.png: code/02_make_plots.R 
	Rscript code/02_make_plots.R 

output/plot4.png: code/02_make_plots.R 
	Rscript code/02_make_plots.R 

.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"
#! add a PHONY target for removing .rds files
#! from the output directory
.PHONY: clean
clean: 
	rm output/*.rds

#Docker rules
#PROJECTFILES = report.Rmd code/01_sum.R code/02_make_plots.R code/04_render_report.R Makefile
#RENVFILES = renv.lock renv/activate.R renv/settings.dcf

#rule to bulid an image
#image: Dockerfile $(PROJECTFILES) $(RENVFILES)
#	docker build -t image .
#	touch $@

#rule to run container
report/report.html:
	docker run -v "/$$(pwd)/report":/project/report ycao987/imagee
#	docker run -v "/$$(pwd)/report":/project/report image
	