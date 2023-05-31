pacman::p_load(tidyverse, here)

# read in processed data
cellData <- read_csv(here::here("data","2023-03-10_processed-experimental-data.csv"))

# convert to factors
cellData$cell_lines <- as.factor(cellData$cell_lines)
cellData$treatment <- as.factor(cellData$treatment)
cellData$GL <- as.factor(cellData$GL)

# convert -99 to NA
cellData <- cellData %>%
  mutate(gene_expression = replace(gene_expression, which(gene_expression == -99), NA))
