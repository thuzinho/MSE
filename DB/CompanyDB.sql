/* http://sqlfiddle.com/#!9/d2e471/12 */
CREATE TABLE EMPLOYEE (
    Fname VARCHAR(15) NOT NULL,
    Minit CHAR(1),
    Lname VARCHAR(15) NOT NULL,
    Ssn CHAR(9) NOT NULL,
    Bdate DATE NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Sex CHAR(1) NOT NULL,
    Salary DOUBLE(10,2),
    Super_ssn CHAR(9),
    Dno INT NOT NULL,
    PRIMARY KEY (Ssn),
    FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn)
);
INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
VALUES('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, 1);
INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
VALUES('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5);

INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
VALUES('Jenifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, 888665555, 4);

INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
VALUES('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, 987654321, 4);

INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
VALUES('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5);

INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
VALUES('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, 333445555, 5);

INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
VALUES('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4);

INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
VALUES('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, 333445555, 5);

CREATE TABLE DEPARTMENT (
    Dname VARCHAR(25) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_ssn CHAR(9),
    Mgr_start_date DATE,
    PRIMARY KEY (Dnumber),
    FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn)
);

INSERT INTO DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES ('Research', 5, '333445555', '1988-05-22');
INSERT INTO DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES ('Administration', 4, '987654321', '1995-01-01');
INSERT INTO DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES ('Headquarters', 1, '888665555', '1981-06-19');

CREATE TABLE DEPT_LOCATIONS (
    Dnumber INT NOT NULL, 
    Dlocation VARCHAR(20) NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber)
);

INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES (1, 'Houston');
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES (4, 'Stafford');
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES (5, 'Bellaire');
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES (5, 'Sugarland');
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES (5, 'Houston');

CREATE TABLE PROJECT (
    Pname VARCHAR(25) NOT NULL, 
    Pnumber INT NOT NULL, 
    Plocation VARCHAR(20), 
    Dnum INT,
    PRIMARY KEY (Pnumber),
    FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)
);

INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum) VALUES ('ProductX', 1, 'Bellaire', 5);
INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum) VALUES ('ProductY', 2, 'Sugarland', 5);
INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum) VALUES ('ProductZ', 3, 'Houston', 5);
INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum) VALUES ('Computerization', 10, 'Stafford', 4);
INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum) VALUES ('Reorganization', 20, 'Houston', 1);
INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum) VALUES ('Newbenefits', 30, 'Stafford', 4);

CREATE TABLE DEPENDENT (
    Essn CHAR(9) NOT NULL, 
    Dependent_name VARCHAR(15) NOT NULL,
    Sex CHAR(1) NOT NULL,
    Bdate DATE NOT NULL, 
    Relationship VARCHAR(15) NOT NULL,
    PRIMARY KEY (Essn, Dependent_name),
    FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn)
);

INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('333445555', 'Theodore', 'M', '1983-10-25', 'Son');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('333445555', 'Joy', 'F', '1958-05-03', 'Spouse');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('123456789', 'Michael', 'M', '1988-01-04', 'Son');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');

CREATE TABLE WORKS_ON (
    Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(10, 1),
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),
    FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber)        
);

INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('123456789', 1, 32.5);
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('123456789', 2, 7.5);
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('666884444', 3, 40.0);
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('453453453', 1, 20.0);
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('453453453', 2, 20.0);

INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('333445555', 2, 10.0);
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('333445555', 3, 10.0);
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('333445555', 10, 10.0);
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('333445555', 20, 10.0);

INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('999887777', 30, 30.0);
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('999887777', 10, 10.0);

INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('987987987', 10, 35.0);
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('987987987', 30, 5.0);

INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('987654321', 30, 20.0);
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('987654321', 20, 15.0);
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('888665555', 20, NULL);

/* Display names of employees from Dno 4 who worked on project 10 or project 20.*/
/* Solution 1 */
SELECT Lname, Fname
FROM (EMPLOYEE JOIN WORKS_ON ON SSN = ESSN)
WHERE Dno = 4 AND (Pno = 10 OR Pno = 20);

/* Solution 2 */
(SELECT Lname, Fname
FROM (EMPLOYEE JOIN WORKS_ON ON SSN = ESSN)
WHERE Dno = 4 AND Pno = 10)
UNION
(SELECT Lname, Fname
FROM (EMPLOYEE JOIN WORKS_ON ON SSN = ESSN)
WHERE Dno = 4 AND Pno = 20);

/* Display names of employees that worked in Dno 4 and worked on both projects 10 and 20. */
/* Solution 1 */
(SELECT Lname, Fname
FROM (EMPLOYEE JOIN WORKS_ON ON SSN = ESSN)
WHERE Dno = 4 AND Pno = 10)
INTERSECT
(SELECT Lname, Fname
FROM (EMPLOYEE JOIN WORKS_ON ON SSN = ESSN)
WHERE Dno = 4 AND Pno = 20);

/* Solution 2 */
(SELECT Lname, Fname
FROM (EMPLOYEE JOIN WORKS_ON ON SSN = ESSN)
WHERE Dno = 4 AND Pno = 10 AND (Lname, Fname) IN
            (SELECT Lname, Fname
            FROM (EMPLOYEE JOIN WORKS_ON ON SSN = ESSN)
            WHERE Dno = 4 AND Pno = 20)
);

/* Solution 3 */
(SELECT Lname, Fname
FROM (EMPLOYEE JOIN WORKS_ON ON SSN = ESSN)
WHERE Dno = 4 AND
    Essn IN (SELECT Essn
             FROM WORKS_ON
             WHERE Pno = 10)
    AND
    Essn IN (SELECT Essn
             FROM WORKS_ON
             WHERE Pno = 20)
);    

/* get highest salary in the company */
SELECT Fname, Minit, Lname, Salary
FROM EMPLOYEE
WHERE DNO IN (SELECT DNO FROM EMPLOYEE WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE));

/* get highest salary between all departments */
SELECT  Fname, Minit, Lname, Salary
FROM EMPLOYEE
WHERE dno = ( SELECT  dno  FROM EMPLOYEE GROUP BY dno HAVING SALARY = MAX(salary) )