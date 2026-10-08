# R Introduction

R is a **programming language and environment designed primarily for statistics, data analysis, visualization, and scientific computing**.

If Python is often thought of as a **general-purpose language that became extremely important in AI/data science**, R was much more directly designed around **statistics and data analysis**.

---

## 1. What is R?

R was created by **Ross Ihaka and Robert Gentleman** at the University of Auckland in New Zealand. Its first public release was in **1995**.

The name **R** comes from the first names of its creators, and it is also a play on **S**, the statistical programming language that strongly influenced R.

The basic idea is:

```text
R
│
├── Statistics
├── Data analysis
├── Data visualization
├── Scientific computing
└── Statistical research
```

R became particularly important in:

* statistics
* academic research
* economics
* bioinformatics
* epidemiology
* social sciences
* data visualization
* machine learning
* quantitative analysis

---

# 2. A simple R program

The classic first program is:

```r
print("Hello, World!")
```

You can also simply write:

```r
"Hello, World!"
```

and R will display the value.

Arithmetic is straightforward:

```r
2 + 3
10 * 20
100 / 4
```

---

# 3. Variables

You can assign values using `<-`:

```r
name <- "Mike"
age <- 25
height <- 1.75
```

You will also see `=`:

```r
age = 25
```

but `<-` is traditionally idiomatic R.

For example:

```r
x <- 10
y <- 20

x + y
```

---

# 4. R is dynamically typed

Like Python, R doesn't require you to declare a variable's type.

```r
x <- 10
```

Later:

```r
x <- "Hello"
```

The object referred to by `x` has changed from a numeric value to a character value.

You can inspect an object's type/class:

```r
class(x)
```

For example:

```r
x <- 10
class(x)
```

produces something like:

```text
"numeric"
```

---

# 5. R's most important concept: vectors

This is one of the biggest differences between R and many general-purpose languages.

R is fundamentally designed around **data vectors**.

```r
scores <- c(90, 85, 78, 92, 88)
```

Here:

```text
scores
   │
   ├── 90
   ├── 85
   ├── 78
   ├── 92
   └── 88
```

You can perform operations on the entire vector:

```r
scores + 5
```

producing:

```text
95 90 83 97 93
```

You don't normally need to write a loop.

This is called **vectorized computation**.

---

# 6. Vectorization

Suppose:

```r
x <- c(1, 2, 3, 4, 5)
```

You can write:

```r
x * 2
```

and get:

```text
2 4 6 8 10
```

You can calculate:

```r
mean(x)
```

```text
3
```

and:

```r
sum(x)
```

```text
15
```

This style is extremely natural for statistical programming.

---

# 7. R's basic data structures

R has several important data structures.

```text
R data structures
       │
       ├── Vector
       ├── Matrix
       ├── Array
       ├── List
       ├── Factor
       └── Data frame
```

The **data frame** is especially important.

---

# 8. Data frames

A data frame is essentially a table.

```r
students <- data.frame(
    name = c("Alice", "Bob", "Charlie"),
    age = c(20, 21, 19),
    score = c(90, 85, 92)
)
```

It looks conceptually like:

```text
name       age   score
----------------------
Alice       20     90
Bob         21     85
Charlie     19     92
```

You can access columns:

```r
students$name
```

or:

```r
students$score
```

This is one of the foundations of R's data-analysis model.

---

# 9. Data frames and SQL tables

There is a useful analogy:

```text
SQL table
     ↕
R data frame
```

For example, SQL:

```sql
SELECT name, score
FROM students
WHERE score >= 90;
```

R can perform the corresponding data manipulation.

With modern R, a very popular approach is the **tidyverse** ecosystem.

For example, using `dplyr`:

```r
library(dplyr)

students |>
    filter(score >= 90) |>
    select(name, score)
```

This produces the students whose scores are at least 90.

---

# 10. Functions

R supports functions naturally.

```r
add <- function(a, b) {
    a + b
}
```

Then:

```r
add(10, 20)
```

returns:

```text
30
```

Notice that R functions return the value of the final expression automatically.

You could also write:

```r
add <- function(a, b) {
    return(a + b)
}
```

but explicit `return()` isn't always necessary.

---

# 11. Control flow

R has familiar control structures.

### if

```r
age <- 20

if (age >= 18) {
    print("Adult")
} else {
    print("Minor")
}
```

### for

```r
for (i in 1:5) {
    print(i)
}
```

### while

```r
i <- 1

while (i <= 5) {
    print(i)
    i <- i + 1
}
```

However, R programmers often prefer vectorized operations over explicit loops when appropriate.

---

# 12. Statistics are built into the language

This is where R becomes particularly interesting.

Suppose:

```r
scores <- c(90, 85, 78, 92, 88)
```

You can immediately calculate:

```r
mean(scores)
median(scores)
sd(scores)
min(scores)
max(scores)
sum(scores)
```

You can also perform statistical tests.

For example:

```r
t.test(scores)
```

R was designed with this kind of work in mind.

---

# 13. Data visualization

R is famous for visualization.

The most important visualization ecosystem is probably **ggplot2**.

For example:

```r
library(ggplot2)

ggplot(students, aes(x = age, y = score)) +
    geom_point()
```

This creates a scatter plot.

The basic idea is:

```text
data
  +
aesthetic mappings
  +
geometric objects
  ↓
visualization
```

For example:

```r
ggplot(data, aes(x = age, y = score)) +
    geom_point()
```

means roughly:

> Take this data, map age to the x-axis and score to the y-axis, and draw points.

This is one of R's most influential contributions to modern data visualization.

---

# 14. R packages

R has a huge package ecosystem.

The main package repository is **CRAN**.

You can install a package:

```r
install.packages("ggplot2")
```

Then load it:

```r
library(ggplot2)
```

Popular R packages include:

```text
ggplot2       visualization
dplyr         data manipulation
tidyr         data cleaning
readr         data import
stringr       string processing
lubridate     dates and times
purrr         functional programming
tidyverse     collection of data-science packages
data.table    high-performance data manipulation
```

---

# 15. The tidyverse

The **tidyverse** is a particularly important part of modern R.

Conceptually:

```text
                  tidyverse
                      │
       ┌──────────────┼──────────────┐
       │              │              │
     dplyr          tidyr         ggplot2
       │              │              │
   transform       reshape       visualize
     data            data           data
```

A typical R data-analysis workflow might be:

```text
Import data
    ↓
Clean data
    ↓
Transform data
    ↓
Analyze data
    ↓
Visualize data
    ↓
Statistical model
    ↓
Report results
```

R is extremely good at this workflow.

---

# 16. R and machine learning

R can also perform machine learning.

Popular packages include:

```text
caret
tidymodels
randomForest
xgboost
e1071
```

For example, R can perform:

* linear regression
* logistic regression
* decision trees
* random forests
* support vector machines
* clustering
* neural networks
* time-series analysis

However, modern AI/deep-learning development is much more heavily centered around Python.

---

# 17. R and Python

This is one of the most useful comparisons.

|                        | R                    | Python                      |
| ---------------------- | -------------------- | --------------------------- |
| Original focus         | Statistics           | General-purpose programming |
| Data analysis          | **Excellent**        | Excellent                   |
| Statistics             | **Excellent**        | Excellent                   |
| Visualization          | **Excellent**        | Excellent                   |
| Machine learning       | Excellent            | **Excellent**               |
| Deep learning          | Good                 | **Excellent**               |
| AI ecosystem           | Good                 | **Excellent**               |
| Web development        | Possible             | **Excellent**               |
| Automation             | Good                 | **Excellent**               |
| General software       | Possible             | **Excellent**               |
| Scientific computing   | Excellent            | Excellent                   |
| Academic statistics    | **Extremely strong** | Strong                      |
| Syntax                 | Specialized          | General-purpose             |
| Main package ecosystem | CRAN                 | PyPI                        |

A useful mental model is:

```text
Python
   ↓
general-purpose programming
        +
data / AI / automation


R
   ↓
statistics / data analysis
        +
visualization / research
```

But there is considerable overlap.

---

# 18. R vs Python: a deeper conceptual difference

This is particularly important given your interest in programming-language history.

Python's fundamental abstraction is closer to:

```text
objects
functions
modules
classes
```

while R's fundamental abstraction is much more oriented toward:

```text
vectors
data
statistical operations
models
visualization
```

For example, in Python:

```python
numbers = [1, 2, 3, 4, 5]
```

In R:

```r
numbers <- c(1, 2, 3, 4, 5)
```

But then R naturally encourages:

```r
numbers * 2
```

to mean:

```text
[1,2,3,4,5] × 2
       ↓
[2,4,6,8,10]
```

This **vector-oriented design** is central to understanding R.

---

# 19. R and S

Historically, R's lineage is important:

```text
Statistics
    │
    ▼
     S
    │
    ▼
    R
```

The S language was developed at Bell Labs in the 1970s and 1980s for statistical computing.

R was strongly influenced by S and eventually became the dominant open-source implementation/ecosystem associated with that style of statistical programming.

So you can think of:

```text
S → R
```

as somewhat analogous to a language lineage rather than R being an unrelated new language.

---

# 20. R and Lisp

There is also an interesting connection to your previous exploration of programming languages.

R has several characteristics associated with the **functional programming tradition**.

Functions are first-class:

```r
f <- function(x) {
    x * 2
}
```

You can pass functions around:

```r
sapply(1:5, f)
```

R also has concepts such as:

* closures
* lexical scoping
* higher-order functions
* lazy evaluation
* functional programming

So although R is primarily associated with statistics, it is also an interesting language from a programming-language perspective.

---

# 21. RStudio

Although R itself is a programming language/environment, many people use it through **RStudio** (now part of Posit).

A typical RStudio environment looks conceptually like:

```text
┌─────────────────────────────────────┐
│             RStudio                 │
├──────────────────┬──────────────────┤
│                  │                  │
│     Source       │   Environment    │
│                  │   / History      │
├──────────────────┼──────────────────┤
│                  │                  │
│     Console      │   Files / Plots  │
│                  │   Packages       │
└──────────────────┴──────────────────┘
```

This provides an IDE-like environment for:

* writing R
* running code
* inspecting data
* viewing plots
* managing packages
* creating reports

---

# 22. R Markdown and Quarto

One of R's particularly interesting features is its integration with **reproducible research**.

You can combine:

```text
explanation
+
R code
+
results
+
charts
+
tables
```

into a single document.

For example:

```text
Research Report

Introduction
    ↓
Data
    ↓
R code
    ↓
Statistical analysis
    ↓
Charts
    ↓
Conclusion
```

Tools such as **R Markdown** and **Quarto** make this possible.

This is extremely popular in research and data analysis.

---

# 23. R's typical workflow

A typical R analyst might do:

```text
              Raw data
                 │
                 ▼
             readr / DB
                 │
                 ▼
             tidy data
                 │
                 ▼
              dplyr
                 │
                 ▼
            statistical
              analysis
                 │
          ┌──────┴──────┐
          ▼             ▼
       ggplot2       statistical
       charts          models
          │             │
          └──────┬──────┘
                 ▼
          Report / Paper
```

This explains why R became so important in academia.

---

# 24. R's strengths

### 1. Statistics

R has an exceptionally rich statistical ecosystem.

### 2. Data manipulation

Data frames and packages such as `dplyr` make data transformation convenient.

### 3. Visualization

`ggplot2` and the broader visualization ecosystem are major strengths.

### 4. Research

R is heavily used in universities and scientific research.

### 5. Statistical modeling

Many sophisticated statistical techniques are readily available.

### 6. Reproducible analysis

R Markdown and Quarto allow code, results, charts, and explanations to live together.

---

# 25. R's weaknesses

R isn't the best tool for every kind of software.

### General-purpose application development

Python, Java, C#, C++, etc. are generally more natural choices for large general-purpose applications.

### Web backend

R can serve web applications, but Python, Java, JavaScript/TypeScript, C#, etc. are much more common.

### General software engineering

R's ecosystem and language design are optimized around data/statistics rather than conventional large-scale application development.

### AI

Python has become much more dominant in modern deep learning and generative AI.

---

# 26. R in the programming-language landscape

You can place R roughly here:

```text
                  Programming Languages
                         │
       ┌─────────────────┼──────────────────┐
       │                 │                  │
   Systems            General            Specialized
       │             Purpose              │
       │                 │          ┌───────┴────────┐
      C                Python       │                │
      C++              Java         R             MATLAB
      Rust             C#           │
                                   Statistics
                                   Data
                                   Research
```

So R is an excellent example of a **domain-oriented language**.

It wasn't designed primarily to replace C, Java, or Python.

It was designed to make **statistical computing** powerful and expressive.

---

# 27. Python and R in the modern era

A useful historical picture is:

```text
1990s
 │
 ├── Python → scripting / general programming
 │
 └── R      → statistics / research
 │
 ▼
2000s
 │
 ├── Python → web / scripting
 └── R      → statistical analysis
 │
 ▼
2010s
 │
 ├── Python → data science + machine learning
 └── R      → data science + visualization + statistics
 │
 ▼
2020s
 │
 ├── Python → AI / ML / data / backend
 └── R      → statistics / research / data analysis
```

This is an important distinction from the historical development of languages like C, C++, Java, and JavaScript.

**Python became a general-purpose language that expanded strongly into data and AI. R remained much more specialized around data and statistics.**

---

# 28. A good mental model

If you are learning the major programming languages systematically, I would summarize them like this:

```text
C
↓
systems programming


C++
↓
systems + OOP + performance


Java
↓
portable enterprise/application programming


JavaScript
↓
Web programming


Python
↓
general-purpose programming
+ automation
+ data
+ AI


R
↓
statistics
+ data analysis
+ visualization
+ research
```

And the key idea for R is:

> **R is a language/environment whose center of gravity is statistical and data-oriented programming.**

If Python is a **general-purpose language that became a major language of AI**, R is a **statistics-first language that became a major language of data analysis and scientific research**.
