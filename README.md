# Pewlett-Hackard Analysis

## 1 Overview of the analysis

Pewlett-Hackard (PH) is a large company that is trying to prepare for an anticipated  “silver tsunami”  as a significant number of baby boomer employees approach retirement age.  I have been working with Bobby and his manager to determine the number of retiring employees per job title, and identify employees who are eligible to participate in a company mentorship program. With our help Pewlett-Hackard will be well prepared to avoid what could be  a human resources and financial nightmare.

### 1.1 Creation of Entity Diagram

Pewlett-Hackard had been keeping track of employee information using a number of spreadsheets.  These sheets contained sufficient information to complete the desired task, however a great deal of work had to be completed to connect relevant data and extract critical views of interest to the client.  Figure 1 below is an entity relationship diagram (ERD) of the tables that contain to information to be analyzed.  This diagram was created using Quick Database Diagrams Tools (QuickDBD) found at https://app.quickdatabasediagrams.com/ .  Table entities, attributes and relationships can be developed in detail using this tool as can be seen below.

![This image is an export of the PH QuickDB entity diagram](EmployeeDB.png?lastModify=1640037549 "Figure 1  - Pewlett-Hackard Entity Diagram")

***Figure 1  - Pewlett-Hackard Entity Diagram***

### 1.2 Building the PH Database

Using the ERD in figure 1, we are then able to develop scripts to build the database schema using pgAdmin on a Postgres 13.5 database server.  The script below, in figure 2, can be found in folder "Pewlett-Hackard-Analysis\Analysis_Projects_Folder\Pewlett-Hackard_Analysis_Folder\Queries" under the file name "schema.sql".  In this method of building the database the foreign key references are build at the same time as the table itself.

![This is a VS screenshot of the schema.sql code](Building_Managers_Table.png?lastModify=1640037549 "Figure 2  - Building Table & Keys Together")

***Figure 2  - Building Table & Keys Together***



If the tables and there interconnections are fully detailed in QuickDBD, it is possible to export the schema to build a database in pgAdmin.  Just to prove this out, I detailed the ERD and exported the schema shown in figure 3 and built two database to that I could compare them - there are identical.  The full schema can be found in the queries folder under the file name "QuickDBD-Pewlett Hackard.sql".  You can see in this script that the foreign key references are all run at the end after all of the tables have been built, this method avoids the problem of having to build the tables in a specific order to avoid referential errors between tables.

![This is a VS screenshot of the QuickDBD-Pewlett Hackard.sql code](QuickDBD_Constraints_Approach.png?lastModify=1640037549 "Figure 3  - Building Tables First & Adding Constraints Later")

***Figure 3  - Building Tables First & Adding Constraints Later***

You may wonder why the QuickDBD exported schema has quotes around the table names.  I found out the hard way what without quotes Postgres will make all table name in lower case.  With quote Postgres will accept mixed case names, unfortunately all future references require the use of quotes.  Bottom-line, build everything in QuickDBD with lowercase names if you want to use their scripts to build databases. 

It should also be noted that while these scripts were used to build the database I did make at least one table name change "manager" was changed to "dept_manager".  The changed to the schema had been preserved through the backup features in pgAdmin, the exported schema can be found in the queries folder under the name "PH-EmployeeDB_Schema.sql".

### 1.3 Importing PH Data for Analysis

The next step was to use the import features of pgAdmin to populate the database table with data held in the six CSV files provided by Pewlett-Hackard.  All the CSV files imported, as well as through created throughout the analysis, can be found in folder: 

"Pewlett-Hackard-Analysis\Analysis_Projects_Folder\Pewlett-Hackard_Analysis_Folder\Data" 

The files provide by PH are list below:

1. departments.csv
2. dept_emp.csv
3. dept_manager.csv
4. employees.csv
5. salaries.csv
6. titles.csv

## 2 Results

The three section that follow describe the work that has been conducted and the results towards achieving the objectives as stated by the client.  Section 2.1 discusses determining the number of retiring employees by title who are at or nearing retirement age.  Section 2.3 identifies employees eligible for the mentorship program and in section 2.3  we discusses ten additional queries that have been developed to answer other questions and confirmation the results of this analysis.  

Some important observations are as follows:

- The titles table is a complete history of the company with 443,308 entries.
  - There are multiple entries for employees who have been promoted
- The employees table is also a complete history of the company with 300,024 entries.
  - There are entries for employees who are no longer employed by the company
- The total number of employees currently working at PH is 240,124.
  - Connecting employee's most receive title from titles tells us who they are.
- There are a total of 59,990 retired employees.
  - Not only can this tell us who should not be counted, but it also can be used to verify the other numbers that are being presented to Bobby. 



### 2.1  The Number of Retiring Employees by Title

### Deliverable 1 Requirements

You will earn a perfect score for Deliverable 1 by completing all requirements below:

- A query is written and executed to create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955. **(10 pt)**

![This is a VS screenshot of the Employee_Database_challenge.sql code](Create_Retirement_Titles_Table.png?lastModify=1640037549 "Figure 4  - Create Retirement Titles Table")

***Figure 4  - Create Retirement Titles Table***

- The Retirement Titles table is exported as `retirement_titles.csv`. **(5 pt)**

- **

![This is a pgAdmin 4 screenshot of the PH-EmployeeDB database](Deliverable_1_step_7_view.png?lastModify=1640037549 "Table 1  - Retirement Titles Table")

***Table 1  - Retirement Titles Table***

The output files can be found at \Analysis Projects Folder\Pewlett-Hackard_Analysis Folder\Data\retirement_titles.csv .

- A query is written and executed to create a Unique Titles table that contains the employee number, first and last name, and most recent title. **(15 pt)**

![This is a VS screenshot of the Employee_Database_challenge.sql code](Create_Unique_Titles_Table.png?lastModify=1640037549 "Figure 5  - Create Unique Titles Table")

***Figure 5  - Create Unique Titles Table***



- The Unique Titles table is exported as `unique_titles.csv`. **(5 pt)**

- **

![This is a pgAdmin 4 screenshot of the PH-EmployeeDB database](Deliverable_1_step_15_view.png?lastModify=1640037549 "Table 2  - Unique Titles Table")

***Table 2  - Unique Titles Table***



The output files can be found at \Analysis Projects Folder\Pewlett-Hackard_Analysis Folder\Data\unique_titles.csv .

- A query is written and executed to create a Retiring Titles table that contains the number of titles filled by employees who are retiring. **(10 pt)**

![This is a VS screenshot of the Employee_Database_challenge.sql code](Create_Retiring_Titles_Table.png?lastModify=1640037549 "Figure 6  - Create Retiring Titles Table")

***Figure 6  - Create Retiring Titles Table***



- The Retiring Titles table is exported as `retiring_titles.csv`. **(5 pt)**



- **

![This is a pgAdmin 4 screenshot of the PH-EmployeeDB database](Deliverable_1_step_21_view(checked).png?lastModify=1640037549 "Table 3  - Retiring Titles Table")

***Table 3  - Retiring Titles Table***



The output files can be found at \Analysis Projects Folder\Pewlett-Hackard_Analysis Folder\Data\retiring_titles.csv .

### 2.2 The Employees Eligible for the Mentorship Program

### Deliverable 2 Requirements

You will earn a perfect score for Deliverable 2 by completing all requirements below:

- A query is written and executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965. **(25 pt)**

![This is a VS screenshot of the Employee_Database_challenge.sql code](Create_Mentorship_Eligibility_Table.png?lastModify=1640037549 "Figure 7  - Create Mentorship Eligibility Table")

***Figure 7  - Create Mentorship Eligibility Table***



- The Mentorship Eligibility table is exported and saved as `mentorship_eligibilty.csv`. **(5 pt)**



- **

![This is a pgAdmin 4 screenshot of the PH-EmployeeDB database](Deliverable_2_step_11_view.png?lastModify=1640037549 "Table 4  - Mentorship Eligibility Table")

***Table 4  - Mentorship Eligibility Table***



The output files can be found at \Analysis Projects Folder\Pewlett-Hackard_Analysis Folder\Data\mentorship_eligibilty.csv .



### 2.3 Extended Data Analysis and Results Confirmation

- **

<img src="Deliverables_1_&_2_Data_Varification.png?lastModify=1640037549" alt="This is a pgAdmin 4 screenshot of the PH-EmployeeDB database" title="Figure 8  - Result Verification and Additional Query Messages" style="zoom:120%;" />

***Figure 8  - Result Verification and Additional Query Messages***

The verification SQL scripts file can be found in this directory at Data_Verification_Queries.sql

### 3 Summary

- The summary addresses the two questions and ***contains two additional queries or tables*** that may provide more insight. **(5 pt)**

https://courses.bootcampspot.com/courses/1177/pages/7-dot-3-5-create-additional-lists?module_item_id=355963





- Deliverable 3: A written report on the employee database analysis (README.md)

  

### Deliverable 3 Requirements

#### Structure, Organization, and Formatting (6 points)

The written analysis has the following structure, organization, and formatting:

- There is a title, and there are multiple sections. **(2 pt)**
- Each section has a heading and subheading. **(2 pt)**
- Links to images are working and displayed correctly. **(2 pt)**

#### Analysis (14 points)

The written analysis has the following:



1. - 
2. - 