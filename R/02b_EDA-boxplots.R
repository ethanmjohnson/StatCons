pacman::p_load(tidyverse, harrypotter, here)

cellData %>%
  filter(cell_lines == "wild-type") %>%
  ggplot(aes(treatment, gene_expression, fill = treatment)) +
  geom_boxplot()+
  theme(plot.title = element_text(hjust = 0.5)) +
  harrypotter::scale_fill_hp_d("Ravenclaw") +
  labs(
    x = "Treatment",
    y = "Gene Expression",
    title = "Comparison of Gene Expression based on different treatment used on Wild-type Cell Lines",
    fill = "Treatment"
  ) +
  theme(plot.title = element_text(hjust = 0.5))
  ggsave(here::here("figs", "2023-03-22_wild-type-boxplot.pdf"))

cellData %>%
  filter(cell_lines == "cell-type 101") %>%
  ggplot(aes(treatment, gene_expression, fill = treatment)) +
  geom_boxplot()+
  theme(plot.title = element_text(hjust = 0.5)) +
  harrypotter::scale_fill_hp_d("Ravenclaw") +
  labs(
    x = "Treatment",
    y = "Gene Expression",
    title = "Comparison of Gene Expression based on different treatment used on Cell-type 101 Cell Lines",
    fill = "Treatment"
  ) +
  theme(plot.title = element_text(hjust = 0.5))
  ggsave(here::here("figs", "2023-03-22_cell-type-101-boxplot.pdf"))
