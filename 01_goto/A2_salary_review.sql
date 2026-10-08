SET SERVEROUTPUT ON
DECLARE
    v_emp_id     employees.emp_id%TYPE := 102;
    v_name       employees.first_name%TYPE;
    v_salary     employees.monthly_salary%TYPE;
    v_new_salary NUMBER;
BEGIN
    SELECT first_name, monthly_salary
      INTO v_name, v_salary
      FROM employees
     WHERE emp_id = v_emp_id;

    IF v_salary >= 400000 THEN
        GOTO high_band;
    ELSIF v_salary >= 150000 THEN
        GOTO mid_band;
    ELSE
        GOTO low_band;
    END IF;

    <<high_band>>
    v_new_salary := v_salary;
    DBMS_OUTPUT.PUT_LINE(v_name || ': HIGH band - no raise');
    GOTO show_result;

    <<mid_band>>
    v_new_salary := v_salary * 1.05;
    DBMS_OUTPUT.PUT_LINE(v_name || ': MID band - 5% raise');
    GOTO show_result;

    <<low_band>>
    v_new_salary := v_salary * 1.10;
    DBMS_OUTPUT.PUT_LINE(v_name || ': LOW band - 10% raise');

    <<show_result>>
    DBMS_OUTPUT.PUT_LINE('Current salary : ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('Reviewed salary: ' || v_new_salary);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee ' || v_emp_id || ' not found');
END;
/
