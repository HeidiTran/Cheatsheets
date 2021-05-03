## **I. Import**
```python
import seaborn as sns

# If in IPython
%pylab
```

## **II. Figure Aesthetics**
- Size
```python
sns.set(rc={"figure.figsize":(12, 10)})
```

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

## **IV. Customize plot**
- Title
```python
plt.title("Plot title")

sns.barplot(...).set(title = "Plot title")
```

- Font size
```python
sns.set(font_scale = 2)     # 5 would be crazy big
```

- Axis label
```python
sns.barplot(...).set(xlabel = "X-label", ylabel = "Y-label")
```