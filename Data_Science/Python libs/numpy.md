## **I. Import**
```python
import numpy as np
```

## **II. ndarray**
- Create
```python
# one dimension 
pydata = [1, 2, 7.4, 5]
data = np.array(pydata, dtype=np.int32) 

# 2x4 matrix from existing list
pydata = [[1, 2, 7.4, 5], [1, 2, 7.4, 5]]
data = np.array(pydata) 

# An 2x3x2 matrix of all 0s. If use ones() -> a matrix of all 1s
data = np.zeros((2, 3, 2)) 

# 1D of continuous numer [a, b] with x steps
data = np.arange(start, end, step)

# 1D of numbers [0...n]
data = np.arange(n)     # To turn into a matrix a x b: np.arrange(n).reshape(a, b)

# 2x3 matrix of random data
np.random.randn(2, 3)

# Identity matrix of size n x n
np.identity(n)
```

- Get dimension
```python
data.shape      # return (# of row, # of col)
```

- Get datatype
```python
data.dtype
```

- Convert
```python
# eg: Convert array of strings to arrya of number
arrayOfStrings.astype(float)
```

- **IMPORTANT: NUMPY AXES ARE DIFFERENT!**

For 2D array:

Pass in `axis = 0` will apply functions to **column**

Pass in `asis = 1` will apply funcitons to **row**
![](numpy_axes.png)

For 1D array:

Since there is only one axis. Pass in `axis = 0` will apply functions to **row**

![](numpy_axes_1D_array.png)

- Index

Index with `[]` like normal multidimension array works 

Preferred using a comma-separated list of indices
Given a 2 x 3 x 4 matrix `data` -> bottom right elem would be `data[2, 3, 4]`

Fancy Indexing: If you want to select third elem, first elem, 20th elem in that order -> `data[[3, 1, 20]]`

- Slicing

**NOTE**: normal slicing eg: `data[m:n]` will give you a view, which means any changes made to this slice will modify the original matrix. If you want to get a deep copy -> `data[m:n].copy()`

```python
# Slicing with array of booleans -> Create a copy of the data

#eg: get all rows where names == 'Bob' is true, and only return all columns from the 3rd column
data[names == 'Bob', 2:]

# NOTE: For booleans array use & and | instead of `and` and `or`
data[(names == 'Bob') | (names == 'Will')]
```

- Sort
```python
# Sort along an axis
data.sort(0)    # will sort along the first axis (eg: column)
```

- Unique
```python
np.unique(data) # return SORTED unique values
```

- Find with `where`
```python
# Return the index of data that satisfy boolean condition
np.where(data > 10)
```

- Replace with `where`
```python
np.where(data > 10, 10, data)

# This is equivalent to data = 10 if data > 10 else data
```

## **III. Working with files**
- Save ndarray to a file without compressing
```python
np.save('file name without extension', data) # will save to a file with .npy extension
```

- Load ndarray from `npy` file
```python
np.load('data.npy')
```

- Load files (csv, tsv, etx.) 
```python
data = np.loadtxt('file.csv', delimiter = ',')
```

## **IV. Common Math Funct**
- Basic
```python
data.mean(axis = 1)
data.sum(axis = 0)  # We can passed in condition: np.sum(data > 10, axis = 0)
data.min(axis = 0)
```

- Random Seed
```python
np.random.seed(1234)
```

