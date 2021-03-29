## **I. Import**
```python
import pandas as pd
from pandas import Series, DataFrame # Very frequently use
```

## **II. Series**
We can think of series as a fixed-length ordered dict. It maps 1-to-1 of index values to data values 
- Create
```python
# From a list. If index param is omitted -> default index is 0...n
data = Series([1, 2, 3], index = ['a', 'b', 'c'])

# From a dict. Passing `index` to specify the order you want the indexes to be (MUST match the dict's keys)
# If `index` param is omitted -> default index is the dict's keys in random order 
data = Series({ 'a' : 1, 'b' : 2, 'c' : 3 }, index = ['c', 'b', 'a']) 
```

- Basic Information
```python
data.index      # Index
```

- Common functionalities
```python
# Check if any data's values is null
pd.notnull(data)

# Reindex
data.reindex(['a', 'b', 'c'])
```

- Access by index
```python
# You can access elem with normal 0-based indexing OR
# Access with the custom index
data = Series([1, 2, 3, 4], index = ['a', 'b', 'c', 'd'])
data['b'] # -> 2
```

## **III. Data Frame**
Are built from Series. Each series is a column. Can be thought of as a dict of Series sharing the same index (row index)
- Create
```python
# From a dict of equal-length list
data = {
    'state' : ['CA', 'PA', 'OH'],
    'year' : [1, 2, 3],
    'pop' : [1.5, 1.6, 3.3]
}

# index parameter is optional -> specify to give the row's label
# columns parameter is optional -> specify to arrange the columns in that order
df = DataFrame(data, columns = ['year', 'state', 'pop'], index = ['one', 'two', 'three'])
```

- Basic Information
```python
df.shape            # shape (rows, cols)
df.index            # Get the row index (label)
df.columns          # Get the col index
df.index.name       # Row label name
df.columns.name     # Col label name
df.values           # Get all the data by rows
df.info()           # Describe indexes
df.head()           # Get the first 5 rows
df.count()          # Number of non-NA values

df.sum()
df.min()
df.max()
df.describe()       # Summary statistics
df.mean()
df.median()
```

- Indexing
```python
# Get a column (a series) by using the col's label -> return a view NOT a deep copy
df['year']      # equivalent to df.year

# Get multiple columns
df[['state', 'pop']]

# Get a row by using the custom row's label
df.loc[0]

# Get a subset of rows and cols with loc[rows, cols]
df.loc([['one', 'three'], ['pop', 'state']])
```

- Slicing
```python
# Using label -> inclusive range
df['year':'state']

# Using boolean expression
df[df['pop'] > 1]
```

- Add / Delete
```python
# Add a new col -> new col must be a pd's Series + MUST use [] instead of . notation
# index parameter is REQUIRED for correct rows mapping
df['debt'] = pd.Series([1, 2, 3], index=['one', 'two', 'three'])

# Delete a col
del df['debt']  # equivalent to del df.debt

# Drop a col = return a new df without that col. If pass in inplace = True -> will not return a new df
df.drop('debt', axis='columns') # equivalent to df.drop('debt', axis=1)

# Drop multiple cols
df.drop(['year', 'debt'], axis=1)

# Delete a row. If pass in inplace = True -> will not return a new df
df = df.drop('two')     # To delete multiple rows: df.drop(['one', 'two'])
```

- Common functionalities
```python
# Reindex rows
df.reindex(['two', 'one', 'three'])

# Reindex columns
df.reindex(columns = ['pop', 'state', 'year'])

# Apply a function on each elem
df.applymap(lambda x: x * 2)
```