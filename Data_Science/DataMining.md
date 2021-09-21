# Overview
> Data Mining = Knowledge mining from data i.e. Knowledge discovery from data (KDD). Data mining provides a way for a computer to learn how to make decisions with data (eg: predict tomorrow's weather, blocking spam email)

## Steps
1. **Data cleaning**: to remove noise and inconsistent data
2. **Data integration**: where multiple data sources may be combined
3. **Data selection**: data relevant to the analysis task are retrieved from the database (Feature engineering) &rightarrow; choosing good features is key to getting good outcomes
4. **Data transformation**: data are transformed and consolidated into forms appropriate for mining by performing summary or aggregation operations
5. **Data mining**: intelligent methods are applied to extract data patterns
6. **Pattern evaluation**: identify truly interesting patterns representing knowledge based on *interesting measures*
7. **Knowledge presentation**: visualization and knowledge representation techniques are used to present mined knowledge to users

## Kind of data to mine
- Database data
- Data warehouses
    - A repo of info collected from multiple sources stored under a unified schema called a **data cube** -> mutidimensional view of data + fast access of summarized data
- Transactional data
    - Transactional database contains transactions such as purchases, booking, user clicks as rows    
- Other: time-relatied or sequence data, spatial data, graph, etc.

## Tasks
2 type: descriptive & predictive
- Descriptive: characterize properties of data
- Predictive: perform induction on the current data to make predictions

## Functionalities
> Specify kind of patterns found in data mining tasks
### 1. Characterization and discrimination
- Characterization: summarization of general characteristics
- Discrimination: comparision of the general features of the target class data objs against the general features of objs from 1 or multiple contrasting classes
    - eg: compare buyes who buy computer products regularly (> 2/month) vs. those who rarely buy computer products (< 3/year) -> may reveal discrminative features such as income level, education level, etc.

### 2. Mining of frequent patterns, associations, and regression
Frequent pattern = patterns occur frequently in data -> **to discover associations and correlations within data**
- Frequent itemset: set of items often appear together in a transactional dataset
    - eg: milk and bread are frequently bought together
- Frequent subsequences
    - eg: customer tend to by a laptop followed by a digital camera
- Frequent substructures: substructure such as graphs or trees that combined with itemsets or subsequences occurs frequently

### 3. Classification and regression for predictive analysis
Find a model (or function) that decribes and distinguishes data classes or concepts
- Classification model predicts categorical data
- Regression model predicts numerical values
- The derived model maybe represented as decision tress, math formulae or neural networks
- Methods for constructing classification models: naive Bayesian, SVM, KNN

### 4. Clustering analysis
Used to generate class labels for group of data by clustering/grouping objs based on the principle of *maximizing the intraclass similarity and minimizing the interclass similarity*

Note: good for **taxonomy formation** aka the organization of observations into a hierarchy of classes that group similar events together

### 5. Outlier analysis i.e. Anomaly mining
eg: uncover fraudulent usage of credit cards by detecting unusually large amounts purchases

---
# Feature-based normalization 
---

# Affinity analysis
> Type of data mining that gives similarity between samples. This falls under *Mining of frequent patterns, associations, and regression*

eg: 
- **Users** on a website to provide varied services or targeted advertising
- **Items** to sell to the users to provide recommended movies or products
- **Human genes** to find people that share the same ancestors

# Classification
> We have a single variable that we're interested in that we call the **class** + we have a set of samples that represent objects we're interested in classifying.

The goal of classification apps is to train a model on a set of samples with known classes and then apply that model to new unseen samples with unknown classes.

eg:
- Determining the species of a plant by looking at its measurement. The class vlaue here would be: Which species is this?
- Determining if an image contains a dog. The class would be: Is there a dog in this image?
- Determining if a patient has cancer based on the resutls of a specific test. The class would be: Does this patient have cancer?

### 1. Nearest Neighbors
> Take the most similar samples, and predict the same class that the these nearby samples have. This vote is often a simple count, although more complicated methods such as weighted voting do exist

- Cons
  - Computationally expensive to compute the distance between all pairs of samples even though some complex methods exist to improve this speed
  - Can do poorly in **categorical-based datsets** with categorical features. The issue is due to the difficulty in comparing differences in categorical values, sth better left to an algo that gives weight to each feature's importance. (Note: comparing categorical features can be done with some distance metrics or pre-processing steps such as one hot encoding)
- Distance metrics
  - To answer question: Are these two samples more similar than the other two?
  - Common distance: Euclidean, Manhattan, Cosin
    - Euclidean distance: real-world distance between 2 objs
      - Pros: Intuitive
      - Cons: Poor accuracy if some features have larger values than a value of 0 (known as sparse matrix). When dataset have many features, the distance between random samples converges due to the *curse of dimensionality* -> hard to compare samples as the distances are always nearly the same.
    - Manhattan distance
      - Pros: Poor accuracy in case of sparse matrix but not as bad as Euclidean distance. Not too bad when dataset have many features.
      - Cons: If some features have very large values, it can *overrule* the similarity in other features (eg: if feature A has values between 1 and 2, and feature B has values between 1K - 2K &rightarrow; feature A unlikely have any impact on the result) &rightarrow; can address this problem with normalization
    - Cosine distance
      - Pros: Good for comparing items with many features such as text mining
      - Cons: Discards some info about the length of the vector (which is useful in some cases)

### 2. Decision Trees
- Advantages: Readable by humans, work with a variety of features (including categorical)
> FYI: There are many algo for creating decision trees. Many of these algos are iterative. They start at the base node and decide the best feature to use for the first decision, then go to each node and choose the next best feature, and so on. This process is stopped at a certain point when it's decided that nothing more can be gained from extending the tree further. The `scikit-lear` package implements the **Classification and Regression Trees (CART)** algo as its default Decision tree class which can use both categorical and continuous features.

- Stopping criterion
> Def: When the tree building is nearly completed, the final few decisions can often be somewhate arbitrary and rely on only a small # of smaples to make their decision. Using such nodes can result in trees that *overfit* the training data. Instead, a stopping criterion can be used to ensure that the Decision Tree does not reach this point.
> 
> In `scikit-learn` we have 2 options 
> - **min_samples_split**: specifies how many samples are needed in order to create a new node in the Decision Tree &rightarrow; whether a decision node will be created
> - **min_samples_leaf**: specifies how many samples must be resulting from a node for it to stay &rightarrow; whether a decision node will be kept

- Pruning
> Def: Instead of a stopping criterion, the tree could be created in full and then trimmed. The trimming process (pruning) removes nodes that do not provide much info to the overall process

- Criterion for creating a decision: decide which rule and value to use to split a node into subnodes
  - Gini impurity: measure of how often a decision node would incorrectly predict a sample's class
  - Information gain: this uses information-theory-based entropy to indicate how musch extra info is gained by the decision node
> In `scikit-learn`, `criterion {"gini", "entropy"}, default="gini"`

### 3. Random Forests
A single Decision Tree can learn quite complex functions. However, decision trees are prone to overfitting &rightarrow; create many decision trees and ask each to predict the class value, and then take a majority vote and use that answer as the overall prediction.

Decisions trees is an algo with a high variance &rightarrow; random forests averaging a large # of decision trees which greatly reduced this variance

- Cons: Increase in time

How to build a random forest
- Since we only have 1 training dataset, which means our input and output will be the same if we try to build multiple trees &rightarrow; choose a random subsample of the dataset to create new training sets (*This processing is called **bagging***)
- When creating many decision trees from similar data, the features that are used for the first few decision nodes in the trees tend to be similar &rightarrow; choose a random subset of the features to perform our data splits on
> Def: Random forests are randomly built trees using randomly chosen samples using randomly chosen features.

# Some keywords
### 1. Estimators
> A common, lightweight interface for classifiers to follow &rightarrow; allows for the standardized implementation and testing of algorithms. 

Estimators must have the 2 functions
- `fit()`: This function performs the training of the algo - setting the values of internal parameters. `fit()` takes 2 inputs, the training sample dataset and the corresponding classes for those samples.
- `predict()`: Give the class of the testing samples when we provide only the input. 

### 2. Cross-fold validation
Problem: What if our models perform poor/well due to an unlucky/lucky split of the data
> Def: A framework to address the problem of choosing a single testing set. This is a standard *best-practice* in data mining.

The process works by doing many experiments with different training and testing splits, but using each sample in a testing set only once (to reduce the likelihood of choosing lucky testing sets).
- Step 1: Split the entire dataset into several sections called folds
- Step 2: For each fold
  - Set the fold aside as the current testing set
  - Train the algo on the remaining folds
  - Evaluate on the current testing set
- Step 3: Report on all the evaluation scores, including the average score

It's natural for variation in results when performing data mining due to variation in how the folds are created and randomness inherent in some classification algos.

It's a good idea to rerun experiments multiple times to get a sense of the average result and the spread of the results (the mean and stadard deviation) across all experiments.

### 3. Pipeline
> Def: Pipelines store the steps in your data mining workflow. They can take your raw data in, perform all the necessary transformations, and then create a prediction. 

### 4. Variance
> Def: Error introduced by variations in the training dataset on the algorithm.

Algos with a high variance (such as decision trees) can be greatly affected by variations to the training dataset. &rightarrow; models have the problem of overfitting

Eg: A classifier that always predicts randomly would have a very high variance

### 5. Bias
> Def: Error introduced by assumptions in the algo rather than anything to do with the dataset. Eg: if we has an algo that presumed that all features would be normally distributed, then the algo may have a higher error if the features were not.

Eg: A classifier that always predicts true regardless of input has a very high bias.
