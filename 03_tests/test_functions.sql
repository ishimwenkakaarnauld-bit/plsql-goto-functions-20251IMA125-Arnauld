SET SERVEROUTPUT ON
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- B1 fn_annual_salary ---');
    DBMS_OUTPUT.PUT_LINE('Emp 101 (expect 5400000): ' || fn_annual_salary(101));
    DBMS_OUTPUT.PUT_LINE('Emp 999 (expect NULL)   : ' || NVL(TO_CHAR(fn_annual_salary(999)), 'NULL'));

    DBMS_OUTPUT.PUT_LINE('--- B2 fn_years_of_service ---');
    DBMS_OUTPUT.PUT_LINE('Emp 101: ' || fn_years_of_service(101) || ' years');
    DBMS_OUTPUT.PUT_LINE('Emp 999 (expect NULL): ' || NVL(TO_CHAR(fn_years_of_service(999)), 'NULL'));

    DBMS_OUTPUT.PUT_LINE('--- B3 fn_calculate_tax ---');
    DBMS_OUTPUT.PUT_LINE('0      (expect 0)    : ' || fn_calculate_tax(0));
    DBMS_OUTPUT.PUT_LINE('80000  (expect 2000) : ' || fn_calculate_tax(80000));
    DBMS_OUTPUT.PUT_LINE('150000 (expect 14000): ' || fn_calculate_tax(150000));
    DBMS_OUTPUT.PUT_LINE('450000 (expect 99000): ' || fn_calculate_tax(450000));

    DBMS_OUTPUT.PUT_LINE('--- B4 fn_dept_name ---');
    DBMS_OUTPUT.PUT_LINE('10   (expect Finance)    : ' || fn_dept_name(10));
    DBMS_OUTPUT.PUT_LINE('NULL (expect Unassigned) : ' || fn_dept_name(NULL));
    DBMS_OUTPUT.PUT_LINE('99   (expect Unknown)    : ' || fn_dept_name(99));
END;
/
