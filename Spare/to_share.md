## Introduction
The objective of this guide is to introduce the process of slicing and getting the subsets of the Pandas objects.

We will learn these operations using a dummy data stored in a CSV file and breakdown the learning process to four steps:

1. Extracting values from Pandas Series and DataFrame based on their labels.
2. Extracting values from Pandas Series and DataFrame based on their indexes.
3. Selecting columns by excluding a column from the beginning, center and from the end of a DataFrame.
4. Filtering out DataFrame columns based on a certain string.

## Understanding the dataset
We have been given with a CSV file named **`file.csv`**. Let us import the necessary library, (here Pandas) in the python environment and observe few of its first and last observations.

```python
# Importing required library
import pandas as pd

# Reading the CSV file to a Pandas DataFrame object variable, named df 
df = pd.read_csv('file.csv')

# Displaying top 5 observations of the file
df.head()
```
|Serial number | State | Population | Company ID | Established date | Employees count | Growth | Current status
| ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- |
| 0 | Alabama | 4777326 | C869 | 1/1/1950 | 25651 | 1104713 | Open |
| 1 | Alaska | 711139 | C4449 | 11/23/1952 | 7419 | 2707190 | Open |
| 2 | Arizona | 6410979 | C3509 | 10/16/1955 | 19619 | 584596 | Closed |
| 3 | Arkansas | 2916372 | C1117 | 9/7/1958 | 21703 | 51009 | Open |
| 4 | California | 37325068 | C4214 | 7/31/1961 | 39427 | 3587460 | Open |

```python
# Displaying last 5 observations of the file
df.tail()
```

| Serial number | State | Population | Company ID | Established date | Employees count | Growth | Current status |
| ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- |
| 15 | Iowa   | 3047646 | C1087 | 6/3/1993  |  36053 | 2336225 | Open |
| 16 | Kansas |    2851183 | C2141  | 4/26/1996 |  18307 | 1619008 | Open   |
| 17 | Kentucky   |    4340167 | C3239 | 3/19/1999 |  46853 | 4566179 | Closed |
|  18 | Louisiana  |    4529605 | C4810 | 2/8/2002 |  26064 | 1532999 | Open   |
| 19 | Maine |    1329084 | C3850 | 1/1/2005 |  47956 | 1930855 | Closed |

## Extracting Values from Pandas Series and DataFrame based on their Labels
To extract values from either a Series or a DataFrame based on their labels, Pandas provides a method `loc`. It can be used to access a value or a group of values based on their names. 

#### Series
Consider the top five values of the dataset column, `State`. The chosen column `State` will be treated as a Pandas Series as shown:
```python
# Selecting top five values of State
s = df.State.head()
type(s)

# pandas.core.series.Series
```
Let us reindex the `s` and observe the how `loc` is helpful in accessing the values.
```python
# Reindexing the Series s
s.index = ['b', 'd', 'e', 'a', 'f']
```
| Original Series | Series after reindexing |
| ---- | ---- |
| 0 Alabama | b       Alabama |
| 1 Alaska | d Alaska | 
| 2 Arizona | e Arizona |
| 3 Arkansas | a Arkansas |
| 4 California | f California |

To access `Arizona` from the Series after reindexing, we follow:
```python
s.loc['e']
```
Notice, that `e` is written inside apostrophes and `loc` has square brackets rather than round brackets.

#### DataFrame
Let us learn to access a group of values using `loc` in a DataFrame. Using top five rows of the dataset, let us fetch only the `Established date` and `Growth` of all the companies.

```python
df.head().loc[:, ['Established date', 'Growth']]
```
| Established date | Growth |
| -- | -- |
| 1/1/1950 | 1104713 |
| 11/23/1952 | 2707190 |
| 10/16/1955 | 584596 |
| 9/7/1958 |  51009 |
| 7/31/1961 | 3587460 |

From the above code, you can observe that in general, for a DataFrame, `loc` constitutes of two parameters as illustrated, `loc[parameter1, parameter2]`. Here, the `parameter1` corresponds to the row names/labels whereas the `parameter2` corresponds to column names/labels.

## Extracting Values from Pandas Series and DataFrame based on their Indexes

It is not always necessary that you have to access the values of a Pandas object using label names. Pandas provides another great method, `iloc` using which we can access the values just by referring the index.

#### Series
Let us use the same reindexed Series with alphabetical indexes. This time let us access centermost three values which are `Alaska`, `Arizona` and `Arkansas`.
```python
s.iloc[1:4]
s
# d      Alaska
# e     Arizona
# a    Arkansas
# Name: State, dtype: object
```
As you can observe, `iloc` doesn't consider the real alphabetical indexes.

#### DataFrame
Using `iloc`, let us fetch the centermost three rows with all the columns out of the topmost five rows of the DataFrame `df`.
```python
df.head().iloc[1:4, :]
```
|Serial number | State | Population | Company ID | Established date | Employees count | Growth | Current status
| ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- |
| 1 | Alaska | 711139 | C4449 | 11/23/1952 | 7419 | 2707190 | Open |
| 2 | Arizona | 6410979 | C3509 | 10/16/1955 | 19619 | 584596 | Closed |
| 3 | Arkansas | 2916372 | C1117 | 9/7/1958 | 21703 | 51009 | Open |

The `:` inside the `iloc` represents to select all the columns.

## Selecting Columns by Excluding a Column from the Beginning, Center and from the End of a DataFrame

The task of selecting few columns and excluding rest is quite common in day-to-day analysis. The given three tasks can be completed either by `iloc` or `loc`. Both the methods are illustrated.

```python
# 1. Excluding the first column
df.head().iloc[:, 1:]  # Using iloc

df.head().loc[:, ['State', 'Population', 'Company ID', 'Established date', 'Employees count', 'Growth', 'Current status']] # Using loc
```
| State | Population | Company ID | Established date | Employees count | Growth | Current status
| ------- | ------- | ------- | ------- | ------- | ------- | ------- |
| Alabama | 4777326 | C869 | 1/1/1950 | 25651 | 1104713 | Open |
| Alaska | 711139 | C4449 | 11/23/1952 | 7419 | 2707190 | Open |
| Arizona | 6410979 | C3509 | 10/16/1955 | 19619 | 584596 | Closed |
| Arkansas | 2916372 | C1117 | 9/7/1958 | 21703 | 51009 | Open |
| California | 37325068 | C4214 | 7/31/1961 | 39427 | 3587460 | Open |

```python
# 2. Excluding the center column, say Established date
import numpy as np
df.head().iloc[:, np.r_[0:4, 5:8]] # Using iloc and NumPy method np.r_

df.head().loc[:, ['Serial number', 'State', 'Population', 'Company ID', 'Employees count', 'Growth', 'Current status']] # Using loc
```
|Serial number | State | Population | Company ID | Employees count | Growth | Current status
| ------- | ------- | ------- | ------- | ------- | ------- | ------- |
| 0 | Alabama | 4777326 | C869  | 25651 | 1104713 | Open |
| 1 | Alaska | 711139 | C4449 | 7419 | 2707190 | Open |
| 2 | Arizona | 6410979 | C3509 | 19619 | 584596 | Closed |
| 3 | Arkansas | 2916372 | C1117 | 21703 | 51009 | Open |
| 4 | California | 37325068 | C4214 | 39427 | 3587460 | Open |

```python
# 3. Excluding the last column
df.head().iloc[:, :7] # Using iloc

df.head().loc[:, ['Serial number', 'State', 'Population', 'Company ID', 'Established date' ,'Employees count', 'Growth']] # Using loc
```
|Serial number | State | Population | Company ID | Established date | Employees count | Growth | 
| ------- | ------- | ------- | ------- | ------- | ------- | ------- | 
| 0 | Alabama | 4777326 | C869 | 1/1/1950 | 25651 | 1104713 |
| 1 | Alaska | 711139 | C4449 | 11/23/1952 | 7419 | 2707190 |
| 2 | Arizona | 6410979 | C3509 | 10/16/1955 | 19619 | 584596 |
| 3 | Arkansas | 2916372 | C1117 | 9/7/1958 | 21703 | 51009 |
| 4 | California | 37325068 | C4214 | 7/31/1961 | 39427 | 3587460 |

## Filtering Out a DataFrame Columns Based on a Certain String

Sometimes, there's a need to select columns based on their alphabets. The `filter` method provided by the Pandas is quite helpful to select columns automatically. Let us try to fetch columns which either begins with `S` or ends with `s`.
```python
df.head().filter(regex='^S|s$')
# The resultant columns are: Serial number, State, and Current status
```
|Serial number | State | Current status
| ------- | ------- | ------- |
| 0 | Alabama | Open |
| 1 | Alaska | Open |
| 2 | Arizona | Closed |
| 3 | Arkansas | Open |
| 4 | California | Open |

## Conclusion
In this guide, we have learnt the various techniques of slicing and extracting values out of a Pandas objects using methods like `iloc`, `loc`, and `filter`.