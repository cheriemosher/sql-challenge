-- Create a table for departments
CREATE TABLE departments (
    id VARCHAR(20),
    depart_name VARCHAR(20),
	PRIMARY KEY (id)
);

-- Add data from departments.csv using 'Import/Export'

-- Create a table for employees
CREATE TABLE employees (
    id INT,
    birth_date DATE,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    gender VARCHAR,
    hire_date DATE,
	PRIMARY KEY (id)
);

-- Add data from employees.csv using 'Import/Export'

-- Create a table for department-to-employees
CREATE TABLE dept_emp (
    employ_id INT NOT NULL,
	depart_id VARCHAR(20) NOT NULL,
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (employ_id) REFERENCES employees(id),
	FOREIGN KEY (depart_id) REFERENCES departments(id)
);

-- Add data from dept_emp.csv using 'Import/Export'

-- Add primary key to Dept_Emp table
ALTER TABLE dept_emp ADD COLUMN id SERIAL PRIMARY KEY;

-- Create a table for salaries
CREATE TABLE salaries (
    id INT NOT NULL,
    salary INT,
    from_date DATE,
    to_date DATE,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES employees(id)
);

-- Add data from dept_emp.csv using 'Import/Export'

--Create a table for titles
CREATE TABLE titles (
    employ_id INT NOT NULL,
	title VARCHAR(30),
    from_date DATE,
    to_date DATE,
	FOREIGN KEY (employ_id) REFERENCES employees(id)
);

-- Add data from titles.csv using 'Import/Export'

-- Add primary key to titles table
ALTER TABLE titles ADD COLUMN id SERIAL PRIMARY KEY;

-- Create a table for managers
CREATE TABLE managers (
    depart_id VARCHAR(20) NOT NULL,
    employ_id INT NOT NULL,
    from_date DATE,
    to_date DATE,
	FOREIGN KEY (depart_id) REFERENCES departments(id),
	FOREIGN KEY (employ_id) REFERENCES employees(id)
);

-- Add data from dept_manager.csv using 'Import/Export'

-- Add primary key to Managers table
ALTER TABLE managers ADD COLUMN id SERIAL PRIMARY KEY;
