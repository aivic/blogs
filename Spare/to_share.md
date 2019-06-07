## Introduction
In this guide, you will learn about the core library to perform operations related to the field of mathematics, science and engineering. 

By the end of this guide you'll be able to learn about the following:


1. What is SciPy? 
2. Basic Operations in SciPy 
3. Frequently used subpackages

## The Baseline
Throughout this guide, we will be using the following libraries:


```python
import numpy as np
import scipy as sp
```

## What is SciPy?
SciPy, or Scientific Python, is a python library which extends the functionality of the NumPy library. It adds significant power to the interactive Python session by providing the user with high-level commands and classes for manipulating and visualizing data. With SciPy an interactive Python session becomes a data-processing and system-prototyping environment rivaling systems such as MATLAB, IDL, Octave, R-Lab, and SciLab.

The additional benefit of basing SciPy on Python is that this also makes a powerful programming language available for use in developing sophisticated programs and specialized applications. Scientific applications using SciPy benefit from the development of additional modules in numerous niches of the software landscape by developers across the world. Everything from parallel programming to web and data-base subroutines and classes have been made available to the Python programmer. All of this power is available in addition to the mathematical libraries in SciPy. 

The structure of SciPy is defined based on the various sub-packages where each sub-package covers different scientific computing domains. Here's the list of various sub-packages along with a brief description.

|**Subpackage**| **Description**|
| --- | --- |
| cluster | Clustering algorithms |
| constants | Physical and mathematical constants |
| fftpack | Fast Fourier Transform routines |
| integrate | Integration and ordinary differential equation solvers |
| interpolate| Interpolation and smoothing splines|
|io |Input and Output|
|linalg|Linear algebra|
|ndimage|N-dimensional image processing|
|odr|Orthogonal distance regression|
|optimize|Optimization and root-finding routines|
|signal|Signal processing|
|sparse|Sparse matrices and associated routines|
|spatial|Spatial data structures and algorithms|
|special|Special functions|
|stats|Statistical distributions and functions|

To know more about each of the above subpackages, you can refer to the following webpage.

> [SciPy Organization Guide](http://scipy.github.io/devdocs/tutorial/general.html#scipy-organization)

Now, we have observed what is SciPy and what it constitutes. Now, let us learn to install it using two ways:


1. Using pip
2. Using Linux package manager

Usually, it is advised to go for [Anaconda](https://www.anaconda.com/distribution/) installation as it already has SciPy and other important libraries pre-installed for you. However, you can still install SciPy using given methods.

### 1. Installing SciPy using Pip
To install SciPy using pip, you first need to ensure that you have python as well as pip installed in your system. Later, you need to run the following command in the command prompt or Anaconda prompt (for Anaconda users).


```
python -m pip install --user numpy scipy matplotlib ipython jupyter pandas sympy
```

This will install not only SciPy but also NumPy, matplotlib, ipython, jupyter, pandas and sympy. Using`--user` while installing makes the current installation to happen only for the current local user and doesn't write to the system directories.

### 2. Installing SciPy using Linux Package Manager
If you're using an Ubuntu/Debian Linux distribution, then installing SciPy can be done using the terminal with given command:


```
sudo apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy
```

This command again installs SciPy along with other important libraries.

To install SciPy for Fedora, Mac or using other ways, you can refer to the following link:

> [Installing SciPy](https://scipy.org/install.html)


## Basic Operations in SciPy
As we have mentioned earlier, SciPy extends the functionality of the NumPy module. Most of the basic operations are performed using NumPy methods. Let us discuss some of the important methods used in the following topics:


1. Indexing
2. Polynomials
3. Vectorizing
4. Others


### 1. Indexing
We are well familiar with the common python indexing which is used in subsetting a NumPy array using the `:` operator. Let us learn few other methods to perform indexing based on `np.r_`, `np.c_`, `np.mgrid` and `np.ogrid`.

The `np.r_` and `np.c_` methods helps to concatenate row-wise and column-wise. The functionality for both the methods is also different in the case of 1-D data. Let us learn it practically.


```python
## One dimensional data
arr = [5, 9, 8]

# np.r_
print(np.r_[arr].shape)

# Output: (3,)

# np.c_
print(np.c_[arr].shape)

# Output: (3,1)

## Two-dimensional data
mat = [[1, 2], [3, 4]], [[5, 6], [7, 8]]

# np.r_
print(np.r_[mat])

# Output:
# [[1 2]
#  [3 4]
#  [5 6]
#  [7 8]]

# np.c_
print(np.c_[mat])

# Output:
# [[1 2 5 6]
#  [3 4 7 8]]
```

The next two methods `mgrid` and `ogrid` helps to create a mesh and can be treated as a better alternative to `arange` as shown:


```python
np.mgrid[0:3,0:2]

# Output:
# array([[[0, 0],
#         [1, 1],
#         [2, 2]],

#        [[0, 1],
#         [0, 1],
#         [0, 1]]])

np.ogrid[0:3,0:2]

# Output:
# [array([[0],
#         [1],
#         [2]]), array([[0, 1]])]
```

### 2. Polynomials
The polynomials are handled using the `poly1d` class from the NumPy module. You can create a polynomial, perform basic mathematical operations like add, subtract, etc. as well as do complex operations including differentiation and integration as shown here:


```python
# Creating a base polynomial of the form x^2 + 2x + 3
p = np.poly1d([1, 2, 3])

# Subtracting p with a new poly of the form x^2 -2x + 3
p - np.poly1d([1, -2, 3])

# This gives us a polynomial of the form 4x + 0 
# as represented by the output poly1d([4, 0])

# Performing first differentiation of polynomial p
p.deriv()

# This results in the polynomial of the form 2x + 2

# Performing integration of the polynomial p
p.integ()

# This results in the polynomial of the form
# 0.333x^3 + x^2 + 3x + 0
```

### 3. Vectorizing

NumPy also provides an important method named as `vectorize` which converts a python scalar function to a vectorized format with the same broadcasting rules as other NumPy functions (i.e. the Universal functions, or ufuncs). Let us take an example to understand it:


```python
# Defining a common python function
def dosomething(arg1, arg2):
    if arg1 > 0:
        return arg1 * arg2
    else:
        return arg1 - arg2

# Normally if we pass a python scalar to the above 
# function, it returns a scalar as shown

print(dosomething(5, 10))

# Output: 50

# However, we can use the same function with the 
# ability of vectorization as shown

vectorized_func = np.vectorize(dosomething)

vectorized_func([2, -1, 3], [6, 9, 1])

# which results in a vector array([ 12, -10,   3])
```

### 4. Others

There are many other important functions avialable inside NumPy. We shall end with another main method termed as `select`. You may have wondered how to establish a `if-elif-else` ladder while performing vectorization. The `select` method does this for you. It takes an element, checks it with first condition, if the first condition is failed it goes with next condition and so on. Whenever a condition is passed the corresponding output is returned. The syntax and code clarifies it further:

**Syntax**


1. Vector
2. Multiple conditions: [if, elif, elif, ..., else]
3. Corresponding output: [Out1, Out2, Out3, ..., OutN]


```python
# Initializing input vector
x = np.arange(10)

# Multiple conditions ladder
multiple_cond = [x<3, x == 4, x>5]

# Corresponding output
corresponding_out = [x, 3*x, 2*x]

# select method
np.select(multiple_cond, corresponding_out)

# Output:
# array([ 0,  1,  2,  0, 12,  0, 12, 14, 16, 18])
```

## Frequently Used Subpackages
We have referenced all the subpackages by which SciPy module is organized. However, to learn specifically for few of the most important packages, you can refer the below links:

1. [Working with SciPy Linear Algebra Module]()
2. [Working with SciPy Stats Module]()
3. [Learning to Optimize with SciPy]()
4. [Multi-dimensional Image Processing using SciPy]()

## Conclusion
In this guide, you have learned about the definition, organization and basic operations of SciPy. 
