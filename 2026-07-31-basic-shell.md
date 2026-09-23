Bash (Bourne Again Shell) is the default command-line interpreter for most Linux and macOS systems. A Bash script is simply a text file containing a sequence of commands that the shell executes in order. [1, 2, 3, 4, 5] 
Every Bash script must start with a Shebang (#!/bin/bash) on the absolute first line. This tells the system exactly which interpreter to use to run the file. [6, 7, 8] 

------------------------------
## 🚀 Core Fundamentals & Code Demos
Here are the essential building blocks of Bash programming with ready-to-run examples.
## 1. Variables and User Input

* Rule: Do not use spaces around the equals sign (=) when assigning variables.
* Rule: Use the $ symbol to read or reference a variable. [9, 10, 11] 

#!/bin/bash
# Assigning a variable (No spaces around '=')
NAME="Alice"
echo "Hello, $NAME!"
# Reading user input from the terminal
echo "What is your favorite programming language?"
read LANGUAGE
echo "Awesome, $LANGUAGE is great!"

## 2. Conditional Statements (if/else) [12] 

* Rule: You must put spaces inside the square brackets [ ] of the conditional check.
* Rule: Always wrap your string variables in double quotes "$VAR" to prevent bugs if the variable is empty or contains spaces. [13, 14, 15] 

#!/bin/bash

echo "Enter a number:"
read NUM
# -gt means "greater than". Other flags: -lt (less than), -eq (equal)if [ "$NUM" -gt 10 ]; then
    echo "The number is greater than 10."elif [ "$NUM" -eq 10 ]; then
    echo "The number is exactly 10."else
    echo "The number is less than 10."fi

## 3. Loops (for and while)
Loops allow you to iterate over sequences, files, or arrays efficiently. [16, 17, 18, 19] 

#!/bin/bash

echo "--- For Loop Example ---"# Loop through a predefined list of itemsfor FRUIT in apple banana cherry; do
    echo "I like eating ${FRUIT}s"done

echo "--- While Loop Example ---"# Loop until a condition is met
COUNT=1while [ "$COUNT" -le 3 ]; do
    echo "Count is: $COUNT"
    COUNT=$((COUNT + 1)) # Simple arithmetic calculation syntaxdone

## 4. Functions
Functions allow you to reuse code blocks. Arguments passed to a function are accessed using positional parameters like $1 (first argument), $2 (second argument), etc. [20, 21, 22, 23, 24] 

#!/bin/bash
# Define the function
greet_user() {
    local USERNAME=$1  # 'local' keeps the variable inside this function
    echo "Welcome back, $USERNAME!"
}
# Call the function and pass an argument
greet_user "Bob"

------------------------------
## 🛠️ How to Run Your Bash Script
To execute a Bash script on your system, follow these three steps in your terminal:

   1. Create the file: Save any of the code blocks above into a file named myscript.sh.
   2. Make it executable: Give the file run permissions by executing:
   
   chmod +x myscript.sh
   
   3. Run the script: Execute it from your current directory:
   
   ./myscript.sh
   
   [25, 26, 27, 28, 29] 

To help customize the next step, tell me:

* Are you trying to automate a specific task (like backing up files, renaming data, or monitoring a system)?
* Do you need to learn how to handle command-line arguments passed directly to the script?

