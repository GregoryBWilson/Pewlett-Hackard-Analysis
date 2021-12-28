-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/yZwWc8
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
-- I then edited the SQL to match what was in the course material
-- I will be discussing the differences with my intructor and/or TA
-- Question #1 - Why does QuickDBD(QDBD) use "" around all table and attribute names and we do not
-- Observation #1 - Looks like I can edit the VARCHAR in QuickDBD to be VARCHAR(4) or whatever I need
-- Question #2 - Why does QDBD used CONSTRAINT pk_Departments PRIMARY KEY (dept_no) and Carleton just do this PRIMARY KEY (dept_no), UNIQUE (dept_name)
-- Observation #2 - Unique can be added to the end of a atribute definition in QDBD
-- Observation #3 - QDBD does not force types to use upper case, you need to do that.
-- Question #3 - I can't understand having two "Primary Keys" how can that be?
-- Question #4 - Why are salaries INT instead of MONEY?
-- Question #5 - I like that QDBD adds all the FK at the end that way it doesn't matter how the tables are created, isn't that better?
-- Question #6 - Why are the foreign keys in Manager not indented?

-- Creating tables for PH-EmloyeeDB
CREATE TABLE Departments (
    dept_no VARCHAR(4)   NOT NULL,
    dept_name VARCHAR(40)   NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE (dept_name)
);

CREATE TABLE Titles (
    emp_no INT   NOT NULL,
    title VARCHAR   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no)
);

CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    gender VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE Dept_Emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(4)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE Managers (
    dept_no VARCHAR(4)   NOT NULL,
    emp_no INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
