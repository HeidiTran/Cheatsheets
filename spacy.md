## **I. Import**
```python
import spacy
```

## **II. Tokenization**
```python
# Break a string up into words (punctuation will not be part of the word)
nlp = spacy.load("en") # Run python -m spacy download en
doc = nlp("A long piece. of string. with some, punctuation")

words = []
for token in doc:
    words.append(token.text)
```