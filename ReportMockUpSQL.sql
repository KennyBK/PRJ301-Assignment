SELECT g.GroupID,g.GroupName,g.InstructorID,c.CourseID,c.CourseName FROM [Group] g join Course c on g.CourseID = c.CourseID
Where InstructorID = 'sonnt5'

SELECT s.StudentID,s.StudentCode,s.StudentSurname,s.StudentMiddlename,s.StudentGivenname,s.StudentEmail,g.GroupID,g.GroupName,g.InstructorID,g.CourseID 
FROM Student s join StudentGroup sg on s.StudentID = sg.StudentID
join [Group] g on sg.GroupID = g.GroupID
Where g.GroupID = 3

SELECT SessionID,SessionNumber,SessionDate,Semester,RoomID,TimeslotID,GroupID 
FROM [Session] 
Where GroupID = 3

SELECT a.StudentID, LOWER(a.Status) as Status,a.Recordtime,a.Comment,se.SessionID,se.SessionNumber,se.SessionDate,se.Semester,se.RoomID,se.TimeslotID,se.GroupID
FROM Attendance a join [Session] se on a.SessionID = se.SessionID
Where GroupID = 3 

SELECT a.StudentID, (CAST(CAST(COUNT(Status) as decimal(5,2))/29 as decimal(5,2)))*100 as [absent] 
FROM Attendance a join [Session] se on a.SessionID = se.SessionID
Where a.[Status] = 'absent' and se.GroupID = 3
GROUP BY a.Status,a.StudentID
