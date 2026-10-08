SELECT e.emp_id,
       e.first_name || ' ' || e.last_name AS employee_name,
       fn_dept_name(e.dept_id)            AS department,
       e.monthly_salary                   AS monthly_salary,
       fn_annual_salary(e.emp_id)         AS annual_salary,
       fn_years_of_service(e.emp_id)      AS years_of_service,
       fn_calculate_tax(e.monthly_salary) AS monthly_tax
  FROM employees e
 ORDER BY e.emp_id;
