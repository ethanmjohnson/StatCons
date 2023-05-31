pacman::p_load(tidyverse, ggrepel, patchwork, showtext)

font_add(
  family = "times",
  regular = here::here(
    "figs","Times New Roman.ttf"
  )
)


# colours

col_path <- c("#81A7CD", "#D2BF9D")

# plot
showtext_auto()
plot1 <- cellData %>%
  filter(cell_lines == "cell-type 101") %>%
  ggplot(aes(concentration, gene_expression, color = treatment, label = GL)) +
  geom_point(aes(fill = treatment), shape=21, colour = "black", size = 3) +
  geom_label_repel(aes(fill = treatment),
                   color = "black",
                   min.segment.length = 0,
                   data = ~ subset(., concentration==10),
                   max.overlaps = Inf,
                   nudge_x = 1,
                   show.legend = FALSE,
                   family = "times",
                   size = 20
                   ) +
  theme_bw() +
  scale_x_continuous(minor_breaks = seq(0, 12.5, 0.5), breaks = seq(0, 10, by = 1)) +
  scale_fill_manual(values = col_path, labels = c("Activating factor 42", "Placebo")) +
  labs(
    x = expression(paste("Concentration of Growth Factor (",mu, "g/ml)")),
    y = "Gene Expression"
  ) +
  ggtitle("Cell-type 101")+
  guides(fill = guide_legend(title = "Treatment")) +
  theme(text = element_text(family = "times"),
        plot.title = element_text(size = 75),
        legend.title = element_text(size=50),
        legend.text = element_text(size=50),
        axis.text = element_text(size=60),
        axis.title = element_text(size=60),
        legend.spacing.x = unit(0.25, "cm"))

plot2<-cellData %>%
  filter(cell_lines == "wild-type") %>%
  ggplot(aes(concentration, gene_expression, color = treatment, label = GL)) +
  geom_point(aes(fill = treatment), shape=21, colour = "black", size = 3) +
  geom_label_repel(aes(fill = treatment),
                   color = "black",
                   min.segment.length = 0,
                   data = ~ subset(., concentration==10),
                   max.overlaps = Inf,
                   nudge_x = 1,
                   show.legend = FALSE,
                   family = "times",
                   size = 20
  ) +
  theme_bw() +
  scale_x_continuous(minor_breaks = seq(0, 12.5, 0.5), breaks = seq(0, 10, by = 1)) +
  scale_fill_manual(values = col_path, labels = c("Activating factor 42", "Placebo")) +
  labs(
    x = expression(paste("Concentration of Growth Factor (",mu, "g/ml)")),
    y = "Gene Expression"
  ) +
  ggtitle("Wild-type") +
  guides(fill = guide_legend(title = "Treatment")) +
  theme(text = element_text(family = "times"),
        plot.title = element_text(size = 75),
        legend.title = element_text(size=50),
        legend.text = element_text(size=50),
        axis.text = element_text(size=60),
        axis.title = element_text(size=60),
        legend.spacing.x = unit(0.25, "cm"))



patchwork <- plot2 + plot1 + plot_annotation(tag_levels = 'A') +
  plot_layout(guides = "collect") &
  theme(legend.position = "bottom", plot.tag = element_text(size=75))

ggsave(here::here("figs", "2023-04-06_figure-updated-font.tiff"),
       plot = patchwork,
       width=9,
       height=6,
       dpi=500,
       units = "in")
