# Install
```python
pip install -U sckikit-learn
```

# Rescale
- Scale with `MinMaxScaler`

`MinMaxScaler` takes each feature and scales it to the range 0 - 1. It replaces the min value with *0*, the max with *1* and the other vlaues somewhere in between based on a linear mapping.
```python
from sklearn.preprocessing import MinMaxScaler
scaler = MinMaxScaler()
scaled = scaler.fit_transform(df)
```

- Scale with `StandardScaler`

`StandardScaler` forces each feature to have a 0 mean and a variance of 1 &rightarrow; commonly used starting point for normalization
```python
from sklearn.preprocessing import StandardScaler
scaler = StandardScaler()
scaled = scaler.fit_transform(df)
```

- Scale with `Normalizer`

`Normalizer` ensures the sume of the values for each sample equals to 1
```python
from sklearn.preprocessing import Normalizer
```

- Scale with `Binarizer`

`Binarizer` turn numerical features into binary features, where any value above a threshold is 1 and any below is 0
```python
from sklearn.preprocessing import Binarizer
```

# Encode categorical features
```python
# Encode categorical data into integer values
from sklearn.preprocessing import LabelEncoder
encoding = LabelEncoder()
encoding.fit(dataset["CategoricalColumnName"].values)
encoded = encoding.transform(dataset["CategoricalColumnName"].values)
newColumns = encoded].T

from sklearn.preprocessing import OneHotEncoder
onehot = OneHotEncoder()
newColumns = onehot.fit_transform(newColumns).todense()
newDataset = np.hstack([dataset, newColumns])
```

# Split 
> Split dataset into train set and test set
```python
from sklearn.model_selection import train_test_split

'''
@test_size: proportion of the test split (default is 0.25)
@random_state: controls the shuffling applied to the data before the split -> Setting the random state will give the same split every time the same value is entered. It will look random, but the algo used is deterministic and the output will be consistent. To get truly random results that change every time you run, set random_state to None
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

decision_tree = DecisionTreeClassifier(random_state=100)
decision_tree.fit(X_train, Y_train)
Y_pred = decision_tree.predict(X_test)
```

# Random Forest aka Random Decision Forests
- An ensemble learning method for classification, regression, etc
- Operate by constructing a multitude of decision trees (eg: `n_estimators = 100`) at training times and output the class that is the mode of the class (classification) or mean prediction (regression) of the individual trees 
- Parameters
    - **n_estimators**: how many decision trees should be built. Higher value will take longer to run but will result in a higher accuracy. Default value = 100
    - **oob_score**: if true, the method is tested using samples that aren't in the random subsamples chosen for training the decision trees
    - **n_jobs**: specifies the # of cores to use when training the decision trees in parallel. Use *-1* for use all cores
    - **min_samples_split**: specifies how many samples are needed in order to create a new node in the Decision Tree &rightarrow; whether a decision node will be created
    - **min_samples_leaf**: specifies how many samples must be resulting from a node for it to stay &rightarrow; whether a decision node will be kept
    - **criterion**: decide which rule and value to use to split a node into subnodes. Value: "gini", "entropy"

```python
from sklearn.ensemble import RandomForestClassifier

random_forest = RandomForestClassifier(n_estimators=100)
random_forest.fit(X_train, Y_train)
Y_pred = random_forest.predict(X_test)
random_forest.score(X_train, Y_train)
```

# Pipeline
- Pipelines store the steps in your data mining workflow. They can take your raw data in, perform all the necessary transformations, and then create a prediction.
```python
from sklearn.pipeline import Pipeline

# Take a list of steps as input 
# All steps are Transformers while the last step needs to be an Estimator
# The input dataset is altered by each Transformer with the output of 1 step being the input of the next step
scaling_pipeline = Pipeline([('scale', MinMaxScaler()),
                             ('predict', KNeighborsClassifier())])

# pipelines has type `estimator` so we can use them in functions such as `cross_val_score`
scores = cross_val_score(scaling_pipeline, X, y, scoring='accuracy')                             
```

# Testing multiple parameters' values to tune model's parameters
- Use `GridSearchCV`
```python
# This example is testing on Random Forests

from sklearn.model_selection import GridSearchCV

# List out all params you want to try + the value to try
parameter_space = {
    "max_features": [2, 10, 'auto'],
    "n_estimators": [100, 200],
    "criterion": ["gini", "entropy"],
    "min_samples_leaf": [2, 4, 6],
}
clf = RandomForestClassifier(random_state=14)
grid = GridSearchCV(clf, parameter_space)
grid.fit(X_all, y_true)
print("Accuracy: {0:.1f}%".format(grid.best_score_ * 100))

# To see what parameters used, we can print out the best model that was found in the grid search
print(grid.best_estimator_)
```