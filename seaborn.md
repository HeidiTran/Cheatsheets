## **I. Import**
```python
import seaborn as sns

# If in IPython
%pylab
```

## **II. Figure Aesthetics**
- Styles
```python
# Set default style
sns.set()

sns.set_style("whitegrid")
```

## **III. Plots**
- Bar Chart
```python
tips = sns.load_dataset("tips")

# x, y must pass in the columns' labels
sns.barplot(x = 'total_bill', y = 'day', data = tips, orient = 'h')
```

- Scatterplot
```python
sns.regplot(x = 'total_bill', y = 'tip', data = tips)
```

- Histogram
```python
sns.displot(tips['total_bill'], bins=100, color='k')
```

- Facetgrid
```python
sns.factorplot(x='day', y='total_bill', col='smoker', kind='bar', data = tips)
sns.factorplot(x='day', y='total_bill', col='smoker', kind='box', data = tips)
```