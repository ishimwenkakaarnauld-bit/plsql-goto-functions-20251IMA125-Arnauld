# Reflection

## 1. What is the difference between GOTO and structured control (IF/ELSIF)?
GOTO jumps straight to a labeled line, so you have to follow the labels around the program to understand what happens. IF/ELSIF/ELSE keeps each condition next to the code it controls. 

## 2. Why is jumping INTO an IF block illegal in PL/SQL? What did the error say?
The error was PLS-00375: illegal GOTO statement; this GOTO cannot branch to label 'INSIDE_BLOCK'. The label was inside an IF block, and PL/SQL only lets a GOTO jump to a label at the same level or out of a block, never into a nested one. I fixed it by moving the label to the same level as the GOTO.

## 3. What are the advantages of putting logic in functions instead of repeating it in queries?
A function lets me write the logic once and reuse it anywhere. In B5, I used fn_dept_name and fn_calculate_tax inside a normal SELECT, which kept the query short and readable. If a rule changes, like the tax brackets, I only have to fix it in one place.

## 4. What was the hardest part of this assignment, and how did you solve it?
The hardest part was organizing the GitHub repository correctly. My first function file ended up inside the 00_setup folder, so I had to edit its path to move it to 02_functions. I also found that the salary column is named monthly_salary, so I used that name in my functions and programs.

## 5. What would you improve if you had more time?
I would add more checks to the payroll validator, such as checking for duplicate or invalid data. 
