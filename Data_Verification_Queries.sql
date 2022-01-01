-- got this example DO code FROM https://www.postgresqltutorial.com/plpgsql-SELECT-INTO/
-- Set variable emp_no_count value
do $$
DECLARE
  	emp_no_count INTEGER; 
  	emp_titles_count INTEGER; 
  	current_emp INTEGER;
  	retired_employees INTEGER;
  	retiring_count INTEGER;
	mentor_count INTEGER;
	retiring_check INTEGER;
	mentor_check INTEGER;
	other_emp INTEGER;
	other_check INTEGER;
	
BEGIN
 
   	SELECT count(*)
   	INTO emp_no_count
   	FROM employees;
   	RAISE NOTICE 'The number of employee ID numbers, emp_no_count: %', emp_no_count;

   	SELECT count(*)
   	INTO emp_titles_count
   	FROM titles;
   	RAISE NOTICE 'The number of employee titles enteries, emp_titles_count: %', emp_titles_count;

   	SELECT count(*)
   	INTO current_emp
   	FROM titles
   	WHERE (to_date = '9999-01-01');
   	RAISE NOTICE 'The actual number of employees at PH, current_emp: %', current_emp;

   	retired_employees = emp_no_count - current_emp;
   	RAISE NOTICE 'The total number of retired employees at PH, retired_employees: %', retired_employees;
   
   	SELECT count(*)
	INTO retiring_count
   	FROM employees AS e
	INNER JOIN titles AS t
	ON (e.emp_no = t.emp_no)
	WHERE (t.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31');
   	RAISE NOTICE 'The number of employees that can retire soon, retiring_count: %', retiring_count;
	
	SELECT count(*)
	INTO retiring_check
   	FROM unique_titles;
   	RAISE NOTICE 'Check of number of employees that can retire soon, retiring_check: %', retiring_check;
	
	SELECT count(*)
	INTO mentor_count
   	FROM employees AS e
	INNER JOIN titles AS t
	ON (e.emp_no = t.emp_no)
	WHERE (t.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31');
   	RAISE NOTICE 'The number of employees are mentor candidates, mentor_count: %', mentor_count;
	
	SELECT count(*)
	INTO mentor_check
   	FROM mentorship_eligibility;
   	RAISE NOTICE 'Check of number of employees are mentor candidates, mentor_check: %', mentor_check;
	
	SELECT count(*)
	INTO other_emp
   	FROM employees AS e
	INNER JOIN titles AS t
	ON (e.emp_no = t.emp_no)
	WHERE (t.to_date = '9999-01-01') AND 
		NOT(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND
		NOT (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31');
   	RAISE NOTICE 'The number of other employees, other_emp: %', other_emp;
	
	other_check = current_emp - retiring_count - mentor_count;
	RAISE NOTICE 'Check of the number of other employees, other_check: %', other_check;
END; $$


