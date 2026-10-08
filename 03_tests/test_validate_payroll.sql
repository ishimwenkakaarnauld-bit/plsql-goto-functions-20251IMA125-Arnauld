SELECT emp_id,
       first_name,
       status,
       monthly_salary,
       fn_validate_payroll(emp_id) AS payroll_result
  FROM employees
 ORDER BY emp_id;
