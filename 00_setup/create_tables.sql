BEGIN EXECUTE IMMEDIATE 'DROP TABLE employees PURGE';   EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE departments PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE departments (
  dept_id   NUMBER(4)     PRIMARY KEY,
  dept_name VARCHAR2(50)  NOT NULL
);

CREATE TABLE employees (
  emp_id         NUMBER(6)     PRIMARY KEY,
  first_name     VARCHAR2(30)  NOT NULL,
  last_name      VARCHAR2(30)  NOT NULL,
  hire_date      DATE          NOT NULL,
  monthly_salary NUMBER(12,2),
  dept_id        NUMBER(4)     REFERENCES departments(dept_id),
  status         VARCHAR2(10)  DEFAULT 'ACTIVE' NOT NULL
);

INSERT INTO departments VALUES (10, 'Finance');
INSERT INTO departments VALUES (20, 'IT');
INSERT INTO departments VALUES (30, 'HR');
INSERT INTO departments VALUES (40, 'Marketing');

INSERT INTO employees VALUES (101, 'Alice',   'Uwase',     DATE '2019-03-15', 450000, 10,   'ACTIVE');
INSERT INTO employees VALUES (102, 'Eric',    'Mugisha',   DATE '2021-07-01', 250000, 20,   'ACTIVE');
INSERT INTO employees VALUES (103, 'Grace',   'Ingabire',  DATE '2018-01-10', 800000, 30,   'ACTIVE');
INSERT INTO employees VALUES (104, 'Jean',    'Habimana',  DATE '2023-09-20',  55000, 10,   'ACTIVE');
INSERT INTO employees VALUES (105, 'Diane',   'Mukamana',  DATE '2020-05-05', 150000, 40,   'ACTIVE');
INSERT INTO employees VALUES (106, 'Patrick', 'Niyonzima', DATE '2022-11-11',      0, 20,   'ACTIVE');
INSERT INTO employees VALUES (107, 'Sandra',  'Umutoni',   DATE '2030-01-01', 300000, 30,   'ACTIVE');
INSERT INTO employees VALUES (108, 'Kevin',   'Nshuti',    DATE '2017-02-02', 600000, NULL, 'ACTIVE');
INSERT INTO employees VALUES (109, 'Olive',   'Uwera',     DATE '2016-06-06', 350000, 10,   'INACTIVE');

COMMIT;
