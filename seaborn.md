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

- Line plot
```python
sns.lineplot(x = 'total_bill', y = 'tip', data = tips)
```

- Scatterplot
```python
sns.scatterplot(x = 'total_bill', y = 'tip', data = tips)
```

- Regression plot
```python
sns.regplot(x = 'total_bill', y = 'tip', data = tips)
```

- Histogram
```python
sns.displot(tips['total_bill'], bins=100, color='k')
```

- Countplot
```python
# `class` and `who` are both categorical variable
sns.countplot(x="class", hue="who", data=titanic)
```

- Facetgrid
```python
# Note: `facetplot` has been renamed to `catplot`
sns.catplot(x='day', y='total_bill', col='smoker', kind='bar', data = tips)
sns.catplot(x='day', y='total_bill', col='smoker', kind='box', data = tips)

# To add an overal title to the whole facetgrid figure
plot.fig.subplots_adjust(top=0.87)  # this is to adjust the space between the title and the plot
plot.fig.suptitle("Overal title")

- stripplot() -> kind = "strip" # scatterplot
- swarmplot() -> kind = "swarm"
- boxplot() -> kind = "box"
- violinplot() -> kind = "violin"
- boxenplot() -> kind = "boxen"
- pointplot() -> kind = "point"
- barplot() -> kind = "bar"
- countplot() -> kind = "count"
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