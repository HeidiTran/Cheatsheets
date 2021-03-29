## **I. Import**
```python
import json
```

## **II. Open**
```python
json.load(open("data.json", "r"))
```

## **III. Write**
- Store a list of dictionaries as a JSON
```python
json.dump(listOfDict, open("result.json", "w"))

# eg: listOfDict = [{ 'id' : 1, 'name' : 'apple' }, { 'id' : 2, 'name' : 'cake' }]
```