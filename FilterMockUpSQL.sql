Select CourseID,CourseName from Course

Select g.GroupID,g.GroupName,g.InstructorID,c.CourseID,c.CourseName from [Group] g join Course c On g.CourseID = c.CourseID
Where c.CourseID = ?

Select s.StudentID,s.StudentCode,s.StudentSurname,s.StudentMiddlename,s.StudentGivenname,s.StudentEmail,g.GroupID,g.GroupName,g.InstructorID,g.CourseID 
from Student s join StudentGroup sg on s.StudentID = sg.StudentID
join [Group] g on sg.GroupID = g.GroupID
Where g.GroupID = ?

