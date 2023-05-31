pacman::p_load(tidyverse, harrypotter, here)

cellData %>%
  filter(cell_lines == "wild-type") %>%
  ggplot(aes(concentration, gene_expression, color = treatment)) +
  geom_point() + geom_smooth(method=lm)+
  labs(
    x = "Concentration of Growth Factor (mg/mL)",
    y = "Gene Expression",
    title = "Gene Expression vs Concentration of Growth Factor for the Wild-type Cell Lines",
    color = "Treatment"
  ) +
  theme(plot.title = element_text(hjust = 0.5)) +
  harrypotter::scale_colour_hp_d("Ravenclaw")
  ggsave(here::here("figs", "2023-03-22_wild-type-scatter.pdf"))

cellData %>%
  filter(cell_lines == "cell-type 101") %>%
  ggplot(aes(concentration, gene_expression, color = treatment)) +
  geom_point() + geom_smooth(method = lm) +
  labs(
    x = "Concentration of Growth Factor (mg/mL)",
    y = "Gene Expression",
    title = "Gene Expression vs Concentration of Growth factor for the Cell-type 101 Cell Lines",
    color = "Treatment"
  ) +
  theme(plot.title = element_text(hjust = 0.5)) +
  harrypotter::scale_colour_hp_d("Ravenclaw")
  ggsave(here::here("figs", "2023-03-22_cell-type-101-scatter.pdf"))

