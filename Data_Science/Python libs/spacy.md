# Install
- In Conda, to download lexicons
```bash
python -m spacy download en
```

# Import
```python
import spacy
nlp = spacy.load('en')
```

# Tokenization
```python
# Break a string up into words (punctuation will not be part of the word)
doc = nlp("A long piece. of string. with some, punctuation")

words = []
for token in doc:
    words.append(token.text)
```