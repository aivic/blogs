import pandas as pd

df1 = pd.read_csv('open_contrib/SO_pandas_dataset/Set1.csv')
df2 = pd.read_csv('open_contrib/SO_pandas_dataset/Set2.csv')
df3 = pd.read_csv('open_contrib/SO_pandas_dataset/Set3.csv')
df4 = pd.read_csv('open_contrib/SO_pandas_dataset/Set4.csv')

pd.concat([df1, df2, df3, df4]).reset_index(drop=True).to_csv('SO_pandas.csv')