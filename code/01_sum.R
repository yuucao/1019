library(here)
here::i_am(
  "code/01_sum.R"
)

BRCA <- readRDS(
  file = here::here("output/BRCA.rds")
)

library(summarytools)
kk <- dfSummary(BRCA, style='grid', plain.ascii = FALSE, graph.col = FALSE)

saveRDS(
  kk,
  file = here::here("output/table_one.rds")
)