pacman::p_load(MuMIn, gt, tidyverse)

as.data.frame(r.squaredGLMM(M1.Full)) %>% gt() %>%
  cols_label(R2m = "Marginal rsq", R2c = "Conditional rsq") %>%
  fmt_number(decimals = 2) %>% gtsave(here::here("tabs", "2023-05-25_r-square.docx"))

coeffs <- summary(M1.Full)$coefficients[,1]
coeffs <- as.data.frame(coeffs)

coeffs %>% gt(rownames_to_stub = TRUE) %>% fmt_number(decimals = 2) %>%
  gtsave(here::here("tabs", "2023-05-25_model-coeffs.docx"))
