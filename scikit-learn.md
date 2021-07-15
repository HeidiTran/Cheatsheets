# Install
```python
pip install -U sckikit-learn
```

# Split 
> Split dataset into train set and test set
```python
from sklearn.model_selection import train_test_split

'''
@test_size: proportion of the test split (default is 0.25)
@random_state: controls the shuffling applied to the data before the split -> same val produce the same split
'''
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)
```

# Evaluate
- Confusion Matrix
    - True positive (tp): “This is iris-setosa, we predicted as iris-setosa”
    - False positive (fp) (Type 1 Error): “this is not iris-setosa, we predicted as iris-setosa”
    - False negative (fn) (Type 2 Error): “this is iris-setosa, we predicted as not iris-setosa”
    - True negative (tn): “this is not iris-setosa, we predicted as not iris-setosa”

|      |positive | negative |
|------|------|------|
|positive|tp |fp|
|negative|fn | tn|

![](./images/Model_Eval.png)

```python
from sklearn.metrics import confusion_matrix
from sklearn.metrics import classification_report

# Summary of the predictions made by the classifier
print(classification_report(y_test, y_pred))
print(confusion_matrix(y_test, y_pred))

# Accuracy score
from sklearn.metrics import accuracy_score
print(f'Accuracy is: {accuracy_score(y_pred,y_test)}')
```

# Rescale
- Scale with `StandardScaler`
```python
from sklearn.preprocessing import StandardScaler

scaler = StandardScaler()
scaler.fit(df)
scaled = scaler.transform(df)
```

# Logistic Regression
- Useful to run early in the workflow
- Measures the relationship between the **categorical** dependent variable (feature) on 1 or more independent variables (features) by estimating probabilities using a logistic function which is the cumulative logistic distribution
```python
from sklearn.linear_model import LogisticRegression

logreg = LogisticRegression()
logreg.fit(X_train, Y_train)
Y_pred = logreg.predict(X_test)

# Calculate feature's correlation to the dependent variable
# coeff_df is the `df` WITHOUT the dependent variable
coeff_df.columns = ['Feature']
coeff_df['Correlation'] = pd.Series(logreg.coef_[0])
coeff_df.sort_values(by='Correlation', ascending=False)
```

# Support Vector Machines
- A supervised learning model used for classification and regression analysis
- Is a non-probabilistic binary linear classifier
```python
from sklearn.svm import SVC

svc.fit(X_train, Y_train)
Y_pred = svc.predict(X_test)
```
```python
from sklearn.svm import LinearSVC

linear_svc = LinearSVC()
linear_svc.fit(X_train, Y_train)
Y_pred = linear_svc.predict(X_test)
acc_linear_svc = round(linear_svc.score(X_train, Y_train) * 100, 2)
```

# k-Nearest Neighbors (k-NN)
- A non-parametric method for classification and regression
- A sample is classified by a majority vote of its k nearest neighbors
```python
from sklearn.neighbors import KNeighborsClassifier

knn = KNeighborsClassifier(n_neighbors = 3)
knn.fit(X_train, Y_train)
Y_pred = knn.predict(X_test)
```

# Naive Bayes
- A family of simple probabilistic classifiers based on applying Bayes' theorem with strong independence assumptions between the features
```python
from sklearn.naive_bayes import GaussianNB

gaussian = GaussianNB()
gaussian.fit(X_train, Y_train)
Y_pred = gaussian.predict(X_test)
```

# Perceptron
- Algorithm for supervised learning of binary classifiers (function that decide whether an input belongs to some specific class or not)
```python
from sklearn.linear_model import Perceptron

perceptron = Perceptron()
perceptron.fit(X_train, Y_train)
Y_pred = perceptron.predict(X_test)
```

# Stochastic Gradient Descent
```python
from sklearn.linear_model import SGDClassifier

sgd = SGDClassifier()
sgd.fit(X_train, Y_train)
Y_pred = sgd.predict(X_test)
```

# Decision Tree
- Uses a decision tree as a predictive model which maps features (tree branches) to conclusions about the target value (tree leaves)
- Tree models where the target var can take a finite set of vales = classification trees
- Tree models where the target var can take continuous values = regression trees
```python
from sklearn.tree import DecisionTreeClassifier

decision_tree = DecisionTreeClassifier()
decision_tree.fit(X_train, Y_train)
Y_pred = decision_tree.predict(X_test)
```

# Random Forest aka Random Decision Forests
- An ensemble learning method for classification, regression, etc
- Operate by constructing a multitude of decision trees (eg: `n_estimators = 100`) at training times and output the class that is the mode of the class (classification) or mean prediction (regression) of the individual trees 
```python
from sklearn.ensemble import RandomForestClassifier

random_forest = RandomForestClassifier(n_estimators=100)
random_forest.fit(X_train, Y_train)
Y_pred = random_forest.predict(X_test)
random_forest.score(X_train, Y_train)
```
