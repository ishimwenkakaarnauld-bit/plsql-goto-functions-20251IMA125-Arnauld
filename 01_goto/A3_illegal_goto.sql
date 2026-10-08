SET SERVEROUTPUT ON

-- PART 1: ILLEGAL (this fails with PLS-00375)
BEGIN
    GOTO inside_block;
    IF 1 = 1 THEN
        <<inside_block>>
        DBMS_OUTPUT.PUT_LINE('Inside the IF block');
    END IF;
END;
/

-- PART 2: FIX (label moved to the same level as the GOTO)
BEGIN
    GOTO target_label;
    DBMS_OUTPUT.PUT_LINE('This line is skipped');

    <<target_label>>
    DBMS_OUTPUT.PUT_LINE('Fixed: label is at the same level as the GOTO');
END;
/
