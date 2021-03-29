## **I. Import**
```python
import csv
```

## **II. Read**
```python
reader = csv.reader(open("abc.csv", "r"))
data = list(reader)

# data would look like [[1, 'apple'], ['2', 'cake']]
```