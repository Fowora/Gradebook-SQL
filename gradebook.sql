--Board Creation
DROP TABLE IF EXISTS STUDENT;
CREATE TABLE STUDENT (
    FirstName varchar(255) DEFAULT NULL,
    LastName varchar(255) DEFAULT NULL,
    Major varchar(255) DEFAULT NULL,
    StudentID int(11) NOT NULL ,
  	PRIMARY KEY(StudentID)
);

DROP TABLE IF EXISTS COURSE;
CREATE TABLE `COURSE` (
    `Department` varchar(255) NOT NULL,
    `CourseNumber` int(11) NOT NULL,
    `CourseName` varchar(255) NOT NULL,
    `Term` varchar(255) NOT NULL,
    `Year` int(5) NOT NULL,
    `CourseID` int(11),
    PRIMARY KEY(`CourseID`)
);

DROP TABLE IF EXISTS `SCORE`;
CREATE TABLE `SCORE` (
    `StudentID` int(11) NOT NULL,
    `AssignmentID` int(11) NOT NULL,
    `POINTS` int(11) DEFAULT 0 NOT NULL,
    PRIMARY KEY (`StudentID`, `AssignmentID`)
);


DROP TABLE IF EXISTS `ASSIGNMENT`;
CREATE TABLE `ASSIGNMENT` (
    `AssignmentID` int(11) NOT NULL UNIQUE ,
    `DistributionID` int(11) NOT NULL,
    `PointsPossible` int(11) DEFAULT 0 NOT NULL,
    PRIMARY KEY (`AssignmentID`)
);


DROP TABLE IF EXISTS `DISTRIBUTION`;
CREATE TABLE `DISTRIBUTION` (
    `DistributionID` int(11) NOT NULL UNIQUE,
    `CourseID` int(11) NOT NULL,
    `CategoryName` varchar(30) NOT NULL,
    `Percentage` int(11) NOT NULL,
    PRIMARY KEY(`DistributionID`)
);


DROP TABLE IF EXISTS `ENROLLMENT`;
CREATE TABLE `ENROLLMENT` (
    `StudentID` int(11) NOT NULL,
    `CourseID` int(11) NOT NULL,
    PRIMARY KEY (`StudentID`, `CourseID`)
);

--end of Table Creation

--Inserting new values to student
INSERT INTO `STUDENT` VALUES('Chris', 'Peters', 'Computer Science', 02468021);
INSERT INTO `STUDENT` VALUES('Fareed', 'Balogun', 'Computer Engineering', 08863456);
INSERT INTO `STUDENT` VALUES('Tise', 'Ayo-Idowu', 'Mechanical Engineering', 05324590);
INSERT INTO `STUDENT` VALUES('Duncan', 'Dunkwu', 'Mechanical Engineering', 09875337);
INSERT INTO `STUDENT` VALUES('Jarell', 'King', 'Chemical Engineering', 03295678);
INSERT INTO `STUDENT` VALUES('Chadille', 'Qones', 'Chemistry', 08575655);

INSERT INTO `COURSE` VALUES('Computer Science', 350, 'Programming Languages', 'Spring', 2020, 89994);
INSERT INTO `COURSE` VALUES('Math', 156, 'Calculus-1', 'Fall', 2020, 85675);
INSERT INTO `COURSE` VALUES('Chemistry', 102, 'General Chemistry 1', 'Fall', 2020, 56738);

--Inserting new values to enrollment
INSERT INTO `ENROLLMENT` VALUES(02468021, 89994);
INSERT INTO `ENROLLMENT` VALUES(08863456, 89994);

INSERT INTO `ENROLLMENT` VALUES(05324590, 85675);
INSERT INTO `ENROLLMENT` VALUES(09875337, 85675);

INSERT INTO `ENROLLMENT` VALUES(03295678, 56738);
INSERT INTO `ENROLLMENT` VALUES(08575655, 56738);





--inserting new values to Distribution
INSERT INTO `DISTRIBUTION` VALUES(1, 85675, 'Quiz', 0.15);
INSERT INTO `DISTRIBUTION` VALUES(2, 85675, 'HW', 0.20);
INSERT INTO `DISTRIBUTION` VALUES(3, 85675, 'MidTerm', 0.25);
INSERT INTO `DISTRIBUTION` VALUES(4, 85675, 'Final', 0.40);

INSERT INTO `DISTRIBUTION` VALUES(5, 89994, 'Quiz', 0.10);
INSERT INTO `DISTRIBUTION` VALUES(6, 89994, 'HW', 0.40);
INSERT INTO `DISTRIBUTION` VALUES(7, 89994, 'MidTerm', 0.15);
INSERT INTO `DISTRIBUTION` VALUES(8, 89994, 'Final', 0.35);

INSERT INTO `DISTRIBUTION` VALUES(9, 56738, 'Quiz', 0.10);
INSERT INTO `DISTRIBUTION` VALUES(10, 56738, 'HW', 0.30);
INSERT INTO `DISTRIBUTION` VALUES(11, 56738, 'MidTerm', 0.20);
INSERT INTO `DISTRIBUTION` VALUES(12, 56738, 'Final', 0.40);



--inserting new values to Assignment
INSERT INTO `ASSIGNMENT` VALUES(1, 1, 100);
INSERT INTO `ASSIGNMENT` VALUES(2, 2, 100);
INSERT INTO `ASSIGNMENT` VALUES(3, 3, 100);
INSERT INTO `ASSIGNMENT` VALUES(4, 4, 100);

INSERT INTO `ASSIGNMENT` VALUES(5, 5, 100);
INSERT INTO `ASSIGNMENT` VALUES(6, 6, 100);
INSERT INTO `ASSIGNMENT` VALUES(7, 7, 100);
INSERT INTO `ASSIGNMENT` VALUES(8, 8, 100);

INSERT INTO `ASSIGNMENT` VALUES(9, 9, 100);
INSERT INTO `ASSIGNMENT` VALUES(10, 10, 100);
INSERT INTO `ASSIGNMENT` VALUES(11, 11, 100);
INSERT INTO `ASSIGNMENT` VALUES(12, 12, 100);

--inserting scores
INSERT INTO `SCORE` VALUES(02468021, 5, 92);
INSERT INTO `SCORE` VALUES(02468021, 6, 94);
INSERT INTO `SCORE` VALUES(02468021, 7, 90);
INSERT INTO `SCORE` VALUES(02468021, 8, 96);

INSERT INTO `SCORE` VALUES(08863456, 5, 96);
INSERT INTO `SCORE` VALUES(08863456, 6, 88);
INSERT INTO `SCORE` VALUES(08863456, 7, 86);
INSERT INTO `SCORE` VALUES(08863456, 8, 90);

INSERT INTO `SCORE` VALUES(05324590, 1, 100);
INSERT INTO `SCORE` VALUES(05324590, 2, 70);
INSERT INTO `SCORE` VALUES(05324590, 3, 80);
INSERT INTO `SCORE` VALUES(05324590, 4, 90);

INSERT INTO `SCORE` VALUES(09875337, 1, 40);
INSERT INTO `SCORE` VALUES(09875337, 2, 80);
INSERT INTO `SCORE` VALUES(09875337, 3, 90);
INSERT INTO `SCORE` VALUES(09875337, 4, 86);

INSERT INTO `SCORE` VALUES(03295678, 9, 100);
INSERT INTO `SCORE` VALUES(03295678, 10, 95);
INSERT INTO `SCORE` VALUES(03295678, 11, 100);
INSERT INTO `SCORE` VALUES(03295678, 12, 90);

INSERT INTO `SCORE` VALUES(08575655, 9, 70);
INSERT INTO `SCORE` VALUES(08575655, 10, 80);
INSERT INTO `SCORE` VALUES(08575655, 11, 90);
INSERT INTO `SCORE` VALUES(08575655, 12, 100);


SELECT* FROM STUDENT;
SELECT* FROM COURSE;
SELECT* FROM ASSIGNMENT;
SELECT* FROM SCORE;
SELECT* FROM ENROLLMENT;

--4
SELECT AVG(points)  
FROM SCORE
WHERE assignmentid = 1;

SELECT MAX(points)
FROM SCORE
WHERE assignmentid = 1;

SELECT MIN(points)
FROM SCORE
WHERE assignmentid = 1;


--5
select FirstName,LastName  from STUDENT where StudentID in (select StudentID from ENROLLMENT where CourseID=85675);


--6
SELECT STUDENT.firstname,STUDENT.lastname, SCORE.points,SCORE.assignmentid, ENROLLMENT.courseid 
from ENROLLMENT

left join STUDENT 

on ENROLLMENT.StudentID = STUDENT.studentid

LEFT join SCORE
on STUDENT.studentid = SCORE.studentid

where ENROLLMENT.CourseID=85675;

--Question 7:Add an assignment to a course;
INSERT INTO `DISTRIBUTION` VALUES(13, 89994, 'HW2', .2);
INSERT INTO `ASSIGNMENT` VALUES(13, 13, 100);

--Question 8:
UPDATE DISTRIBUTION
SET percentage =.2
WHERE distributionid=6;
SELECT* from DISTRIBUTION;

INSERT INTO `SCORE` VALUES(02468021, 13, 70);
INSERT INTO `SCORE` VALUES(08863456, 13, 90);


-- Question 9:

SELECT * from SCORE

Where assignmentid=4;

UPDATE SCORE

Set points= points+2

where assignmentid=4;

SELECT * from SCORE

Where assignmentid=4;

--Question 10:
SELECT STUDENT.FirstName, STUDENT.lastname,SCORE.AssignmentID,SCORE.points from SCORE
Join STUDENT
ON SCORE.studentid=STUDENT.StudentID
WHERE SCORE.studentid IN( SELECT STUDENT.studentid From STUDENT WHERE
                        CHARINDEX('Q',lastname)

						or CHARINDEX('Q',firstname)

						or CHARINDEX('q',firstname)

						or CHARINDEX('q',lastname)
                      	)

And SCORE.assignmentid=9;
--------------------------------------------------------------------
UPDATE SCORE
SET 
    points = points+2
WHERE SCORE.studentid IN( SELECT STUDENT.studentid From STUDENT WHERE
                        CHARINDEX('Q',lastname)

						or CHARINDEX('Q',firstname)

						or CHARINDEX('q',firstname)

						or CHARINDEX('q',lastname)
                      	);
---------------------------------------------------------------------
SELECT* from SCORE

WHERE SCORE.studentid IN( SELECT STUDENT.studentid From STUDENT WHERE
                        CHARINDEX('Q',lastname)

						or CHARINDEX('Q',firstname)

						or CHARINDEX('q',firstname)

						or CHARINDEX('q',lastname)
                      	)
And SCORE.assignmentid=9;


--11
Select STUDENT.firstname, STUDENT.lastname, ASSIGNMENT.assignmentid, DISTRIBUTION.percentage, SCORE.points, ASSIGNMENT.pointspossible

From STUDENT
JOIN SCORE
on STUDENT.studentid=score.StudentID

JOIN ASSIGNMENT
on SCORE.AssignmentID= ASSIGNMENT.assignmentid

join DISTRIBUTION
on ASSIGNMENT.DistributionID=DISTRIBUTION.distributionid

where STUDENT.studentid=08863456;

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
SELECT  SUM((P.points)*P.percentage) 
from (Select STUDENT.firstname, STUDENT.lastname, ASSIGNMENT.assignmentid, DISTRIBUTION.percentage, SCORE.points, ASSIGNMENT.pointspossible

From STUDENT
JOIN SCORE
on STUDENT.studentid=score.StudentID

JOIN ASSIGNMENT
on SCORE.AssignmentID= ASSIGNMENT.assignmentid

join DISTRIBUTION
on ASSIGNMENT.DistributionID=DISTRIBUTION.distributionid

where STUDENT.studentid=08863456) P
;
--12
select sum( distinct pt.Points*pt.Percentage) *1/(1 -( select zt.Percentage From 
((SELECT StudentID, CourseID, CategoryName, ASSIGNMENT.AssignmentID, Points, Percentage
FROM DISTRIBUTION JOIN ASSIGNMENT JOIN SCORE
WHERE DISTRIBUTION.DistributionID = ASSIGNMENT.DistributionID
AND ASSIGNMENT.AssignmentID = SCORE.AssignmentID And CategoryName = 'HW') zt)))
FROM (
SELECT STUDENT.StudentID, AssignmentID, FirstName, LastName, CourseID, Points
FROM STUDENT JOIN ENROLLMENT JOIN SCORE
WHERE STUDENT.StudentID = ENROLLMENT.StudentID
AND STUDENT.StudentID = SCORE.StudentID) st
JOIN
(SELECT StudentID, CourseID,CategoryName, ASSIGNMENT.AssignmentID, Points, Percentage
FROM DISTRIBUTION JOIN ASSIGNMENT JOIN SCORE
WHERE DISTRIBUTION.DistributionID = ASSIGNMENT.DistributionID
AND ASSIGNMENT.AssignmentID = SCORE.AssignmentID) pt
WHERE st.AssignmentID = pt.AssignmentID
AND st.Points = pt.Points AND st.StudentID=08863456 AND pt.CourseID = 89994 AND Not CategoryName= 'HW';
