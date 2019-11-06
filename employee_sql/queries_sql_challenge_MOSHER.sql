-- 1. List employee number, last name, first name, gender, and salary.
SELECT e.id, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
LEFT JOIN salaries s
ON s.id = e.id;

-- 2. List employees who were hired in 1986.
SELECT hire_date, id, last_name, first_name
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

-- 3. List the manager of each department 
-- WITH department number, department name, the manager's employee number, 
-- AND last name, first name, and start and end employment dates.
SELECT m.depart_id, d.depart_name, m.employ_id, e.last_name, e.first_name, 
	m.from_date, m.to_date
FROM managers m
LEFT JOIN departments d
ON d.id = m.depart_id
LEFT JOIN employees e
ON e.id = m.employ_id;

-- 4. List the department of each employee with employee number, last name, first name
-- and department name.
SELECT e.id, e.last_name, e.first_name, d.depart_name
FROM employees e
LEFT JOIN dept_emp j
ON j.employ_id = e.id
LEFT JOIN departments d 
ON d.id = j.depart_id
ORDER BY last_name;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department
-- Include employee number, last name, first name, and department name.
SELECT e.id, e.last_name, e.first_name, d.depart_name
FROM employees e
LEFT JOIN dept_emp j
ON j.employ_id = e.id
LEFT JOIN departments d 
ON d.id = j.depart_id
WHERE depart_name LIKE 'Sales';

-- 7. List all employees in the Sales and Development departments
-- Include employee number, last name, first name, and department name.
SELECT e.id, e.last_name, e.first_name, d.depart_name
FROM employees e
LEFT JOIN dept_emp j
ON j.employ_id = e.id
LEFT JOIN departments d 
ON d.id = j.depart_id
WHERE depart_name LIKE 'Sales' OR depart_name LIKE 'Development';

-- 8. In descending order, list the frequency count of employee last names
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY (count) DESC;

-- Epilogue: Search your ID number: 499942.
SELECT e.id, e.last_name, e.first_name, d.depart_name
FROM employees e
LEFT JOIN dept_emp j
ON j.employ_id = e.id
LEFT JOIN departments d 
ON d.id = j.depart_id
WHERE e.id = 499942;
