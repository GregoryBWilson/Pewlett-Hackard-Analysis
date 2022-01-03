# Pewlett-Hackard Analysis

## 1 Overview of the analysis

Pewlett-Hackard (PH) is a large company that is trying to prepare for an anticipated  “silver tsunami”  as a significant number of baby boomer employees approach retirement age.  I have been working with Bobby and his manager to determine the number of retiring employees per job title, and identify employees who are eligible to participate in a company mentorship program. With our help Pewlett-Hackard will be well prepared to avoid what could be  a human resources and financial nightmare.

### 1.1 Creation of Entity Diagram

Pewlett-Hackard had been keeping track of employee information using a number of spreadsheets.  These sheets contained sufficient information to complete the desired task, however, a great deal of work had to be completed to connect relevant data and extract critical views of interest to the client.  Figure 1 below is an entity relationship diagram (ERD) of the tables that contain the information to be analyzed.  This diagram was created using Quick Database Diagrams Tools (QuickDBD) found at https://app.quickdatabasediagrams.com/ .  Table entities, attributes and relationships can be developed in detail using this tool as can be seen below.

![This image is an export of the PH QuickDB entity diagram](EmployeeDB.png?lastModify=1640037549 "Figure 1  - Pewlett-Hackard Entity Diagram")

***Figure 1  - Pewlett-Hackard Entity Diagram***

### 1.2 Building the PH Database

Using the ERD in figure 1, we are then able to develop scripts to build the database schema using pgAdmin on a Postgres 13.5 database server.  The script below, in figure 2, can be found in folder "Pewlett-Hackard-Analysis\Analysis_Projects_Folder\Pewlett-Hackard_Analysis_Folder\Queries" under the file name "schema.sql", for convenience this folder will now be referred to as the "Queries" folder.   In this method of building the database the foreign key references are built at the same time as the table itself.

![This is a VS screenshot of the schema.sql code](Building_Managers_Table.png?lastModify=1640037549 "Figure 2  - Building Table & Keys Together")

***Figure 2  - Building Table & Keys Together***



If the tables and their interconnections are fully detailed in QuickDBD, it is possible to export the schema to build a database in pgAdmin.  Just to prove this out, I detailed the ERD and exported the schema shown in figure 3 and built a second PH database so that I could compare them - they were identical.  The full schema can be found in the queries folder under the file name "QuickDBD-Pewlett Hackard.sql".  You can see in this script that the foreign key references are all run at the end after all of the tables have been built, this method avoids the problem of having to build the tables in a specific order to avoid referential errors between tables.

![This is a VS screenshot of the QuickDBD-Pewlett Hackard.sql code](QuickDBD_Constraints_Approach.png?lastModify=1640037549 "Figure 3  - Building Tables First & Adding Constraints Later")

***Figure 3  - Building Tables First & Adding Constraints Later***

You may wonder why the QuickDBD exported schema has quotes around the table names.  I found out, the hard way, that without quotes Postgres will build all table names using lower case.  With quotes, Postgres will accept mixed case names, unfortunately all future references require the use of quotes.  Bottom-line, build everything in QuickDBD with lowercase names if you want to use their scripts to build databases. 

It should also be noted that while these scripts were used to build the database I did make at least one table name change, "manager" was changed to "dept_manager".  The change to the schema had been preserved through the backup features in pgAdmin, the exported schema can be found in the Queries folder under the name "PH-EmployeeDB_Schema.sql".  This is very useful, as further changes are likely at some point in Pewlett-Hackard's future.

### 1.3 Importing PH Data for Analysis

The next step was to use the import features of pgAdmin to populate the database table with data held in the six CSV files provided by Pewlett-Hackard.  All the CSV files imported, as well as those created throughout the analysis, can be found in folder: 

"Pewlett-Hackard-Analysis\Analysis_Projects_Folder\Pewlett-Hackard_Analysis_Folder\Data" 

The files provide by PH are list below:

1. departments.csv
2. dept_emp.csv
3. dept_manager.csv
4. employees.csv
5. salaries.csv
6. titles.csv

For ease of reading, further referrences to the folder "Pewlett-Hackard-Analysis\Analysis_Projects_Folder\Pewlett-Hackard_Analysis_Folder\Data" , will simply be stated as "Data" folder.

## 2 Results

The three sections that follow, describe the work that has been conducted and the results towards achieving the objectives as stated by the client.  Section 2.1 discusses determining the number of retiring employees by title who are at or nearing retirement age.  Section 2.3 identifies employees eligible for the mentorship program and in section 2.3  we discusses ten additional queries that have been developed to answer other questions and confirm the results of this analysis.  

Some important observations are as follows:

- The titles table is a complete history of the company with 443,308 entries.
  - There are multiple entries for employees who have been promoted.
- The employees table is also a complete history of the company with 300,024 entries.
  - There are entries for employees who are no longer employed by the company.
- The total number of employees currently working at PH is 240,124.
  - Connecting employee's most recent title from the titles table tells us who they are.
- There are a total of 59,990 retired employees.
  - Not only can this tell us who should not be counted, but it also can be used to verify the other numbers that are being presented to Bobby. 

### 2.1  The Number of Retiring Employees by Title

#### 2.1.1 Retirement Titles Table

A query, shown in figure 4 below, was written and executed to create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955.   As you can see this query was also written to a new table "retirement_titles".   

![This is a VS screenshot of the Employee_Database_challenge.sql code](Create_Retirement_Titles_Table.png?lastModify=1640037549 "Figure 4  - Create Retirement Titles Table")

***Figure 4  - Create Retirement Titles Table***

It is important to note in the script above that the WHERE statement does not exclude retired titles, so we need to be careful on future queries to make sure that what we are reporting is correct.  Keeping the retired titles in provide other data analysis opportunities, such as promotion and employment history of the individuals who are approaching retirement.  The WHERE clause could be changed to the following if we wished to focus on current titles only.

```
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	 AND (de.to_date = '9999-01-01')
```

  A preview of the figure 4 query is shown in table 1 below, by commenting out the INTO statement above.  The table was later exported to a file "retirement_titles.csv" which can be found in the Data folder.  Notice the duplicate employee numbers.

![This is a pgAdmin 4 screenshot of the PH-EmployeeDB database](Deliverable_1_step_7_view.png?lastModify=1640037549 "Table 1  - Retirement Titles Table")

***Table 1  - Retirement Titles Table***

#### 2.1.2 Unique Titles Table

A query was written, shown in figure 5 below, and executed to create a Unique Titles table that contains the employee number, first and last name, and most recent title. As you can see this query was also written to a new table "unique_titles". 

![This is a VS screenshot of the Employee_Database_challenge.sql code](Create_Unique_Titles_Table.png?lastModify=1640037549 "Figure 5  - Create Unique Titles Table")

***Figure 5  - Create Unique Titles Table***

A preview of the figure 5 query is shown in table 2 below, by commenting out the INTO statement above.  The table was later exported to a file "unique_titles.csv" which can be found in the Data folder.  You can see here that the duplicates have now been removed by the DISTINCT ON statement, order by descending to_date, to ensure that the current title for the employee is selected.  The WHERE statement also eliminates retired titles, and therefore retired employees as well.  As such, the following code gives the same result as in figure 5 above.

```
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
    rt.first_name,
    rt.last_name,
    rt.title
-- INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no;
```

![This is a pgAdmin 4 screenshot of the PH-EmployeeDB database](Deliverable_1_step_15_view.png?lastModify=1640037549 "Table 2  - Unique Titles Table")

***Table 2  - Unique Titles Table***

#### 2.1.3 Retiring Titles Table 

A query was written,  shown in figure 6 below, and executed to create a Retiring Titles table that contains the number of titles filled by employees who are retiring.   As you can see, this query was also written to a new table "retiring_titles".   You will notice that this table was taken from the unique_titles table so duplicate employees and retired employees have already been eliminated.

![This is a VS screenshot of the Employee_Database_challenge.sql code](Create_Retiring_Titles_Table.png?lastModify=1640037549 "Figure 6  - Create Retiring Titles Table")

***Figure 6  - Create Retiring Titles Table***

A preview of the figure 6 query is shown in table 3 below, by commenting out the INTO statement above.  The table was later exported to a file "retiring_titles.csv" which can be found in the Data folder.

![This is a pgAdmin 4 screenshot of the PH-EmployeeDB database](Deliverable_1_step_21_view(checked).png?lastModify=1640037549 "Table 3  - Retiring Titles Table")

***Table 3  - Retiring Titles Table***

### 2.2 The Employees Eligible for the Mentorship Program

A query was written,  shown in figure 7 below, and executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.   As you can see this query was also written to a new table "mentorship_eligibility".   You will notice that the WHERE clause includes both the desired birth_date range and the to_date that identified only current employees.  

![This is a VS screenshot of the Employee_Database_challenge.sql code](Create_Mentorship_Eligibility_Table.png?lastModify=1640037549 "Figure 7  - Create Mentorship Eligibility Table")

***Figure 7  - Create Mentorship Eligibility Table***

A preview of the figure 7 query is shown in table 4 below, by commenting out the INTO statement above.  The table was later exported to a file "mentorship_eligibility.csv" which can be found in the Data folder.

![This is a pgAdmin 4 screenshot of the PH-EmployeeDB database](Deliverable_2_step_11_view.png?lastModify=1640037549 "Table 4  - Mentorship Eligibility Table")

***Table 4  - Mentorship Eligibility Table***

### 2.3 Extended Data Analysis and Results Confirmation

Just to make sure that the information being provided for Bobby was correct, I created ten data verification scripts that did counts and preformed calculations with variables.  Checking counts by a number of different methods allowed me to confirm that they were indeed correct  The verification SQL scripts file can be found in Queries for as Data_Verification_Queries.sql.   The queries include generating the notices that appear in figure 8 below, Bobby may find this data of use in his reporting to management.

<img src="Deliverables_1_&_2_Data_Varification.png?lastModify=1640037549" alt="This is a pgAdmin 4 screenshot of the PH-EmployeeDB database" title="Figure 8  - Result Verification and Additional Query Messages" style="zoom:120%;" />

***Figure 8  - Result Verification and Additional Query Messages***



## 3 Summary

As we can see in the analysis above there are 72,458 employees nearly retirement at Pewlett-Hackard.  The largest impacted job title is Senior Engineer at more than 25,000 employees, this is followed closely by the number of Senior Staff.  This means that more than 20% of PH senior employees are nearing retirement and a great deal of work will need to be done to backfill a significant loss of corporate knowledge.  To help Bobby out we have created a few additional queries for his management team to review.  These queries can be found in the Queries folder in file "Additional_Queries.sql".

### 3.1 Employees Retiring

The first query, shown in figure 9 below, creates a clean list of all employees nearing retirement, an export of this query can be found in the Data folder in the file "emp_info_additional.csv."



<img src="Summary_Employees_Retiring.png?lastModify=1640037549" alt="This is a pgAdmin 4 screenshot of the PH-EmployeeDB database" title="Figure 9  - Employees Retiring" style="zoom:100%;" />

***Figure 9  - Employees Retiring***



### 3.2 Management Retiring

The second query, shown in figure 10 below, creates list of the two department managers who are nearing retirement, an export of this query can be found in the Data folder in the file "manager_info_additional.csv."  While these two managers are included in the large file of retiring employees, it is important to make sure PH management quickly identifies replacements for these individuals as they will likely be involved it bringing on new employees to their departments.

<img src="Summary_Retiring_Managers.png?lastModify=1640037549" alt="This is a pgAdmin 4 screenshot of the PH-EmployeeDB database" title="Figure 10  - Retiring Managers" style="zoom:100%;" />

***Figure 10  - Retiring Managers***

### 3.3 Departments Impacted by Retirement

The last query that was prepared for Bobby provided him with a count, by department number, of the number of employees that will be retiring.  This information needs to get out to the department managers quickly so that they can begin to plan to promote from within and/or hire external people to fill expected vacancies.

<img src="Summary_by_Department.png?lastModify=1640037549" alt="This is a pgAdmin 4 screenshot of the PH-EmployeeDB database" title="Figure 11  - Retiring Employees by Department" style="zoom:100%;" />

***Figure 11  - Retiring Employees by Department***