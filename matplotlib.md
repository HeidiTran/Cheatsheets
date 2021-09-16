## **I. Import**
```python
import matplotlib.pyplot as plt

# If importing in jupyter notebook
# %matplotlib inline

# If importing in IPython
# %matplotlib
```

## **II. Create plot**
```python
# Create new figure
fig = plt.figure()

# Add an overall title to figure
fig.suptitle("Overall title")

# Create subplot(s)
# This means the figure should be 2 x 2 -> contains 4 plots. The last param denote the subplot we're selecting
ax1 = fig.add_subplot(2, 2, 1)
ax2 = fig.add_subplot(2, 2, 2)
ax3 = fig.add_subplot(2, 2, 3)

# Set figure size
plt.figure(figsize=(12, 10))
```

All of the above could be short-handed
```python
fig, axes = plt.subplots(nrows = 2, ncols = 2)
ax1, ax2, ax3, ax4 = axes[0, 0], axes[0, 1], axes[1, 0], axes[1, 1]

# If we only need columns
fig, axes = plt.subplots(ncols = 3)
```

## **III. Line plots**
```python
# Draw at the last subplot by default
plt.plot(data)

# if use fig, axes = plt.subplots(...) -> draw at the the plot with coord (0, 1)
axes[0, 1].plot(data)

#eg:
axes[0, 1].plot(np.random.randn(1000))
```

## **IV. Histogram**
```python
ax1.hist(data, bins = 20, color = 'k', alpha = 0.3)

# alpha: opacity (decimal from 0-1)

# eg:
ax1.hist(np.random.randn(100), bins = 20, color = 'k', alpha = 0.3)
```

## **V. Scatter plot**
```python
ax2.scatter(data1, data2, color = 'r', marker = 'o')
'''
marker: 
    o : circle
    s : square
    ^ : triangle
    D : diamond
'''

# eg: 
ax2.scatter(np.arange(30), np.arange(30) + 3*np.random.randn(30))
```

## **VI. Customize plot**

To see the full set of line styles run `plot?`
```python
# Line syle
ax1.plot(data1, data2, linestyle = '--')

# Line width
ax1.plot(data1, data2, linestyle = '--', linewidth = 4.0)

# To add color use its hex code or color's abbreviation
ax1.plot(data1, data2, linestyle = '--', color = 'g')

# To add markers to line plot
# eg: marker = '.' or marker = 'o'
ax1.plot(data, linestyle = '--', color = 'g', marker = 'o')

# Legend for each line/bar category/etc
ax1.plot(data, label = 'Female')
ax1.plot(data1, label = 'Male')
ax1.set(xlabel = 'X-Axis', ylabel = 'Y-Axis')

# Legend's location
ax1.legend(loc = 'best')

# Ticks (set_yticks for y axis)
ax1.set_xticks([0, 25, 50, 75, 100])
ax1.set_xticklabels(["low", 25, "mid", 75, "hi"], rotation = 30, fontsize = 'small')
ax1.set_xlabel('Cost')

# Format ticks' labels
yAxixFormatter = FuncFormatter(lambda x, pos : int(x))  # `x` is the value, `pos` is tick position
ax1.yaxis.set_major_formatter(yAxixFormatter)

# Subplot title
ax1.set_title("My plot title", y = 0.2) # y default is 0.98

# Axis's limits
ax1.set(xlim = [0, 100], ylim = [-100, 100])

# Subplot spacing
plt.subplots_adjust(left = None, bottom = None, right = None, top = None, wspace = None, hspace = None)
# wspace and hspace: % of the figure width and figure height to use as spacing between subplots

# Fit subplot(s) into the figure area
fig.tight_layout()
```

## **VII. Clear**
```python
# Clear a subplot
ax1.cla()

# Clear the whole figure
ax1.clf()

# Close a windoe
plt.close()
```

## **VIII. Save to a file**
```python
plt.savefig('foo.png')

#eg:
plt.savefig('foo.png', dpi = 400, bbox_inches = 'tight')
# bbox_inches can trim the whitespace around the actual figure
```
