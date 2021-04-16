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

# Get all unique values
data.unique()

# Filter
data.isin([1, 6])
```

- Access by index
```python
# You can access elem with normal 0-based indexing OR
# Access with the custom index
data = Series([1, 2, 3, 4], index = ['a', 'b', 'c', 'd'])
data['b'] # -> 2
```

- Sort 
```python
# By index
data.sort_index()

# By values. Note that missing values are sorted to the end
data.sort_values()
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
df.columns.values   # Col label name
df.index.name       # Row label name
df.values           # Get all the data by rows
df.info()           # Describe indexes
df.head()           # Get the first 5 rows. To get `n` rows: df.head(n)
df.tail()           # Get the last 5 rows
df.count()          # Number of non-NA values
df.describe()       # Summary statistics

# NA are exclude by default -> change by setting skipna = False
df.sum()            # To sum by columns, pass in axis='columns'
df.min()
df.max()
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
df.loc['one']

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

# Clone a col to a new col
df['new col'] = df['debt']

# Delete a col
del df['debt']  # equivalent to del df.debt

# Drop a col = return a new df without that col. If pass in inplace = True -> will not return a new df
df.drop('debt', axis='columns') # equivalent to df.drop('debt', axis=1)

# Drop multiple cols
df.drop(['year', 'debt'], axis=1)

# Add a new row
newRow = {'state': ['WA'], 'year': 4, 'pop': [1.5]}
df1 =  DataFrame(newRow, columns = ['year', 'state', 'pop'], index = ['four'])
df = df.append(df1)

# Delete a row. If pass in inplace = True -> will not return a new df
df = df.drop('two')     # To delete multiple rows: df.drop(['one', 'two'])
```

- Sort
```python
# Sort by rows' labels
df.sort_index()     # equivalent to df.sort_index(axis = 0)

# Sort by cols' labels. `ascending` default to True
df.sort_index(axis = 1, ascending = False)

# Sort by one or many columns. `ascending` default to True
df.sort_values(by = 'pop', ascending = False)
df.sort_vlaues(by = ['pop', 'debt'])
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

## **Plot**
```python
# If in IPython
%pylab
```

`kind` can be `'area', 'bar', 'barh', 'density', 'hist', 'line', 'pie', 'kde'`

- Series
```python
# For Series, index (label) will be the x-axis 
s = pd.Series(np.random.randn(10).cumsum(), index=np.arange(0, 100, 10))
s.plot(kind = 'line', alpha = 1)
```
- Data Frame
```python
# For DataFrame, columns will be different line and index (label) will be the x-axis
df.plot(kind = 'line', title = 'My Plot title', legend = True)

#eg:
# Stack horizonal bar plot
df.plot(kind = 'bar', stacked = True)
```

## **Files**
- Read and Write to CSV
```python
# Read a file without header
pd.read_csv('file.csv', header = None, index_col = None)

# If the first row of the file is header -> header = 0
pd.read_csv('file.csv', header = 0)

# If want to use your own headers
pd.read_csv('file.csv', names = ['pop', 'state', 'debt'])

# If want to use column 0 as index -> index_col = 1
pd.read_csv('file.csv', header = None, index_col = 1)

# Skip rows -> pass in row indexes
pd.read_csv('file.csv', skiprows = [0, 2, 3])

# Read only the first n rows
pd.read_csv('file.csv', nrows = 5)

# Specify delimiter/separator of the file
pd.read_csv('file.csv', delimiter = '\t')
```

```python
# Write
df.to_csv('file.csv')   # to write to console: to_csv(sys.stdout)

# Specify the delimiter/separator of the file
df.to_csv('file.csv', sep = '|')

# Not write header and indexes to file
df.to_csv('file.csv', index = False, header = False)
```

- Read/Write for other type of files
```python
# Read Excel XLS or XLSX
pd.read_excel('file.xlsx', 'Sheet1')
df.to_excel('file.xlsx', 'Sheet1')

# Read a JSON string representation
pd.read_json('file.json')
df.to_json()

# Read HDF5 
pd.read_hdf

# Read HTML (only read in <table> tag)
pd.read_html('file.html')
```

## **EDA**
- Count observations (rows) by group
```python
# return a Pandas Series
df.groupby('state').size()

# return a Pandas Data Frame
df.groupby('state').size().reset_index(name = '# of observations')  # give the count colum `# of observations` label
```