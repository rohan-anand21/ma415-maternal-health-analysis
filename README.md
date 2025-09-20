# Analysis of Maternal Health & Infant Outcomes in the U.S.

This repository contains the source code for an interactive website built with R and Quarto for the MA415/MA4615 Data Science course. The project analyzes the impact of maternal lifestyle choices, particularly smoking, on infant health outcomes using U.S. natality data.

**Live Website:** [**https://ma-415-n8hl1cp2x-rohan-anands-projects.vercel.app**](https://ma-415-n8hl1cp2x-rohan-anands-projects.vercel.app)
**Project Presentation Video:** [**https://youtu.be/idH7NyRJwKc**](https://youtu.be/idH7NyRJwKc)

---

## Project Overview

[cite_start]Maternal smoking is a significant and preventable risk factor for poor pregnancy outcomes, contributing to both individual health consequences and large-scale economic costs[cite: 2, 3, 4]. [cite_start]This project explores the current landscape of maternal smoking in the United States and its correlation with key infant health metrics, specifically birth weight and APGAR scores[cite: 8].

[cite_start]Beyond smoking, the analysis also investigates other significant factors like maternal BMI to provide a broader picture of the maternal health crisis in America[cite: 9, 165]. [cite_start]The goal is to highlight these health risk factors to inform better prenatal health practices and potential public policy[cite: 175].

### Key Research Questions Addressed

* [cite_start]What racial group has the highest proportion of mothers who smoke before and during pregnancy? [cite: 18]
* [cite_start]Does smoking negatively impact the birth weight and APGAR scores of babies, regardless of race? [cite: 31]
* [cite_start]Is there a statistically significant difference in birth weights between babies of smoking and non-smoking mothers? [cite: 52]
* [cite_start]What has been the trend in maternal smoking over the past decade? [cite: 75]
* [cite_start]Is there an association between the prevalence of smoking in a state and the average gestation period? [cite: 92]
* [cite_start]Can a linear model accurately predict birth weight and APGAR scores based on maternal lifestyle factors? [cite: 111, 139]

---

## Key Findings

1.  [cite_start]**Racial Disparities in Smoking:** American Indian and Alaskan Native (AIAN) mothers have the highest proportion of smoking before and during all trimesters of pregnancy[cite: 11].
2.  [cite_start]**Negative Health Correlation:** There is a consistent inverse relationship between smoking and mean birth weight/APGAR scores across all racial groups[cite: 12].
3.  [cite_start]**Decline in Smoking Rates:** There has been a considerable decline in the proportion of mothers who smoke during pregnancy for most racial groups between 2014 and 2021[cite: 80].
4.  [cite_start]**BMI as a Major Predictor:** Maternal BMI was found to be a more significant feature than cigarette use in predicting an infant's APGAR score[cite: 17].

## Technology Stack

* **Language:** R
* **Website Framework:** Quarto
* **Core Libraries:** `tidyverse`, `ggplot2`, `dplyr`, `gt`
* **Deployment:** Vercel / GitHub Pages

## Data Source

[cite_start]The analysis uses the **Natality Data** from the National Vital Statistics System, provided by the National Center for Health Statistics (NCHS), a unit of the CDC[cite: 229, 234]. [cite_start]The data is compiled from a 100% sample of birth certificates from some states and a 50% sample from others, providing comprehensive demographic and health data for births in the United States[cite: 232].
