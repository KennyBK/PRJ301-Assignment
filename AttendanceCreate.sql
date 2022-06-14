-- Create Instructor -- 
CREATE TABLE Instructor(
	InstructorID VARCHAR(30) NOT NULL PRIMARY KEY, 
	InstructorName NVARCHAR(50) NOT NULL,
	InstructorEmail VARCHAR(100) NOT NULL
)
SELECT * FROM Instructor

-- Create Student -- 
CREATE TABLE Student(
	StudentID VARCHAR(30) NOT NULL PRIMARY KEY,
	StudentCode VARCHAR(50) NOT NULL,
	StudentSurname NVARCHAR(30) NOT NULL,
	StudentMiddlename NVARCHAR(30) NOT NULL,
	StudentGivenname NVARCHAR(30) NOT NULL,
	StudentEmail VARCHAR(100) NOT NULL,
)

SELECT * FROM Student

-- Create Course --
CREATE TABLE Course(
	CourseID VARCHAR(30) NOT NULL PRIMARY KEY,
	CourseName VARCHAR(70) NOT NULL,
)

SELECT * FROM Course

-- Create Group --
CREATE TABLE [Group](
	GroupID INT NOT NULL PRIMARY KEY IDENTITY,
	GroupName VARCHAR(30) NOT NULL,
	InstructorID VARCHAR(30) NOT NULL,
	CourseID VARCHAR(30) NOT NULL 
	CONSTRAINT fk_Group_Instrutor FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID),
	CONSTRAINT fk_Group_Course FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
)

SELECT * FROM [Group]

-- Create Room --
CREATE TABLE Room(
	RoomID VARCHAR(30) NOT NULL PRIMARY KEY
)

SELECT * FROM Room

-- Create Timeslot --
CREATE TABLE Timeslot(
	TimeslotID VARCHAR(30) NOT NULL PRIMARY KEY,
	[start] TIME NOT NULL,
	[end] TIME NOT NULL
)

SELECT * FROM Timeslot

-- Create Session --
CREATE TABLE [Session](
	SessionID INT NOT NULL PRIMARY KEY IDENTITY,
	SessionNumber INT NOT NULL,
	SessionDate Date NOT NULL,
	Semester VARCHAR(20) NOT NULL,
	RoomID VARCHAR(30) NOT NULL,
	TimeslotID VARCHAR(30) NOT NULL,
	GroupID INT NOT NULL
	CONSTRAINT fk_Session_Room FOREIGN KEY (RoomID) REFERENCES Room(RoomID),
	CONSTRAINT fk_Session_Timeslot FOREIGN KEY (TimeslotID) REFERENCES Timeslot(TimeslotID),
	CONSTRAINT fk_Session_Group FOREIGN KEY (GroupID) REFERENCES [Group](GroupID)
)

SELECT * FROM [Session]

-- Create Attendance --
CREATE TABLE Attendance(
	StudentID VARCHAR(30) NOT NULL,
	SessionID INT NOT NULL,
	[Status] VARCHAR(20) NOT NULL,
	Recordtime DATETIME NOT NULL,
	Comment VARCHAR(200) NOT NULL,
	PRIMARY KEY (StudentID,SessionID),
	CONSTRAINT fk_StudentSession_Student FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
	CONSTRAINT fk_StudentSession_Sessin FOREIGN KEY (SessionID) REFERENCES [Session](SessionID)
)

SELECT * FROM Attendance

-- Create StudentGroup --
CREATE TABLE StudentGroup(
	StudentID VARCHAR(30) NOT NULL,
	GroupID INT NOT NULL
	PRIMARY KEY (StudentID,GroupID),
	CONSTRAINT fk_StudentGroup_Student FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
	CONSTRAINT fk_StudentGroup_Group FOREIGN KEY (GroupID) REFERENCES [Group](GroupID)
)

SELECT * FROM StudentGroup
