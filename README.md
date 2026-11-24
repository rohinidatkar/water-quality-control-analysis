# Water Quality Control Analysis

> Python/Excel analysis of public water-quality data: cleaning, compliance checks against standard limits, and SPC control charts.

## Overview
This project cleans a public water-quality dataset and compares **pH, turbidity and TDS** against standard drinking-water limits. It then builds **control charts** to flag out-of-range readings and summarises key findings and recommendations.

## What it does
- Cleans data: type coercion, duplicate removal, impossible-value handling, median imputation
- Compares each parameter with its limit and reports % non-compliant
- Builds Individuals (I-MR) control charts with 3-sigma limits plus specification limits
- Exports flagged samples and the cleaned dataset (usable in Excel)
- Prints findings and recommendations

## Parameters and limits used
| Parameter | Limit used |
|---|---|
| pH | 6.5 - 8.5 |
| Turbidity | <= 5 NTU |
| TDS | <= 500 mg/L |

Limits follow common guidance (BIS IS 10500 / WHO). Edit `LIMITS` in the notebook to match your reference standard.

## Project structure
```
water-quality-control-analysis/
├── water_quality_analysis.ipynb
├── data/                  # put water_quality.csv here (not committed)
├── outputs/               # generated: cleaned data, flagged samples
├── requirements.txt
└── README.md
```

## Getting started
```bash
pip install -r requirements.txt
jupyter notebook water_quality_analysis.ipynb
```
Add your dataset as `data/water_quality.csv` with columns `sample_id, ph, turbidity, tds`. Without it, the notebook runs on **synthetic demo data** (clearly labelled) so you can see the workflow.

## Dataset
Add your source here (name, link, licence), e.g. a public water-quality dataset from Kaggle or a government open-data portal.

## Results
Add your actual numbers after running on the real data (compliance %, number of flagged readings, main findings).

## Tech stack
Python (pandas, NumPy, Matplotlib), Excel, Jupyter

## Author
Rohini Datkar
