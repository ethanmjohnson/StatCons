ReadMe
================
Ethan Johnson
6/1/23

We were given a dataset from an experiment that looks at the effect of a
new treatment on gene expression. The treatment was compared to a saline
sample (placebo). There were also two cell lines that were looked at.
The experiment was interested in finding the effect of treatment on the
effect of growth factor on gene expression.

# Data Cleaning

We began processing the raw data file provided by the collaborator. This
raw data file is found in the `raw-data` folder labelled
`2023-03-01_collaborator-data.xlsx`. We create a new Excel file to keep
all provided data within the same worksheet. This file contains a row
for each trial, describing the concentration of growth factor, the gene
expression value, the cell lines used in the trial, the treatment tested
(placebo or treatment) and the gene lines used in the trial. The Excel
file was exported and saved as a CSV file. This processed data is found
in the `data` folder labelled
`2023-03-10_processed-experimental-data.csv`.

We then load this data into `RStudio` using the `read_csv()` function
and convert the variables cell_lines, treatment, and GL into factor
variables. Through communication with the collaborator, we find that all
values of gene expression labelled -99 are actually missing values. We
therefore convert these to `NA`. The code to achieve this cleaning is
found in the `R` folder and is labelled `01-data_cleaning.R`.

# EDA

We explore the data by creating plots and tables. Firstly, the plots. We
generate scatterplots looking at concentration of the growth factor
against gene expression for each type of cell-line. We save these plots
in the `figs` folder labelled as `2023-03-22_wild-type-scatter.pdf` and
`2023-03-22_cell-type-101-scatter.pdf`. The code to generate these
scatterplots is found in the `R` folder and is labelled
`02a_EDA-scatterplots.R`.

We generate boxplots looking at a comparison of gene expression based on
the treatment used for each cell-line. We save these plots in the `figs`
folder labelled as `2023-03-22_wild-type-boxplot.pdf` and
`2023-03-22_cell-type-101-boxplot.pdf`. The code to generate these
boxplots is found in the `R` folder and is labelled
`02b_EDA-boxplots.R`.

We generate tables demonstrating the five-number summary of gene
expression for each cell-line and treatment used. We save these tables
in the `tabs` folder labelled as `2023-03-22_wild-type-summary.docx` and
`2023-03-22_cell-type-101-summary.docx`. The code to generate these
tables is found in the `R` folder and is labelled `02c_EDA-tables.R`.

At the request of the collaborator, a PowerPoint presentation
summarising the findings from this EDA was created. This presentation is
found in the `deliverables` folder and is labelled
`2023-03-24_EDA-slides.pptx`.

# Figure Generation

We were provided a figure by the collaborator who wanted the font
changed to Times New Roman and the figure converted to a .tiff with a resolution of 500. The original figure is found in the `figs`
folder and is labelled as `2023-04-03_raw-figure-font-update.pdf`. The
figure with the updated font is also in the `figs` folder and is
labelled `2023-04-06_figure-updated-font.tiff`. The code to produce this
figure is found in the `R` folder and is labelled
`03_figure-font-updating.R`.

# Sample Size Calculations

We were provided values by the collaborator to calculate sample size
required to reach a certain power and significance level. These values
are found in the `raw-data` folder labelled as
`2023-05-01_sample-size-requirements.txt`. To calculate the required
sample size, the `pwr.f2.test` function in the `pwr` package was used.
This function requires an $f^2$ value. This can be calculated using the
formula $f^2=\frac{r^2}{1-r^2}$. The code to calculate the sample size
is found in the `R` folder labelled as `04_sample-size-calcs.R`. This
gave the required sample size of 154.

# Mixed Effects Model

Through the EDA, we decide to fit a mixed effects model to the data.
This is because of the grouping present between certain gene lines. This
model was fitted to the data with gene expression as a numeric outcome,
the fixed effects were all of the interactions between treatment,
concentration and cell lines, and the random effect was the gene line
which was fitted as the intercept. The `ranova` function from the
`lmerTest` package was used to assess the significance of the random
intercept. The resulting table with details of this call is found in the
`tabs` folder and is labelled as `2023-05-23_ranova-table.docx`The
`anova` function was used to assess the significance of the fixed terms
by comparing the AIC of the full model to the AIC of models with fewer
terms. The table containing the AICs of all fitted models is found in
the `tabs` folder labelled as `2023-05-23_AIC-results.docx`The lowest
AIC, and therefore best fitting model, belonged to the full model with
an AIC of 371.29. The code to fit this model is found in the `R` folder
labelled as `05_mixed-effects-model.R`.

The r-square of this full model with random intercept was determined
using the `r.squaredGLMM` function from the `MuMIn` package. The table
containing the marginal and conditional r-square values is found in the
`tabs` folder labelled as `2023-05-25_r-square.docx`. The coefficients
of the fitted model were also extracted into the table in the folder
`tabs` labelled as `2023-05-25_model-coeffs.docx`. The code to produce
these tables is found in the `R` folder and is labelled as
`06_model-details.R`.

# IMRaD Report

The collaborator wished to have a summary of all analysis in the
structure of an IMRaD report. This report can be found in the
`deliverables` folder and is labelled as `2023-05-26_IMRaD-report.qmd`
(Quarto document) and `2023-05-26_IMRaD-report.pdf` (PDF).
