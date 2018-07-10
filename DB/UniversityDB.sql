 /* 
  http://sqlfiddle.com/#!9/a81ef8/7
 */
 CREATE TABLE STUDENT (
  Name VARCHAR(15) NOT NULL,
  Student_number INT NOT NULL,
  Class INT,
  Major CHAR(2),
  PRIMARY KEY (Student_Number)
  );
  

  INSERT INTO STUDENT (Name, Student_number, Class, Major)
  VALUES( 'Smith', 17, 1, 'CS');
  INSERT INTO STUDENT (Name, Student_number, Class, Major)
  VALUES( 'Brown', 8, 2, 'CS');

  CREATE TABLE COURSE (
  Course_Name VARCHAR(25) NOT NULL,
  Course_number VARCHAR(10) NOT NULL,
  Credit_hours INT,
  Department CHAR(5),
  PRIMARY KEY (Course_number)
  );
  
  INSERT INTO COURSE (Course_Name, Course_number, Credit_hours, Department)
  VALUES ('Intro to Computer Science', 'CS1310', 4, 'CS');
  INSERT INTO COURSE (Course_Name, Course_number, Credit_hours, Department)
  VALUES ('Data Structures', 'CS3320', 4, 'CS');
  INSERT INTO COURSE (Course_Name, Course_number, Credit_hours, Department)
  VALUES ('Discrete Mathematics', 'MATH2410', 3, 'MATH');
  INSERT INTO COURSE (Course_Name, Course_number, Credit_hours, Department)
  VALUES ('Database', 'CS3380', 3, 'CS');

  CREATE TABLE SECTION (
  Section_identifier INT NOT NULL,
  Course_number VARCHAR(10) NOT NULL,
  Semester VARCHAR(12) NOT NULL,
  Year CHAR(2),
  Instructor VARCHAR(20) NOT NULL,
  PRIMARY KEY(Section_identifier, Instructor),
  FOREIGN KEY (Course_number) REFERENCES COURSE(Course_number)
  );

  INSERT INTO SECTION (Section_identifier,Course_number,Semester,Year,Instructor)
  VALUES (85, 'MATH2410', 'Fall', '07', 'King');
  INSERT INTO SECTION (Section_identifier,Course_number,Semester,Year,Instructor)
  VALUES (92, 'CS1310', 'Fall', '07', 'Anderson');
  INSERT INTO SECTION (Section_identifier,Course_number,Semester,Year,Instructor)
  VALUES (102, 'CS3320', 'Sprint', '08', 'Knuth');
  INSERT INTO SECTION (Section_identifier,Course_number,Semester,Year,Instructor)
  VALUES (112, 'MATH2410', 'Fall', '08', 'Chang');
  INSERT INTO SECTION (Section_identifier,Course_number,Semester,Year,Instructor)
  VALUES (119, 'CS1310', 'Fall', '08', 'Anderson');
  INSERT INTO SECTION (Section_identifier,Course_number,Semester,Year,Instructor)
  VALUES (135, 'CS3380', 'Fall', '08', 'Stone');

  CREATE TABLE GRADE_REPORT (
Student_number INT NOT NULL,
Section_identifier INT NOT NULL,
Grade CHAR(1),
  PRIMARY KEY (Student_Number, Section_identifier),
    FOREIGN KEY (Student_Number) REFERENCES STUDENT(Student_Number),
    FOREIGN KEY (Section_identifier) REFERENCES SECTION(Section_identifier)
  );
  INSERT INTO GRADE_REPORT (Student_number, Section_identifier,Grade)
  VALUES (17,112,'B');
  INSERT INTO GRADE_REPORT (Student_number, Section_identifier,Grade)
  VALUES (17,119,'C');
  INSERT INTO GRADE_REPORT (Student_number, Section_identifier,Grade)
  VALUES (8,85,'A');
  INSERT INTO GRADE_REPORT (Student_number, Section_identifier,Grade)
  VALUES (8,92,'A');
  INSERT INTO GRADE_REPORT (Student_number, Section_identifier,Grade)
  VALUES (8,102,'B');
  INSERT INTO GRADE_REPORT (Student_number, Section_identifier,Grade)
  VALUES (8,135,'A');

  CREATE TABLE PREREQUISITE (
  Course_number VARCHAR(10) NOT NULL,
  Prerequisite_number VARCHAR(10) NOT NULL,
    PRIMARY KEY (Course_number, Prerequisite_number),
    FOREIGN KEY (Course_number) REFERENCES COURSE(Course_number)
  );

  INSERT INTO PREREQUISITE(Course_number,Prerequisite_number)
  VALUES ('CS3380', 'CS3320');
  INSERT INTO PREREQUISITE(Course_number,Prerequisite_number)
  VALUES ('CS3380', 'MATH2410');
  INSERT INTO PREREQUISITE(Course_number,Prerequisite_number)
  VALUES ('CS3320', 'CS1310');
  
  
  
/*4*/
SELECT COURSE.Course_Name
FROM  COURSE, GRADE_REPORT, STUDENT, SECTION
WHERE STUDENT.Name = 'Brown'
AND GRADE_REPORT.Student_number = STUDENT.Student_number
AND GRADE_REPORT.Section_identifier = SECTION.Section_identifier 
AND  SECTION.Course_number = COURSE.Course_number
AND SECTION.Semester = 'Fall';

/*5*/
SELECT STUDENT.Name
FROM  GRADE_REPORT, STUDENT, SECTION
WHERE GRADE_REPORT.Student_number = STUDENT.Student_number
AND GRADE_REPORT.Section_identifier = SECTION.Section_identifier 
AND (SECTION.Section_identifier = 112 OR SECTION.Section_identifier = 19);

/*6*/
SELECT STUDENT.Name
FROM  STUDENT
WHERE Class = 1 AND Major = 'CS';


/*7*/
SELECT SECTION.Course_Number AS "Course Number", SECTION.Semester, SECTION.Year, STUDENT.Name
FROM  SECTION, GRADE_REPORT, STUDENT
WHERE SECTION.Instructor = 'Anderson'
AND SECTION.Section_identifier = GRADE_REPORT.Section_identifier
AND GRADE_REPORT.Student_number = STUDENT.Student_number;

/*8*/
SELECT STUDENT.Name, COURSE.Course_name, COURSE.Course_number, COURSE.Credit_hours, SECTION.Semester, SECTION.Year, GRADE_REPORT.Grade 
FROM STUDENT, COURSE, SECTION, GRADE_REPORT 
WHERE 
STUDENT.Class = 4
AND STUDENT.Major = 'CS' 
AND STUDENT.Student_number = GRADE_REPORT.Student_number 
AND GRADE_REPORT.Section_identifier = SECTION.Section_identifier 
AND SECTION.Course_number = COURSE.Course_number;

/*9*/
SELECT COURSE.Course_name 
FROM COURSE, PREREQUISITE 
WHERE PREREQUISITE.Prerequisite_number = COURSE.Course_number 
      AND PREREQUISITE.Course_number IN (
                                        SELECT Prerequisite_number 
                                        FROM PREREQUISITE
                                        WHERE Course_number = 'CS3380'
      );
