## **I. Import**
```python
import re
```

## **II. Character classes**
- `.` (*wild card*) matches any chacter except \n
- `[...]` (*character class*) or of a set of characters
- `[^...]` (*complimentary character class*) matches everything except the set of characters
- `[a-z]` (*lowercase range*) matches lowercase letter
- `[A-Z]` (*uppercase range*) matches uppercase letter
- `[0-9]` (*numeric range*) matches numeric ranges

## **III. Quatifiers**
- `\` *zero or more*
- `+` *one or more*
- `?` zero or one
- `{m}` *exactly m times*
- `{m, n}` *match from m to n repetition*

##  **IV. Escapes and special sequences**
- `\` __(escape)__ Either escapes special characters (permitting you to match characters like `*`, `?`, and so forth), or signals a special sequence.
- `\d` __(digits)__ Matches any Unicode decimal digit. This includes `[0-9]`, and also many other digit characters.
- `\D` __(digits)__ Matches any Unicode non-digit.
- ` \s` __(whitespace)__ Matches Unicode whitespace characters, including `[\t\n\r]` and space.
- `\w` __(word characters)__ Matches Unicode word characters; this includes most characters that can be part of a word in any language, as well as numbers and the underscore.
- `\W` __(non-word characters)__ Matches Unicode non-word characters;
- `\t` __(tab)__ Matches a tab character.
- `\n` __(newline)__ matches a newline character.
- `\r` __(carriage return)__ matches a carriage return character.

## **V. Useful commands**
- Check if the pattern matches the string
```python
# If found -> return a re.Match object
# If not found -> return None
re.search("strToFind", "The given string to find")

# eg:
if re.search("fish", "red fish blue fish"):
    print("Fish were found")
else:
    print("Fish were NOT found")
```

- Return all matches of a pattern in a string
```python
re.findall("fish", "red fish blue fish") # -> ['fish', 'fish']
```

- Replace
```python
re.sub("pattern to be replace", "new pattern", "The string  to perform replace on")

# eg:
re.sub("fish", "cat", "red fish blue fish") # -> "red cat blue cat"
```
- Split
```python
# Split by several punctuations
re.split("[,;.]", "Hello, world; this is weird.") # -> ['Hello', 'world', 'this is weird', '']
```