data <- read_csv(here::here("data","processed_cell_data.csv"))

data$cell_lines <- as.factor(data$cell_lines)
data$treatment <- as.factor(data$treatment)


data$gene_expression[39]=NA



# plots

data %>%
  filter(cell_lines == "wild-type") %>%
  ggplot(aes(concentration, gene_expression, color = treatment)) +
  geom_point() + geom_smooth(method=lm)+
  labs(
    x = "Concentration (mg/mL)",
    y = "Gene Expression",
    title = "Gene Expression vs Concentration for the Wild-type Cell Lines",
    color = "Treatment"
    ) +
  theme(plot.title = element_text(hjust = 0.5))

data %>%
  filter(cell_lines == "cell-type 101") %>%
  ggplot(aes(concentration, gene_expression, color = treatment)) +
  geom_point() + geom_smooth(method = lm) +
  labs(
    x = "Concentration (mg/mL)",
    y = "Gene Expression",
    title = "Gene Expression vs Concentration for the Cell-type 101 Cell Lines",
    color = "Treatment"
  ) +
  theme(plot.title = element_text(hjust = 0.5))
