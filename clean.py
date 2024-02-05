import pandas as pd
import numpy as np
df = pd.read_csv('merged.csv')
df['spread'] = df['log_positive_0609']-df['log_positive_0407'] #logx-logy = log(x/y) where x and y are the total number of positives on 6/9 and 4/7, respectively
# print(df.columns)
df['spread_share'] = df['positive_per_capita_0609']-df['positive_per_capita_0407']
mydict = {"Manhattan": 1, "Bronx": 2, "Brooklyn": 3, "Queens": 4, "Staten Island": 5}
df["borough"] = df["borough"].map(mydict)
mylist = df.columns
mylist = [x for x in mylist if not x.startswith("total_tests")]
mylist = [x for x in mylist if not x.startswith("log_positive")]
mylist = [x for x in mylist if not x.startswith("share_positive")]
mylist = [x for x in mylist if not x.startswith("log_total_tests")]
mylist = [x for x in mylist if not x.startswith("tests_per_capita")]
mylist = [x for x in mylist if not x.startswith("positive_per_capita")]
df = df[mylist]
df.to_csv("clean.csv", index=False)