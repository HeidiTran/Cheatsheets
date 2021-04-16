## **Import**
```python
import sqlite3
```

## **Execute Query**
```python
con = sqlite3.connect('database.sqlite')

# eg: Create a table
query = """
    CREATE TABLE test
    ( a VARCHAR(20), b VARCHAR(20),
      c REAL, d INTEGER
    );"""

con.execute(query)
con.commit()

# eg: insert a few rows
rows = [('Atlanta', 'Georgia', 1.25, 6), ('Tallahassee', 'Florida', 2.6, 3)]
stmt = "INSERT INTO test VALUES(?, ?, ?, ?)"
con.executemany(stmt, rows)
con.commit()
```

## **Fetch**
```python
cursor = con.execute('select * from test')

# Will return a list of tuples
rows = cursor.fetchall()
```
