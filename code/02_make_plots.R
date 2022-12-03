here::i_am(
  "code/02_make_plots.R"
)

BRCA <- readRDS(
  file = here::here("output/BRCA.rds")
)

#create new column
BRCA$agecat <- ifelse(BRCA$Age < 58.9, "< 58.9", ">= 58.9")
library(ggplot2)
library(ggpubr)

#Sort boxplot order
BRCA$Tumour_Stage <- factor(BRCA$Tumour_Stage, levels = c("I" ,"II", "III"))

#Protein1
plot1 <- ggboxplot(
  BRCA, x = "Tumour_Stage", y = "Protein1",
  color = "agecat", palette = "jco",
  title = "Plot 1  Box Plot of Protein1 Versus Tumour Stages by Age category",
  subtitle = "t-test",
  xlab ="Tumour Stage"
)


ggsave(
  here::here("output/plot1.png"),
  plot = plot1,
  device = "png"
)

#####################################################################################################
#2
plot2 <- ggboxplot(
  BRCA, x = "Tumour_Stage", y = "Protein2",
  color = "agecat", palette = "jco",
  title = "Plot 2  Box Plot of Protein2 Versus Tumour Stages by Age category",
  subtitle = "t-test",
  xlab ="Tumour Stage"
)

ggsave(
  here::here("output/plot2.png"),
  plot = plot2,
  device = "png"
)
#####################################################################################################
#3
#Protein3
plot3 <- ggboxplot(
  BRCA, x = "Tumour_Stage", y = "Protein3",
  color = "agecat", palette = "jco",
  title = "Plot 3  Box Plot of Protein3 Versus Tumour Stages by Age category",
  subtitle = "t-test",
  xlab ="Tumour Stage"
)


ggsave(
  here::here("output/plot3.png"),
  plot = plot3,
  device = "png"
)
#####################################################################################################
#4
#Protein4
plot4 <- ggboxplot(
  BRCA, x = "Tumour_Stage", y = "Protein4",
  color = "agecat", palette = "jco",
  title = "Plot 4  Box Plot of Protein4 Versus Tumour Stages by Age category",
  subtitle = "t-test",
  xlab ="Tumour Stage"
)

ggsave(
  here::here("output/plot4.png"),
  plot = plot4,
  device = "png"
)