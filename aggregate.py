import pandas as pd
import numpy as np
death = pd.read_csv('data-by-modzcta.csv')
demo = pd.read_csv("metricsgame2.csv")
death = death.rename(columns={"MODIFIED_ZCTA": "zip"})
demo = demo.rename(columns={"zipcode": "zip"})
merged = pd.merge(death, demo, on="zip", how="inner")
merged.to_csv("merged.csv", index=False)