-- Retiring employee information INTO emp_info_additional
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info_additional
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	 AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no

DO $$

DECLARE 
	retiring_check2 INTEGER;

BEGIN
	SELECT count(*)
	INTO retiring_check2
   	FROM emp_info_additional;
   	RAISE NOTICE 'Check of number of employees that can retire soon, retiring_check: %', retiring_check2;
	
END; $$

-- List of retiring managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        eia.last_name,
        eia.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info_additional
FROM dept_manager AS dm
    LEFT JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN emp_info_additional AS eia
        ON (dm.emp_no = eia.emp_no)
WHERE dm.to_date = '9999-01-01'
ORDER BY dept_no

-- Retiring employee count by department number
SELECT COUNT(eia.emp_no), de.dept_no
INTO retire_count_additional
FROM emp_info_additional AS eia
	LEFT JOIN dept_emp AS de
		ON eia.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY dept_no
