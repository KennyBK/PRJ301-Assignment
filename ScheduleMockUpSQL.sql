Select TimeslotID,[start],[end] from Timeslot

Select ts.TimeslotID,ts.[start],ts.[end],se.SessionID,se.SessionNumber,se.SessionDate,se.Semester,se.RoomID,g.GroupID,g.GroupName,g.InstructorID,c.CourseID,c.CourseName from Timeslot ts
join [Session] se On ts.TimeslotID = se.TimeslotID 
join [Group] g On se.GroupID = g.GroupID
join Course c On g.CourseID = c.CourseID
Where SessionDate Between '2022-05-09' And '2022-05-15' AND g.InstructorID = 'sonnt5'

