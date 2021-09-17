# Overview
> Data Mining = Knowledge mining from data i.e. Knowledge discovery from data (KDD). Data mining provides a way for a computer to learn how to make decisions with data (eg: predict tomorrow's weather, blocking spam email)

## Steps
1. **Data cleaning**: to remove noise and inconsistent data
2. **Data integration**: where multiple data sources may be combined
3. **Data selection**: data relevant to the analysis task are retrieved from the database
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


# Some keywords
### 1. Estimators
> A common, lightweight interface for classifiers to follow &rightarrow; allows for the standardized implementation and testing of algorithms. 

Estimators must have the 2 functions
- `fit()`: This function performs the training of the algo - setting the values of internal parameters. `fit()` takes 2 inputs, the training sample dataset and the corresponding classes for those samples.
- `predict()`: Give the class of the testing samples when we provide only the input. 