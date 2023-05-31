pacman::p_load(tidyverse, gt)

table1 <- cellData %>%
  filter(cell_lines == "wild-type") %>%
  filter(treatment == "activating factor 42") %>%
  filter(!is.na(gene_expression)) %>%
  summarise(
    Treatment = "Activating Factor 42",
    Min = min(gene_expression),
    Q1 = quantile(gene_expression, 0.25),
    Median = median(gene_expression),
    Q3 = quantile(gene_expression, 0.75),
    Max = max(gene_expression)) %>%
  gt() %>%
  fmt_number(decimals = 2)


table2 <- cellData %>%
  filter(cell_lines == "wild-type") %>%
  filter(treatment == "placebo") %>%
  filter(!is.na(gene_expression)) %>%
  summarise(
    Treatment = "Placebo",
    Min = min(gene_expression),
    Q1 = quantile(gene_expression, 0.25),
    Median = median(gene_expression),
    Q3 = quantile(gene_expression, 0.75),
    Max = max(gene_expression)) %>%
  gt() %>%
  fmt_number(decimals = 2)

table3 <- cellData %>%
  filter(cell_lines == "cell-type 101") %>%
  filter(treatment == "activating factor 42") %>%
  filter(!is.na(gene_expression)) %>%
  summarise(
    Treatment = "Activating Factor 42",
    Min = min(gene_expression),
    Q1 = quantile(gene_expression, 0.25),
    Median = median(gene_expression),
    Q3 = quantile(gene_expression, 0.75),
    Max = max(gene_expression)) %>%
  gt() %>%
  fmt_number(decimals = 2)

table4 <- cellData %>%
  filter(cell_lines == "cell-type 101") %>%
  filter(treatment == "placebo") %>%
  filter(!is.na(gene_expression)) %>%
  summarise(
    Treatment = "Placebo",
    Min = min(gene_expression),
    Q1 = quantile(gene_expression, 0.25),
    Median = median(gene_expression),
    Q3 = quantile(gene_expression, 0.75),
    Max = max(gene_expression)) %>%
  gt() %>%
  fmt_number(decimals = 2)


table1 <- table1$`_data`
table2 <- table2$`_data`
table3 <- table3$`_data`
table4 <- table4$`_data`

rbind(table1, table2) %>% gt() %>% fmt_number(decimals = 2) %>%
  gtsave(here::here("tabs", "2023-03-22_wild-type-summary.docx"))

rbind(table3, table4) %>% gt() %>% fmt_number(decimals = 2) %>%
  gtsave(here::here("tabs", "2023-03-22_cell-type-101-summary.docx"))

