pacman::p_load(lme4, lmerTest, gt, tidyverse)


M1.Full <- lmer(data = cellData, gene_expression ~ treatment*concentration*cell_lines + (1|GL))

# random effects
randomEffects <- ranova(M1.Full)

# fixed effects
# 3-way interactions
M1.A <- update(M1.Full, . ~ . -concentration:cell_lines:treatment)

df <- anova(M1.Full, M1.A)["AIC"][2,1]
df <- rbind(df, anova(M1.Full, M1.A)["AIC"][1,1])

# 2-way interactions
M2.Full <- M1.A

M2.A <- update(M2.Full, . ~ . -concentration:cell_lines)
M2.B <- update(M2.Full, . ~ . -treatment:cell_lines)
M2.C <- update(M2.Full, . ~ . -concentration:treatment)

df <- rbind(df, anova(M1.Full, M2.A)["AIC"][1,1])
df <- rbind(df, anova(M1.Full, M2.B)["AIC"][1,1])
df <- rbind(df, anova(M1.Full, M2.C)["AIC"][1,1])

# 1-way interactions
M3.Full <- update(M2.Full, . ~ . -concentration:cell_lines-treatment:cell_lines-concentration:treatment)

M3.A <- update(M3.Full, . ~ . -treatment)
M3.B <- update(M3.Full, . ~ . -concentration)
M3.C <- update(M3.Full, . ~ . -cell_lines)

df <- rbind(df, anova(M1.Full, M3.A)["AIC"][1,1])
df <- rbind(df, anova(M1.Full, M3.B)["AIC"][1,1])
df <- rbind(df, anova(M1.Full, M3.C)["AIC"][1,1])

rownames(randomEffects) <- c("Random Intercept", "No Random Intercept")

randomEffects %>% gt(rownames_to_stub = TRUE) %>%
  cols_label(
    npar = md("**Number of Parameters**"),
    logLik = md("**Log-likelihood**"),
    AIC = md("**AIC**"),
    LRT = md("**LRT**"),
    Df = md("**Degrees of Freedom**"),
    "Pr(>Chisq)" = md("**Pr(>Chisq)**")
  ) %>%
  fmt_number(decimals = 2) %>%
  gtsave(here::here("tabs", "2023-05-23_ranova-table.docx"))

rownames(df) <- c("Full model", "-concentration:cell_lines:treatment", "-concentration:cell_lines",
                  "-treatment:cell_lines", "-concentration:treatment", "-treatment",
                  "-concentration", "-cell_lines")

colnames(df) <- c("AIC")


df <- as.data.frame(df)

df %>% gt(rownames_to_stub = TRUE) %>% fmt_number(decimals = 2) %>%
  gtsave(here::here("tabs", "2023-05-23_AIC-results.docx"))
