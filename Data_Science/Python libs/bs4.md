# Import
```python
from bs4 import BeatifulSoup    # conda install beautifulsoup4
```

# Parse HTML
```python
import requests
html = requests.get("http://www.example.com").text
soup = BeautifulSoup(html, 'html5lib')
```

#### Find a tag
```python
firstPara = soup.find('p')  

# to get the text: 
firstPara.text

# to get the attributes use `dict` like syntax
soup.find('style')['type']  # equivalent to soup.find('style').get('type')
```

#### Find multiple tags
```python
allParas = soup.find_all('p')
```

#### Find tags contain a specific class
```python
soup.find("div", "date")   # <span class = "date">
```

