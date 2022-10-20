library(here)
here::i_am("code/00_data.R")
absolute_path_to_data <- here::here("data", "BRCA.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)


saveRDS(
  data, 
  file = here::here("output/BRCA.rds")
)