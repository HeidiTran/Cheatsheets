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

- Index object
```python
# Get
data.index     

# Set
index = pd.Index([0, 1, 2, 3])
df = df.set_index(index)

# Update
pd.Series(data, index = ['d', 'e', 'f'])

# Reindex
# Create new rows of all `null` for the values in newInd that aren't in df's index
# For in newInd that already exists in df's index -> reorder rows
data.reindex(['a', 'b', 'c'])

# Reindex + filling values (only works on rows)
obj = Series(['blue', 'purple', 'yellow'], index = [0, 2, 4])
obj.reindex(range(6), method = 'ffill') # creates a new row for a new label with the values in the prev row according to the numerical order of df's index
```

- Working with missing/duplicated data
```python
# Check if any data's values is null/not null
data.isnull()   # equiv to pd.isnull(data)
data.notnull()   # equiv to pd.notnull(data) 

# Drop missing data -> return a new Series with only non-null data
data = data.dropna()

# Fill missing value 
data.fillna(data.mean())    # with mean
data.fillna(method = 'ffill', inplace = True)   # with `ffill` method

# Replace
data.replace([-200, -201], 200) # replace all -200 and -201 with 200
data.replace({-200: 200, -201: 201})

# Check whether a row is a duplicate -> return a boolean Series
data.duplicated()
```

- Convert data type

List of data types: `np.int64` 
```python
data = data.astype(np.int64)
```

- Common functionalities
```python
# Get all unique values
data.unique()

# Filter for if value in a list
data.isin([1, 6])
~data.isin([1, 6])  # For not in a list

# Rank
data = Series([7, -5, 7, 4, 2, 0, 4])
data.rank()     # The smallest value get rank 1. Break ties by the mean rank
data.rank(method = 'first') # The smallest value get rank 1. Break ties on the smaller index
data.rank(method = 'max')   # The largest value get rank 1

# Apply a function on each elem (only works on Series)
data = data.map(lambda x : '%.2f' % x)
data = data.map({ 'FALSE': False, 'TRUE': True})    # Convert
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

- Binning
```python
# Cut into custom bin size
ages = [20, 22, 25, 27, 21, 23, 37, 31, 61, 45, 41, 32]
bins = [18, 25, 35, 60, 100]
cats = pd.cut(ages, bins, labels = ['Youth', 'YoungAdult', 'MiddleAged', 'Senior']) # [(18, 25], (18, 25], (18, 25], (25, 35], (18, 25], ..., (25, 35], (60, 100], (35, 60], (35, 60], (25, 35]]



# Count number of values in each bin
pd.value_counts(cats)
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
df.dtypes           # Get the data types of all columns
df.count()          # Number of non-NA values
df.describe()       # Summary statistics

# NA are exclude by default -> change by setting skipna = False
df.sum()            # To sum by columns, pass in axis='columns'
df.min()
df.max()
df.mean()
df.median()
```

- Iterate
```python
for index, row in df.iterrows():
    print(row['pop'])

# If we want to sort, then loop
for index, row in df.sort("ColumnName").iterrows():
    print(row['aColumn'])

# Set value for a specific cell
df.at[index, "ColumnName"] = value
```

- Indexing
```python
# Get the column index of a column
df.columns.get_loc('pop')

# Get the row index of the max value in a column
df['pop'].idxmax()

# Get a column (a series) by using the col's label -> return a view NOT a deep copy
df['year']      # equivalent to df.year

# Get multiple columns
df[['state', 'pop']]

# Get a row by using the custom row's label
df.loc['one']

# Get a subset of rows and cols with loc[rows, cols]
df.loc([['one', 'three'], ['pop', 'state']])

# Get range of rows
df.iloc[:10, :]     # Return first 10 rows and all columns
df.iloc[10 : 20, ['pop', 'state']]  # Return the pop and state column of the 10th - 20th row
df[-5:] # Return last 5 rows and all columns
```

- Select
```python
# Using label -> inclusive range
df['year':'state']

# Using boolean expression
# NOTE: `|` replaces `or` and `&` replaces `and` 
df[df['pop'] > 1]

# Using contains
data = {
    'title' : ['A', 'B', 'C'],
    'topics' : ["['a', 'b']", "['c']", "['a', 'c']"]
}
df = DataFrame(data)
df[df.topics.str.contains('a')]
df[df.topics.str.contains('a|c')]   # | instead of or
```

- Add / Delete
```python
# Add a new col -> new col must be a pd's Series + MUST use [] instead of . notation
# index parameter is REQUIRED for correct rows mapping
df['debt'] = pd.Series([1, 2, 3], index=['one', 'two', 'three'])

# Add a new col using a list values
df.insert(columnPosition, "columnName", [values], inplace)
# eg: df.insert(0, "NewColumn", ["apple", "orange"], True) -> insert a column as the first col in the dataframe

# Clone a col to a new col
df['new col'] = df['debt']

# Delete a col
del df['debt']  # equivalent to del df.debt

# Drop a col = return a new df without that col. If pass in inplace = True -> will not return a new df
df = df.drop('debt', axis='columns') # equivalent to df.drop('debt', axis=1)

# Drop multiple cols
df = df.drop(['year', 'debt'], axis=1)

# Add a new row
newRow = {'state': ['WA'], 'year': 4, 'pop': [1.5]}
df1 =  DataFrame(newRow, columns = ['year', 'state', 'pop'], index = ['four'])
df = df.append(df1)

# Delete a row. If pass in inplace = True -> will not return a new df
df = df.drop('two')     # To delete multiple rows: df.drop(['one', 'two'])
```

- Extend
```python
# Concat 2 or more DataFrame with similar columns' labels
newDf = pd.concat([df1, df2])

# Concat 2 or more DataFrame with similar rows' labels
newDf = pd.concat([df1, df2], axis = 1)
```

- Index Object
```python
df = DataFrame(np.arange(9).reshape(3, 3), index = ['a', 'c', 'd'], columns = ['O', 'T', 'C'])

# Reindex row. New label with result in a new row with NaN value
df.reindex(['a', 'd', 'c'])

# Add a new row filling in with values instead of NaN. 'ffill' will duplicate the value of the rows before the empty row to the empty row
df.reindex(['a', 'd', 'c'], method = 'ffill')

# Reindex column. New label will result in a new col with NaN value
df.reindex(columns = ['T', 'C', 'O'])

# Add a new column with fill_value value instead of NaN
df.reindex(columns = ['T', 'C', 'O'], fill_value = 0)

# Update the row label (index) to a new value
df.index = [20, 21, 22]

# Rename -> without inplace, `rename` will return a new df
df.rename(index = {'one': 'ONE'}, inplace = True)
df.rename(columns = {'pop': 'population'}, inplace = True)
```

- Sort
```python
# Sort by rows' labels
df.sort_index()     # equivalent to df.sort_index(axis = 0)

# Sort by cols' labels. `ascending` default to True
df.sort_index(axis = 1, ascending = False)

# Sort by one or many columns' values. `ascending` default to True
# If pass in multiple columns -> priority goes from left to right
# Default inplace = False -> so return a new df
df.sort_values(by = 'pop', ascending = False, inplace = True)
df.sort_values(by = ['pop', 'debt'])
```

- Working with missing/duplicated data
```python
# Check if any data's values is null/not null
df.isnull()   # equiv to pd.isnull(df)
df.notnull()   # equiv to pd.notnull(df) 

# Drop ANY rows containing a missing value
df = df.dropna()

# Drop only rows that are all NA
df = df.dropna(how = 'all')

# All rows with # of non-NA >= `thresh` will be kept. Drop others
df = df.dropna(thresh = 2)

# Drop only cols that are all NA
df = df.dropna(axis = 1, how = 'all')

# Fill missing value with 0 / Fill different missing value for different column
df = df.fillna(0)
df = df.fillna({'pop': 1, 'debt': 0}) # Fill column 'pop' with 1

# Check whether a row is a duplicate -> return a boolean Series
df.duplicated()

# Drop all duplicated rows
df = df.drop_duplicates()
df = df.drop_duplicates(['state'])  # only drop rows where state col is duplicated
```

- Common functionalities
```python
# Count the number of rows in each group of a categorical column
df['state'].value_counts()

# Apply a function for each elem (only works for DataFrame)
df.applymap(lambda x: x * 2)

# Apply a function on each column (works for both DataFrame + Series)
df.apply(lambda x : x.max() - x.min())

# Apply a function on each row (works for both DataFrame + Series)
df.apply(lambda x : x.max() - x.min(), axis = 'columns')
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
df.plot(kind = 'line', title = 'My Plot title', legend = True, marker = 'o')

# Bar plot
df.plot(kind = 'bar', x = 'state', y = 'pop')

# Stack horizonal bar plot
df.plot(kind = 'barh', stacked = True, color = 'mediumvioletred')

# Histogram
df.plot(kind = 'hist', figsize=(5,5)

# Scatterplot for 2 continuous data
df.plot(kind = 'scatter', x = 'points', y = 'price', linestyle = '--')
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

# Parse date columns as Date object
pd.read_csv('file.csv', parse_date = ["DateCol1", "DateCol2"])

# Skip rows -> pass in row indexes
pd.read_csv('file.csv', skiprows = [0, 2, 3])

# Read only the first n rows
pd.read_csv('file.csv', nrows = 5)

# Specify delimiter/separator of the file
pd.read_csv('file.csv', delimiter = '\t')

# Read in only certain columns out of all available columns
pd.read_csv('file.csv', usecols = ['pop', 'state'])
```

```python
# Write
df.to_csv('file.csv')   # to write to console: to_csv(sys.stdout)

# Specify the delimiter/separator of the file
df.to_csv('file.csv', sep = '|')

# Specify how you want null value to be represent
df.to_csv('file.csv', sep = '|', na_rep = 'NULL')

# Not write header and indexes to file
df.to_csv('file.csv', index = False, header = False)

# Only write a subset of columns
data.to_csv('file.csv', index=False, columns=['sate', 'pop'])
```

- Read/Write for other type of files
```python
# Read Excel XLS or XLSX
xlsx = pd.ExcelFile('file.xlsx')
pd.read_excel(xlsx, 'Sheet1')   # faster than pd.read_excel('file.xlsx', 'Sheet1')

writer = pd.ExcelWriter('file.xlsx')
df.to_excel(writer, 'Sheet1')     # faster than pd.to_excel('file.xlsx', 
writer.save()

# Read/Write a JSON string representation
pd.read_json('file.json')
df.to_json()

# Read HDF5 
pd.read_hdf

# Read HTML (only read in <table> tag)
pd.read_html('file.html')

# Read/Write Parquet files
pd.read_parquet('file.parquet') # required: pip install pyarrow
pd.to_parquet('file.parquet', compression = 'snappy')
```

## **Group by**
- Count observations (rows) by group
```python
# return a Pandas Series
df.groupby('state').size()

# return a Pandas Data Frame
df.groupby('state').size().reset_index(name = '# of observations')  # give the count column `# of observations` label

# Convert to percentage
df['# of observations'].apply(lambda x : x*100/df['# of observations'].sum())
```

- Sum observations (rows) by group
```python
df.groupby('department')['sales'].sum().reset_index(name = 'Total Sales')   # give the sum column `Total Sales` label
```

- Get percentage by group
```python
df.groupby('state').size().groupby(level = 0).apply(lambda x : x * 100 / x.sum()).reset_index(name = 'Percentage')
```

- To group by 2 columns
```python  
means = df.groupby(['department', 'product']).mean()

# If you want to hide the group keys in groupby
df.groupby(['department', 'product'], group_keys = False).mean()

# If we want to unstak the DF above
means.unstack()
```

- Group by dictionary/Series
```python
people = pd.DataFrame(np.random.randn(5, 5),
                      columns=['a', 'b', 'c', 'd', 'e'],
                      index=['Joe', 'Steve', 'Wes', 'Jim', 'Travis'])
people.iloc[2:3, [1, 2]] = np.nan 
mapping = {'a': 'red', 'b': 'red', 'c': 'blue',
           'd': 'blue', 'e': 'red', 'f' : 'orange'}

# Group by dictionary
by_column = people.groupby(mapping, axis=1)
by_column.sum()

# Group by Series
map_series = pd.Series(mapping)
people.groupby(map_series, axis=1).count()
```

## **Pivot table**
```python
import seaborn as sns
tips = sns.load_dataset("tips")
tips.pivot_table(['tip_pct', 'size'], index=['time', 'day'], 
                columns='smoker')

# If some combinations are NA -> pass in fill_value
tips.pivot_table('tip_pct', index=['time', 'size', 'smoker'],
                 columns='day', aggfunc='mean', fill_value=0)

# Frequency pivot table       
pd.crosstab([tips.time, tips.day], tips.smoker)   
# ---------> We can plot the relationship between categorical and continous variable quickly
pd.crosstab(tips.time, tips.smoker).plot.bar()    
```