CREATE OR REPLACE FUNCTION fn_validate_payroll (
    p_emp_id IN employees.emp_id%TYPE
) RETURN VARCHAR2
IS
    v_emp employees%ROWTYPE;
BEGIN
    SELECT * INTO v_emp
      FROM employees
     WHERE emp_id = p_emp_id;

    IF v_emp.status <> 'ACTIVE' THEN
        RETURN 'INVALID: employee is not active';
    ELSIF v_emp.monthly_salary IS NULL OR v_emp.monthly_salary <= 0 THEN
        RETURN 'INVALID: salary must be greater than zero';
    ELSIF v_emp.hire_date > SYSDATE THEN
        RETURN 'INVALID: hire date is in the future';
    ELSIF v_emp.dept_id IS NULL THEN
        RETURN 'INVALID: no department assigned';
    ELSIF fn_dept_name(v_emp.dept_id) = 'Unknown' THEN
        RETURN 'INVALID: department does not exist';
    ELSE
        RETURN 'VALID';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: employee not found';
    WHEN OTHERS THEN
        RETURN 'INVALID: unexpected error - ' || SQLERRM;
END fn_validate_payroll;
/
