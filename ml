KNEIGHBORS
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
from sklearn import datasets

# Load Iris dataset
iris = datasets.load_iris()
print("Iris Data set loaded...")

# Split dataset into training and testing
X_train, X_test, y_train, y_test = train_test_split(
    iris.data,
    iris.target,
    test_size=0.1
)

print("Dataset is split into training and testing...")
print("Size of training data and its label", X_train.shape, y_train.shape)
print("Size of test data and its label", X_test.shape, y_test.shape)

# Display class labels
for i in range(len(iris.target_names)):
    print("label", i, "-", str(iris.target_names[i]))

# Create and train KNN classifier
classifier = KNeighborsClassifier(n_neighbors=1)
classifier.fit(X_train, y_train)

# Predict test data
y_pred = classifier.predict(X_test)

print("Results of classification using KNN with k=1")

for r in range(len(X_test)):
    print(
        "Sample:", str(X_test[r]),
        "Actual label:", str(y_test[r]),
        "Predicted label:", str(y_pred[r])
    )

# Accuracy
print("Classification Accuracy:", classifier.score(X_test, y_test))

# Confusion Matrix and Classification Report
from sklearn.metrics import classification_report, confusion_matrix

print("Confusion Matrix:")
print(confusion_matrix(y_test, y_pred))

print("Accuracy Metrics:")
print(classification_report(y_test, y_pred))

NAIVE BAYES
from sklearn.naive_bayes import GaussianNB
from sklearn.datasets import load_iris
from sklearn import metrics
from sklearn.model_selection import train_test_split as split

# Load Iris dataset
dataset = load_iris()

x = dataset.data
y = dataset.target

# Split dataset into training and testing sets
x_train, x_test, y_train, y_test = split(
    x,
    y,
    test_size=0.2,
    random_state=1
)

# Create and train Gaussian Naive Bayes classifier
gnb = GaussianNB()
classifier = gnb.fit(x_train, y_train)

# Predict test data
y_pred = classifier.predict(x_test)

# Display results
print("Accuracy Metrics :")
print(metrics.classification_report(y_test, y_pred))

print("The accuracy of metrics is:",
      metrics.accuracy_score(y_test, y_pred))

print("Confusion matrix:")
print(metrics.confusion_matrix(y_test, y_pred))

SVM RANDOM
import numpy as np
import matplotlib.pyplot as plt

from sklearn.linear_model import LinearRegression
from sklearn.tree import DecisionTreeRegressor

# Generate data
x = np.linspace(0, 10, 100)

y_linear = 2 * x + 3 + np.random.randn(100) * 0.5
y_complex = np.sin(x) + np.random.randn(100) * 0.2

# Models
models = [
    LinearRegression(),
    DecisionTreeRegressor(max_depth=5)
]

for model in models:

    # Train on linear data
    model.fit(x.reshape(-1, 1), y_linear)
    y_pred_linear = model.predict(x.reshape(-1, 1))

    # Train on complex data
    model.fit(x.reshape(-1, 1), y_complex)
    y_pred_complex = model.predict(x.reshape(-1, 1))

    # Plot linear data
    plt.figure(figsize=(6, 2))
    plt.plot(x, y_linear, label='True Data (Linear)')
    plt.plot(x, y_pred_linear, label='Predicted')
    plt.legend()
    plt.show()

    # Plot complex data
    plt.figure(figsize=(6, 2))
    plt.plot(x, y_complex, label='True Data (Complex)')
    plt.plot(x, y_pred_complex, label='Predicted')
    plt.legend()
    plt.show()


SVM IRIS

import numpy as np
import matplotlib.pyplot as plt

from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score, confusion_matrix

# Load Iris dataset
iris = datasets.load_iris()

# Split dataset into training and testing sets
xtrain, xtest, ytrain, ytest = train_test_split(
    iris.data[:, :2],
    iris.target,
    test_size=0.3,
    random_state=42
)

# Feature scaling
scaler = StandardScaler()

xtrain = scaler.fit_transform(xtrain)
xtest = scaler.transform(xtest)

# Create and train SVM model
model = SVC(
    kernel='linear',
    C=2
)

model.fit(xtrain, ytrain)

# Predict test data
ypred = model.predict(xtest)

# Display results
print(f"Accuracy: {accuracy_score(ytest, ypred) * 100:.2f}%")
print("Confusion Matrix:")
print(confusion_matrix(ytest, ypred))


DECISION TREE ID3
# Import necessary libraries
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score, classification_report

# Load the Iris dataset
iris = load_iris()

X = iris.data
y = iris.target

# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.3,
    random_state=42
)

# Initialize the Decision Tree Classifier with entropy criterion (ID3)
clf = DecisionTreeClassifier(criterion='entropy')

# Train the classifier
clf.fit(X_train, y_train)

# Predict the labels for the test set
y_pred = clf.predict(X_test)

# Calculate and print the accuracy
accuracy = accuracy_score(y_test, y_pred)
print(f"Accuracy: {accuracy * 100:.2f}%")

# Print the classification report
print("\nClassification Report:")
print(classification_report(y_test, y_pred))

# Print the first 10 actual vs predicted labels
print("\nActual vs Predicted Labels for the First 10 Samples:")

for actual, predicted in zip(y_test[:10], y_pred[:10]):
    print(f"Actual: {actual}, Predicted: {predicted}")

ADA BOOST
from sklearn.ensemble import AdaBoostClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, classification_report

# Load dataset
iris = load_iris()

X = iris.data
y = iris.target

# Split data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.2,
    random_state=42
)

# Base learner (weak learner)
base_model = DecisionTreeClassifier(max_depth=1)

# AdaBoost model
ada_clf = AdaBoostClassifier(
    estimator=base_model,
    n_estimators=50,
    learning_rate=1.0,
    random_state=42
)

# Train the model
ada_clf.fit(X_train, y_train)

# Predict test data
y_pred_ada = ada_clf.predict(X_test)

# Evaluation
print("AdaBoost Accuracy:",
      accuracy_score(y_test, y_pred_ada))

print("\nClassification Report:")
print(
    classification_report(
        y_test,
        y_pred_ada,
        target_names=iris.target_names
    )
)

GRADIENT BOOST
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, classification_report

# Load dataset
iris = load_iris()

X = iris.data
y = iris.target

# Split data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.2,
    random_state=42
)

# Gradient Boosting model
gb_clf = GradientBoostingClassifier(
    n_estimators=100,
    learning_rate=0.1,
    max_depth=3,
    random_state=42
)

# Train the model
gb_clf.fit(X_train, y_train)

# Predict test data
y_pred_gb = gb_clf.predict(X_test)

# Evaluation
print(
    "Gradient Boosting Accuracy:",
    accuracy_score(y_test, y_pred_gb)
)

print("\nClassification Report:")
print(
    classification_report(
        y_test,
        y_pred_gb,
        target_names=iris.target_names
    )
)


LINEAR REGRESSION 

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Import dataset
dataset = pd.read_csv('Linear Regression.csv')

X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values

# Split the data into training and testing sets
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=1/3,
    random_state=0
)

# Fitting Linear Regression to training set
from sklearn.linear_model import LinearRegression

regressor = LinearRegression()
regressor.fit(X_train, y_train)

# Make predictions on the test set
y_pred = regressor.predict(X_test)

# Plot the training data, fitted line, and test data
plt.scatter(
    X_train,
    y_train,
    color='red',
    label='Training Data'
)

plt.plot(
    X_train,
    regressor.predict(X_train),
    color='blue'
)

plt.scatter(
    X_test,
    y_test,
    color='yellow',
    label='Test Data'
)

plt.plot(
    X_train,
    regressor.predict(X_train),
    color='blue'
)

plt.xlabel('Years')
plt.ylabel('Salary')
plt.title('Salary vs Years')
plt.legend()

plt.show()

LOGISTIC REGRESSION 
import numpy as np
import matplotlib.pyplot as plt

from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, confusion_matrix

# Load Iris dataset
iris = datasets.load_iris()

X = iris.data
y = iris.target

# Split dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.3,
    random_state=0
)

# Feature scaling
scaler = StandardScaler()

X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

# Create and train Logistic Regression model
model = LogisticRegression()

model.fit(X_train, y_train)

# Predict test data
y_pred = model.predict(X_test)

# Confusion Matrix
cm = confusion_matrix(y_test, y_pred)

print("Confusion Matrix:")
print(cm)

# Accuracy
accuracy = accuracy_score(y_test, y_pred)

print("Accuracy:", accuracy)

KMEANS
import matplotlib.pyplot as plt
from sklearn import datasets
from sklearn.cluster import KMeans
import pandas as pd
import numpy as np

# Import Iris dataset
iris = datasets.load_iris()

X = pd.DataFrame(iris.data)
X.columns = [
    'Sepal_Length',
    'Sepal_Width',
    'Petal_Length',
    'Petal_Width'
]

y = pd.DataFrame(iris.target)
y.columns = ['Targets']

# Build the K-Means Model
model = KMeans(n_clusters=3)

# Train the model
model.fit(X)

# Visualize the clustering results
plt.figure(figsize=(14, 14))

colormap = np.array([
    'red',
    'lime',
    'black'
])

# Plot the Original Classifications using Petal Features
plt.subplot(2, 2, 1)

plt.scatter(
    X.Petal_Length,
    X.Petal_Width,
    c=colormap[y.Targets],
    s=40
)

plt.title('Real Clusters')
plt.xlabel('Petal Length')
plt.ylabel('Petal Width')

plt.show()

# Plot the Model's Classifications
plt.subplot(2, 2, 2)

plt.scatter(
    X.Petal_Length,
    X.Petal_Width,
    c=colormap[model.labels_],
    s=40
)

plt.title('K-Means Clustering')
plt.xlabel('Petal Length')
plt.ylabel('Petal Width')

plt.show()

EM ALGORITHM 

import matplotlib.pyplot as plt
from sklearn import datasets
from sklearn.cluster import KMeans
import pandas as pd
import numpy as np

# Import Iris dataset
iris = datasets.load_iris()

X = pd.DataFrame(iris.data)
X.columns = [
    'Sepal_Length',
    'Sepal_Width',
    'Petal_Length',
    'Petal_Width'
]

y = pd.DataFrame(iris.target)
y.columns = ['Targets']

# Build the K-Means Model
model = KMeans(n_clusters=3)

# model.labels_ gives cluster number for each sample
model.fit(X)

# Visualize the clustering results
plt.figure(figsize=(14, 14))

colormap = np.array([
    'red',
    'lime',
    'black'
])

# General EM for GMM
from sklearn import preprocessing

# Standardize the data
scaler = preprocessing.StandardScaler()
scaler.fit(X)

xsa = scaler.transform(X)

xs = pd.DataFrame(
    xsa,
    columns=X.columns
)

# Gaussian Mixture Model (EM Algorithm)
from sklearn.mixture import GaussianMixture

gmm = GaussianMixture(n_components=3)

gmm.fit(xs)

gmm_y = gmm.predict(xs)

# Plot GMM Clustering
plt.subplot(2, 2, 3)

plt.scatter(
    X.Petal_Length,
    X.Petal_Width,
    c=colormap[gmm_y],
    s=40
)

plt.title('GMM Clustering')
plt.xlabel('Petal Length')
plt.ylabel('Petal Width')

plt.show()

print(
    'Observation: The GMM using EM algorithm based clustering '
    'matched the true labels more closely than the K-Means.'
)

PCA
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

%matplotlib inline

from sklearn.datasets import load_breast_cancer

# Load Breast Cancer dataset
cancer = load_breast_cancer()

# Display dataset keys
cancer.keys()

# Display feature names
print(cancer['feature_names'])

# Display target labels
for i in range(len(cancer.target_names)):
    print("Label", i, "-", str(cancer.target_names[i]))

# Display dataset description
print(cancer['DESCR'])

# Create DataFrame
df = pd.DataFrame(
    cancer['data'],
    columns=cancer['feature_names']
)

# Display first 5 rows
df.head(5)

# Feature Scaling
from sklearn.preprocessing import MinMaxScaler
from sklearn.preprocessing import StandardScaler

scaler = StandardScaler()

scaler.fit(df)

scaled_data = scaler.transform(df)

# Apply PCA
from sklearn.decomposition import PCA

pca = PCA(n_components=2)

pca.fit(scaled_data)

x_pca = pca.transform(scaled_data)

# Display shapes
print("Original Data Shape:", scaled_data.shape)
print("Reduced Data Shape:", x_pca.shape)

# Scatter Plot of Principal Components
plt.figure(figsize=(8, 6))

plt.scatter(
    x_pca[:, 0],
    x_pca[:, 1],
    c=cancer['target']
)

plt.xlabel('First Principal Component')
plt.ylabel('Second Principal Component')

plt.title('PCA of Breast Cancer Dataset')

plt.show()

AND
def activation(out, threshold):
    if out >= threshold:
        return 1
    else:
        return 0


def perceptron(and_input):

    a = [0, 0, 1, 1]
    b = [0, 1, 0, 1]
    y = [0, 0, 0, 1]

    w = [1.4, 1.5]

    threshold = 1
    learning_rate = 0.1

    i = 0

    print("Perceptron Training : ")
    print("######################")
    print("------------")

    while i < 4:

        summation = a[i] * w[0] + b[i] * w[1]

        o = activation(summation, threshold)

        print("Input : " + str(a[i]) + " , " + str(b[i]))
        print("Weights : " + str(w[0]) + " , " + str(w[1]))
        print(
            "Summation : " + str(summation) +
            " Threshold : " + str(threshold)
        )
        print(
            "Actual Output : " + str(y[i]) +
            " Predicted Output : " + str(o)
        )

        if o != y[i]:

            print("____________\nUpdating Weights")

            w[0] = w[0] + learning_rate * (y[i] - o) * a[i]

            print("w[0] =", w[0])

            w[1] = w[1] + learning_rate * (y[i] - o) * b[i]

            print(
                "Updated Weights : " +
                str(w[0]) + " , " + str(w[1])
            )

            i = -1

            print("\nWeights Updated Training Again : ")
            print("###################################")

        i = i + 1

        print("---------------")

    summation = and_input[0] * w[0] + and_input[1] * w[1]

    return activation(summation, threshold)


and_input = [1, 1]

print(
    "AND Gate Output for " +
    str(and_input) +
    " : " +
    str(perceptron(and_input))
)

OR

def activation(out, threshold):
    if out >= threshold:
        return 1
    else:
        return 0


def perceptron(or_input):

    a = [0, 0, 1, 1]
    b = [0, 1, 0, 1]
    y = [0, 1, 1, 1]

    w = [0.0, 0.3]

    threshold = 0.4
    learning_rate = 0.5

    i = 0

    print("Perceptron Training : ")
    print("######################")
    print("------------")

    while i < 4:

        summation = a[i] * w[0] + b[i] * w[1]

        o = activation(summation, threshold)

        print("Input : " + str(a[i]) + " , " + str(b[i]))
        print("Weights : " + str(w[0]) + " , " + str(w[1]))
        print(
            "Summation : " + str(summation) +
            " Threshold : " + str(threshold)
        )
        print(
            "Actual Output : " + str(y[i]) +
            " Predicted Output : " + str(o)
        )

        if o != y[i]:

            print("____________\nUpdating Weights")

            w[0] = w[0] + learning_rate * (y[i] - o) * a[i]

            print("w[0] =", w[0])

            w[1] = w[1] + learning_rate * (y[i] - o) * b[i]

            print(
                "Updated Weights : " +
                str(w[0]) + " , " + str(w[1])
            )

            i = -1

            print("\nWeights Updated Training Again : ")
            print("###################################")

        i = i + 1

        print("---------------")

    summation = or_input[0] * w[0] + or_input[1] * w[1]

    return activation(summation, threshold)


or_input = [1, 1]

print(
    "OR Gate Output for " +
    str(or_input) +
    " : " +
    str(perceptron(or_input))
)


