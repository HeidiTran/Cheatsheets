## **I. Import**
```python
import json
```

## **II. Deserialize**
- Deserialize a JSON file to a Python obj
```python
data = json.load(open("data.json", "r"))
```

- Deserialize a string containing JSON obj to a Python obj
```python
json.loads(...)

# eg:
with open('data.json', 'r', encoding = 'utf-8') as f:
    for line in f:
        # type of json.loads(line) is a dict
        print(json.loads(line))
```

```python
# After using json.loads() to load a JSON into a dict -> Can transform data into a pandas Data Frame

results = json.loads('data.json')
# results = {'United States': [{'state': 'PA', 'pop': 1}, {'state': 'OH', 'pop': 2}]}

pd.DataFrame(results['United States'], columns = ['state', 'pop'])
```

## **III. Serialize**
- Serialize a Python obj to a JSON file
```python
json.dump(data, open("result.json", "w"))

# eg: data = [{ 'id' : 1, 'name' : 'apple' }, { 'id' : 2, 'name' : 'cake' }]
```

- Serialize a Python obj to a JSON formatted string
```python
json.dumps(data)
```