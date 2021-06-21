# Install
```python
pip install -U sckikit-learn
```

# Logistic Regression
- Useful to run early in the workflow
- Measures the relationship between the **categorical** dependent variable (feature) on 1 or more independent variables (features) by estimating probabilities using a logistic function which is the cumulative logistic distribution
```python
from sklearn.linear_model import LogisticRegression

logreg = LogisticRegression()
logreg.fit(X_train, Y_train)
Y_pred = logreg.predict(X_test)
modelAccuracy = round(logreg.score(X_train, Y_train) * 100, 2)

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
modelAccuracy = round(svc.score(X_train, Y_train) * 100, 2)
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
modelAccuracy = round(knn.score(X_train, Y_train) * 100, 2)
```

# Naive Bayes
- A family of simple probabilistic classifiers based on applying Bayes' theorem with strong independence assumptions between the features
```python
from sklearn.naive_bayes import GaussianNB

gaussian = GaussianNB()
gaussian.fit(X_train, Y_train)
Y_pred = gaussian.predict(X_test)
modelAccuracy = round(gaussian.score(X_train, Y_train) * 100, 2)
```

# Perceptron
- Algorithm for supervised learning of binary classifiers (function that decide whether an input belongs to some specific class or not)
```python
from sklearn.linear_model import Perceptron

perceptron = Perceptron()
perceptron.fit(X_train, Y_train)
Y_pred = perceptron.predict(X_test)
modelAccuracy = round(perceptron.score(X_train, Y_train) * 100, 2)
```

# Stochastic Gradient Descent
```python
from sklearn.linear_model import SGDClassifier

sgd = SGDClassifier()
sgd.fit(X_train, Y_train)
Y_pred = sgd.predict(X_test)
modelAccuracy = round(sgd.score(X_train, Y_train) * 100, 2)
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
modelAccuracy = round(decision_tree.score(X_train, Y_train) * 100, 2)
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
modelAccuracy = round(decision_tree.score(X_train, Y_train) * 100, 2)
 = round(random_forest.score(X_train, Y_train) * 100, 2)
```
