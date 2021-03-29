## **I. Import**
```python
import dateutil
```

## **II. Parse date string**
```python
import dateutil.parser as dateparser

# eg:
dateparser.parse("April 1, 2019")
dateparser.parse("12/25/2019")
dateparser.parse("Monday, 1:00pm")
dateparser.parse("06/14/2019 5:00pm")
```