Select se.SessionID,se.SessionNumber,se.SessionDate,se.Semester,r.RoomID,t.TimeslotID,g.GroupID,t.[start],t.[end],g.GroupName,i.InstructorID,c.CourseID,c.CourseName,i.InstructorName
From 
[Session] se join Timeslot t on se.TimeslotID = t.TimeslotID
join Room r on se.RoomID = r.RoomID 
join [Group] g on se.GroupID = g.GroupID
join Course c on g.CourseID =  c.CourseID
join Instructor i on g.InstructorID = i.InstructorID
Where i.InstructorID = 'sonnt5'  AND se.SessionDate = '2022-05-09'


Select s.StudentID,s.StudentCode,s.StudentSurname,s.StudentMiddlename,s.StudentGivenname,s.StudentEmail,g.GroupID,g.GroupName,g.InstructorID,g.CourseID 
from Student s join StudentGroup sg on s.StudentID = sg.StudentID
join [Group] g on sg.GroupID = g.GroupID
Where g.GroupID = 3


INSERT INTO [dbo].[Attendance]([StudentID],[SessionID],[Status],[Recordtime],[Comment])VALUES(?,?,?,?,?)