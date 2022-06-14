USE [PRJ301_Assignment]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 6/14/2022 10:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[StudentID] [varchar](30) NOT NULL,
	[SessionID] [int] NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[Recordtime] [datetime] NOT NULL,
	[Comment] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 6/14/2022 10:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [varchar](30) NOT NULL,
	[CourseName] [varchar](70) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 6/14/2022 10:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](30) NOT NULL,
	[InstructorID] [varchar](30) NOT NULL,
	[CourseID] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 6/14/2022 10:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorID] [varchar](30) NOT NULL,
	[InstructorName] [nvarchar](50) NOT NULL,
	[InstructorEmail] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 6/14/2022 10:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 6/14/2022 10:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[SessionNumber] [int] NOT NULL,
	[SessionDate] [date] NOT NULL,
	[Semester] [varchar](20) NOT NULL,
	[RoomID] [varchar](30) NOT NULL,
	[TimeslotID] [varchar](30) NOT NULL,
	[GroupID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 6/14/2022 10:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [varchar](30) NOT NULL,
	[StudentCode] [varchar](50) NOT NULL,
	[StudentSurname] [nvarchar](30) NOT NULL,
	[StudentMiddlename] [nvarchar](30) NOT NULL,
	[StudentGivenname] [nvarchar](30) NOT NULL,
	[StudentEmail] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 6/14/2022 10:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGroup](
	[StudentID] [varchar](30) NOT NULL,
	[GroupID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timeslot]    Script Date: 6/14/2022 10:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timeslot](
	[TimeslotID] [varchar](30) NOT NULL,
	[start] [time](7) NOT NULL,
	[end] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TimeslotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140155', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE140777', 1, N'Absent', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'Late for class')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150167', 1, N'Absent', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'Have a medical check up')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150798', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150819', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE150915', 1, N'Absent', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'Late for class')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151210', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151282', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151356', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE151431', 1, N'Absent', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'Late for class')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153012', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153276', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153603', 1, N'Absent', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'Late for class')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153622', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE153773', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE160328', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161149', 1, N'Absent', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'Covid Checking')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161499', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161574', 1, N'Absent', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'Join then out')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161699', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161701', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161888', 1, N'Absent', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'Join then out')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE161928', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE162004', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163366', 1, N'Absent', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'Blackout')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163585', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163884', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 8, N'Absent', CAST(N'2022-05-10T10:30:00.000' AS DateTime), N'Blackout')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 9, N'Present', CAST(N'2022-05-12T08:13:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 10, N'Absent', CAST(N'2022-05-10T11:00:00.000' AS DateTime), N'late for class')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 11, N'Absent', CAST(N'2022-05-12T10:28:00.000' AS DateTime), N'Join then out')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE163937', 12, N'Absent', CAST(N'2022-05-12T11:32:00.000' AS DateTime), N'Blackout')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 1, N'Present', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 2, N'Absent', CAST(N'2022-05-11T15:45:00.000' AS DateTime), N'Dont do homework')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 3, N'Absent', CAST(N'2022-05-13T15:35:00.000' AS DateTime), N'Late for class')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 4, N'Present', CAST(N'2022-05-09T14:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 5, N'Present', CAST(N'2022-05-11T13:30:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 6, N'Present', CAST(N'2022-05-13T13:33:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164001', 7, N'Present', CAST(N'2022-05-10T08:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 1, N'Absent', CAST(N'2022-05-09T15:00:00.000' AS DateTime), N'Have a funeral')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 2, N'Absent', CAST(N'2022-05-11T15:45:00.000' AS DateTime), N'Blackout')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 3, N'Present', CAST(N'2022-05-13T15:35:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 4, N'Present', CAST(N'2022-05-09T14:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 5, N'Present', CAST(N'2022-05-11T13:30:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 6, N'Present', CAST(N'2022-05-13T13:33:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 7, N'Absent', CAST(N'2022-05-10T08:00:00.000' AS DateTime), N'Ask but dont answer')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 8, N'Present', CAST(N'2022-05-10T10:30:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 9, N'Present', CAST(N'2022-05-12T08:13:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 10, N'Present', CAST(N'2022-05-10T11:00:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 11, N'Present', CAST(N'2022-05-12T10:28:00.000' AS DateTime), N'')
INSERT [dbo].[Attendance] ([StudentID], [SessionID], [Status], [Recordtime], [Comment]) VALUES (N'HE164016', 12, N'Present', CAST(N'2022-05-12T11:32:00.000' AS DateTime), N'')
GO
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'CSD201', N'Data Structures and Algorithms')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'DBI202', N'Introduction to Databases')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'IOT102', N'Internet of Things')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'JPD113', N'Elementary Japanese 1-A1.1')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'JPD123', N'Elementary Japanese 1-A1.2')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'LAB211', N'OOP with Java Lab')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'MAS291', N'Statistics and Probability')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'PRJ301', N'Java Web Application Development')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'PRO192', N'Object-Oriented Programming')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'SWE201c', N'Introduction to Software Engineering')
INSERT [dbo].[Course] ([CourseID], [CourseName]) VALUES (N'WED201c', N'Web Design')
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([GroupID], [GroupName], [InstructorID], [CourseID]) VALUES (1, N'SE1630', N'hongdt30', N'MAS291')
INSERT [dbo].[Group] ([GroupID], [GroupName], [InstructorID], [CourseID]) VALUES (2, N'SE1623', N'sonhx', N'IOT102')
INSERT [dbo].[Group] ([GroupID], [GroupName], [InstructorID], [CourseID]) VALUES (3, N'SE1623', N'sonnt5', N'PRJ301')
INSERT [dbo].[Group] ([GroupID], [GroupName], [InstructorID], [CourseID]) VALUES (4, N'GD1611', N'thulx', N'JPD123')
INSERT [dbo].[Group] ([GroupID], [GroupName], [InstructorID], [CourseID]) VALUES (5, N'SE1624', N'trungnt', N'SWE201c')
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
INSERT [dbo].[Instructor] ([InstructorID], [InstructorName], [InstructorEmail]) VALUES (N'hongdt30', N'Dương Thị Hồng', N'hongdt30@fpt.edu.vn')
INSERT [dbo].[Instructor] ([InstructorID], [InstructorName], [InstructorEmail]) VALUES (N'Keiichiro', N'Someya Keiichiro', N'Keiichiro@fe.edu.vn')
INSERT [dbo].[Instructor] ([InstructorID], [InstructorName], [InstructorEmail]) VALUES (N'sonhx', N'Hoàng Xuân Sơn', N'SonHX@fe.edu.vn')
INSERT [dbo].[Instructor] ([InstructorID], [InstructorName], [InstructorEmail]) VALUES (N'sonnt5', N'Ngô Tùng Sơn', N'sonnt69@fe.edu.vn')
INSERT [dbo].[Instructor] ([InstructorID], [InstructorName], [InstructorEmail]) VALUES (N'thulx', N'Lại Xuân Thu', N'ThuLX@fe.edu.vn')
INSERT [dbo].[Instructor] ([InstructorID], [InstructorName], [InstructorEmail]) VALUES (N'trungnt', N'Nguyễn Tất Trung', N'TrungNT77@fe.edu.vn')
GO
INSERT [dbo].[Room] ([RoomID]) VALUES (N'AL-R202')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'BE-219')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'BE-305')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'BE-315')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'CI-420')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'DE-225')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'DE-C202')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'DE-C203')
INSERT [dbo].[Room] ([RoomID]) VALUES (N'DE-C206')
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID]) VALUES (1, 1, CAST(N'2022-05-09' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3)
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID]) VALUES (2, 2, CAST(N'2022-05-11' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3)
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID]) VALUES (3, 3, CAST(N'2022-05-13' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 5', 3)
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID]) VALUES (4, 1, CAST(N'2022-05-09' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 4', 2)
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID]) VALUES (5, 2, CAST(N'2022-05-11' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 4', 2)
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID]) VALUES (6, 3, CAST(N'2022-05-13' AS Date), N'Summer2022', N'DE-C202 ', N'Slot 4', 2)
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID]) VALUES (7, 1, CAST(N'2022-05-10' AS Date), N'Summer2022', N'DE-C203', N'Slot 1', 1)
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID]) VALUES (8, 2, CAST(N'2022-05-10' AS Date), N'Summer2022', N'DE-C203', N'Slot 2', 1)
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID]) VALUES (9, 3, CAST(N'2022-05-12' AS Date), N'Summer2022', N'DE-C203', N'Slot 1', 1)
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID]) VALUES (10, 1, CAST(N'2022-05-10' AS Date), N'Summer2022', N'DE-225', N'Slot 3', 4)
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID]) VALUES (11, 2, CAST(N'2022-05-12' AS Date), N'Summer2022', N'DE-225', N'Slot 2', 4)
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID]) VALUES (12, 3, CAST(N'2022-05-12' AS Date), N'Summer2022', N'DE-225', N'Slot 3', 4)
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID]) VALUES (13, 1, CAST(N'2022-05-21' AS Date), N'Summer2022', N'BE-305', N'Slot 2', 5)
INSERT [dbo].[Session] ([SessionID], [SessionNumber], [SessionDate], [Semester], [RoomID], [TimeslotID], [GroupID]) VALUES (14, 2, CAST(N'2022-06-11' AS Date), N'Summer2022', N'BE-305', N'Slot 2', 5)
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HA160009', N'NganNHHA160009', N'Nguyễn', N'Hà', N'Ngân', N'NganNHHA160009@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE130904', N'HoangMVHE130904', N'Mai', N'Võ', N'Hoàng', N'HoangMVHE130904@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE130927', N'LinhLVTHE130927', N'Lê', N'Vũ Tuấn', N'Linh', N'LinhLVTHE130927@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE140155', N'HuyMDHE140155', N'Mai', N'Đức', N'Huy', N'HuyMDHE140155@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE140647', N'BangVLHE140647', N'Vũ', N'Lập', N'Bang', N'BangVLHE140647@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE140777', N'DatNTHE140777', N'Nguyễn', N'Thành', N'Đạt', N'DatNTHE140777@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE140954', N'HuyHMHE140954', N'Hoàng', N'Minh', N'Huy', N'HuyHMHE140954@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE140986', N'LongNBHE140986', N'Nguyễn', N'Bảo', N'Long', N'LongNBHE140986@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE141083', N'DongDVHE141083', N'Đinh', N'Văn', N'Đông', N'DongDVHE141083@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE141491', N'AnhNVHE141491', N'Nguyễn', N'Việt', N'Anh', N'AnhNVHE141491@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE141683', N'HuyBQHE141683', N'Bùi', N'Quốc', N'Huy', N'HuyBQHE141683@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE150013', N'MinhNHHE150013', N'Nguyễn', N'Hoàng', N'Minh', N'MinhNHHE150013@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE150167', N'QuyetNHHE150167', N'Nguyễn', N'Hữu', N'Quyết', N'QuyetNHHE150167@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE150469', N'DucTAHE150469', N'Trịnh', N'Anh', N'Đức', N'DucTAHE150469@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE150798', N'VuCQHE150798', N'Chu', N'Quang', N'Vũ', N'VuCQHE150798@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE150819', N'TuyenNVHE150819', N'Nguyễn', N'Văn', N'Tuyên', N'TuyenNVHE150819@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE150865', N'OanhNTKHE150865', N'Nguyễn', N'Thị Kim', N'Oanh', N'OanhNTKHE150865@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE150915', N'DungNTHE150915', N'Nguyễn', N'Tuấn', N'Dũng', N'DungNTHE150915@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151158', N'ThanhTTHE151158', N'Trần', N'Tiến', N'Thành', N'ThanhTTHE151158@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151192', N'MinhNAHE151192', N'Nguyễn', N'Anh', N'Minh', N'MinhNAHE151192@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151210', N'KienVDHE151210', N'Vũ', N'Đức', N'Kiên', N'KienVDHE151210@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151282', N'QuanLNMHE151282', N'Lê', N'Nguyễn Minh', N'Quân', N'QuanLNMHE151282@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151297', N'BachHXHE151297', N'Hoàng', N'Xuân', N'Bách', N'BachHXHE151297@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151321', N'HieuTVHE151321', N'Tạ', N'Văn', N'Hiếu', N'HieuTVHE151321@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151356', N'TungNHHE151356', N'Nguyễn', N'Huy', N'Tùng', N'TungNHHE151356@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151366', N'SonNNHE151366', N'Nguyễn', N'Ngọc', N'Sơn', N'SonNNHE151366@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151407', N'AnhPHVHE151407', N'Phạm', N'Hữu Việt', N'Anh', N'AnhPHVHE151407@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE151431', N'TuyetDAHE151431', N'Đặng', N'Ánh', N'Tuyết', N'TuyetDAHE151431@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153012', N'HuyPNDHE153012', N'Phan', N'Nguyễn Đăng', N'Huy', N'HuyPNDHE153012@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153257', N'DungLAHE153257', N'Lê', N'Anh', N'Dũng', N'DungLAHE153257@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153263', N'AnhLHHE153263', N'Lương', N'Huy', N'Anh', N'AnhLHHE153263@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153276', N'AnhPQHE153276', N'Phạm', N'Quang', N'Anh', N'AnhPQHE153276@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153306', N'DongPHHE153306', N'Phan', N'Hữu', N'Đông', N'DongPHHE153306@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153311', N'HungNKHE153311', N'Nguyễn', N'Khâm', N'Hưng', N'HungNKHE153311@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153330', N'HieuDNHE153330', N'Đinh', N'Nghĩa', N'Hiếu', N'HieuDNHE153330@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153527', N'HieuLDLHE153527', N'Lương', N'Đức Lê', N'Hiệu', N'HieuLDLHE153527@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153602', N'HoangCMHE153602', N'Cao', N'Mạnh', N'Hoàng', N'HoangCMHE153602@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153603', N'ThuBTXHE153603', N'Bùi', N'Thị Xuân', N'Thu', N'ThuBTXHE153603@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153622', N'HungNDHE153622', N'Nguyễn', N'Duy', N'Hưng', N'HungNDHE153622@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153711', N'AnhPVHE153711', N'Phùng', N'Việt', N'Anh', N'AnhPVHE153711@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE153773', N'QuyetNVHE153773', N'Nguyễn', N'Văn', N'Quyết', N'QuyetNVHE153773@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160085', N'MinhPNHE160085', N'Phạm', N'Nhật', N'Minh', N'MinhPNHE160085@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160099', N'KhanhTMHE160099', N'Trần', N'Minh', N'Khánh', N'KhanhTMHE160099@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160152', N'TungLQHE160152', N'Lê', N'Quang', N'Tùng', N'TungLQHE160152@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160328', N'HaLHHE160328', N'Lê', N'Hải', N'Hà', N'HaLHHE160328@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160369', N'ThuyenNAHE160369', N'Nguyễn', N'An', N'Thuyên', N'ThuyenNAHE160369@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160473', N'ChauCNBHE160473', N'Cấn', N'Nguyễn Bảo', N'Châu', N'ChauCNBHE160473@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160531', N'HoangNHHE160531', N'Nguyễn', N'Huy', N'Hoàng', N'HoangNHHE160531@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160537', N'BinhPHHE160537', N'Phạm', N'Hải', N'Bình', N'BinhPHHE160537@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160629', N'KienHDHE160629', N'Huỳnh', N'Đức', N'Kiên', N'KienHDHE160629@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160643', N'AnhKTHHE160643', N'Khổng', N'Thị Hồng', N'Anh', N'AnhKTHHE160643@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160770', N'ThanhNCHE160770', N'Nguyễn', N'Công', N'Thành', N'ThanhNCHE160770@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160809', N'AnhVQHE160809', N'Vương', N'Quốc', N'Anh', N'AnhVQHE160809@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE160853', N'DanNTHE160853', N'Nguyễn', N'Thừa', N'Đan', N'DanNTHE160853@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161082', N'LyNPHE161082', N'Nguyễn', N'Phương', N'Ly', N'LyNPHE161082@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161089', N'HienTTHE161089', N'Trần', N'Trọng', N'Hiển', N'HienTTHE161089@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161149', N'LongPKHE161149', N'Phan', N'Kim', N'Long', N'LongPKHE161149@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161153', N'TuanKMHE161153', N'Kiều', N'Mạnh', N'Tuấn', N'TuanKMHE161153@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161201', N'TrungNDHE161201', N'Nguyễn', N'Đức', N'Trung', N'TrungNDHE161201@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161203', N'LamNHTHE161203', N'Nguyễn', N'Huy Tùng', N'Lâm', N'LamNHTHE161203@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161300', N'LinhVKHE161300', N'Vũ', N'Khánh', N'Linh', N'LinhVKHE161300@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161318', N'TungNQHE161318', N'Nguyễn', N'Quang', N'Tùng', N'TungNQHE161318@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161371', N'DatNMHE161371', N'Nguyễn', N'Minh', N'Đạt', N'DatNMHE161371@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161448', N'HaiPHHHE161448', N'Phạm', N'Hoàng Hồng', N'Hải', N'HaiPHHHE161448@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161496', N'PhuDQHE161496', N'Đào', N'Quang', N'Phú', N'PhuDQHE161496@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161499', N'HuyLQHE161499', N'Lê', N'Quang', N'Huy', N'HuyLQHE161499@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161530', N'HuyVNHE161530', N'Vũ', N'Ngọc', N'Huy', N'HuyVNHE161530@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161574', N'HoangPHHE161574', N'Phạm', N'Huy', N'Hoàng', N'HoangPHHE161574@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161575', N'MinhNDHE161575', N'Ngô', N'Đức', N'Minh', N'MinhNDHE161575@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161581', N'VuPLHE161581', N'Phạm', N'Long', N'Vũ', N'VuPLHE161581@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161637', N'HuyDTQHE161637', N'Đỗ', N'Trần Quang', N'Huy', N'HuyDTQHE161637@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161697', N'MinhDNHE161697', N'Đặng', N'Nhật', N'Minh', N'MinhDNHE161697@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161699', N'HungTQHE161699', N'Trần', N'Quốc', N'Hưng', N'HungTQHE161699@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161701', N'DatDTHE161701', N'Đoàn', N'Tiến', N'Đạt', N'DatDTHE161701@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161722', N'KhanhTQHE161722', N'Trương', N'Quốc', N'Khánh', N'KhanhTQHE161722@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161827', N'SonDCHE161827', N'Dương', N'Công', N'Sơn', N'SonDCHE161827@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161880', N'DuongVHHE161880', N'Vũ', N'Hoàng', N'Dương', N'DuongVHHE161880@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161887', N'MinhTDHE161887', N'Trần', N'Đức', N'Minh', N'MinhTDHE161887@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161888', N'SonKAHE161888', N'Kiều', N'Anh', N'Sơn', N'SonKAHE161888@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161928', N'BaoNNHE161928', N'Nguyễn', N'Ngọc', N'Bảo', N'BaoNNHE161928@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE161943', N'VinhVHHE161943', N'Vũ', N'Hoàng', N'Vinh', N'VinhVHHE161943@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE162004', N'SonNHHE162004', N'Nguyễn', N'Hồng', N'Sơn', N'SonNHHE162004@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163016', N'LongNTHE163016', N'Nguyễn', N'Thanh', N'Long', N'LongNTHE163016@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163037', N'DungCQHE163037', N'Cao', N'Quốc', N'Dũng', N'DungCQHE163037@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163054', N'KienNHHE163054', N'Nguyễn', N'Hoàng', N'Kiên', N'KienNHHE163054@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163060', N'QuangTDHE163060', N'Triệu', N'Đình', N'Quang', N'QuangTDHE163060@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163087', N'MyDTTHE163087', N'Đỗ', N'Thị Trà', N'My', N'MyDTTHE163087@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163088', N'HoaBNHE163088', N'Bế', N'Ngọc', N'Hoa', N'HoaBNHE163088@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163104', N'HieuNVHE163104', N'Nguyễn', N'Văn', N'Hiếu', N'HieuNVHE163104@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163168', N'VietBHHE163168', N'Bùi', N'Hoàng', N'Việt', N'VietBHHE163168@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163189', N'KhanhPDHE163189', N'Phạm', N'Duy', N'Khánh', N'KhanhPDHE163189@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163229', N'LocCXHE163229', N'Cao', N'Xuân', N'Lộc', N'LocCXHE163229@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163253', N'MaiNTTHE163253', N'Nguyễn', N'Thị Tuyết', N'Mai', N'MaiNTTHE163253@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163324', N'DatTTHE163324', N'Trần', N'Tiến', N'Đạt', N'DatTTHE163324@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163340', N'ThuTVHE163340', N'Trần', N'Việt', N'Thu', N'ThuTVHE163340@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163350', N'AnhNLVHE163350', N'Nguyễn', N'Lê Việt', N'Anh', N'AnhNLVHE163350@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163366', N'VinhNTHE163366', N'Nguyễn', N'Thế', N'Vinh', N'VinhNTHE163366@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163386', N'KhaiDDHE163386', N'Đỗ', N'Đức', N'Khải', N'KhaiDDHE163386@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163387', N'LongNTHE163387', N'Nguyễn', N'Thành', N'Long', N'LongNTHE163387@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163390', N'DatNDHE163390', N'Nguyễn', N'Doãn', N'Đạt', N'DatNDHE163390@fpt.edu.vn')
GO
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163411', N'BachLCHE163411', N'Lê', N'Công', N'Bách', N'BachLCHE163411@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163419', N'AnhNVHE163419', N'Nguyễn', N'Vương', N'Anh', N'AnhNVHE163419@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163428', N'TrangDPHE163428', N'Dương', N'Phúc', N'Tráng', N'TrangDPHE163428@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163444', N'DucDHHE163444', N'Dương', N'Hải', N'Đức', N'DucDHHE163444@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163488', N'ManhNVHE163488', N'Nguyễn', N'Văn', N'Mạnh', N'ManhNVHE163488@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163519', N'ManhDNHE163519', N'Đỗ', N'Như', N'Mạnh', N'ManhDNHE163519@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163538', N'HuyNTDHE163538', N'Nguyễn', N'Trọng Đức', N'Huy', N'HuyNTDHE163538@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163585', N'VuNTHE163585', N'Nguyễn', N'Trung', N'Vũ', N'VuNTHE163585@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163594', N'TungLVHE163594', N'Lưu', N'Việt', N'Tùng', N'TungLVHE163594@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163614', N'MinhKTHE163614', N'Khuất', N'Tiến', N'Minh', N'MinhKTHE163614@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163615', N'DatNLMHE163615', N'Nguyễn', N'Lê Minh', N'Đạt', N'DatNLMHE163615@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163678', N'ChienHVHE163678', N'Hà', N'Viết', N'Chiến', N'ChienHVHE163678@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163751', N'NamDTHE163751', N'Đinh', N'Thế', N'Nam', N'NamDTHE163751@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163777', N'HoaNDHE163777', N'Nguyễn', N'Đức', N'Hoà', N'HoaNDHE163777@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163781', N'DangNHHE163781', N'Nguyễn', N'Hải', N'Đăng', N'DangNHHE163781@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163884', N'HoangNMHE163884', N'Nguyễn', N'Minh', N'Hoàng', N'HoangNMHE163884@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163937', N'MinhNHHE163937', N'Nguyễn', N'Hoàng', N'Minh', N'MinhNHHE163937@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE163971', N'DungNDHE163971', N'Nguyễn', N'Đắc', N'Dũng', N'DungNDHE163971@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE164001', N'DuyNTHE164001', N'Nguyễn', N'Thế', N'Duy', N'DuyNTHE164001@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE164016', N'NguyenPDTHE164016', N'Phạm', N'Danh Trung', N'Nguyên', N'NguyenPDTHE164016@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HE169003', N'HuyLNTHE169003', N'Lô', N'Nguyễn Thành', N'Huy', N'HuyLNTHE169003@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HS150072', N'LinhHHHS150072', N'Hứa', N'Hoài', N'Linh', N'LinhHHHS150072@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HS150447', N'NguyetTTAHS150447', N'Trần', N'Thị Ánh', N'Nguyệt', N'NguyetTTAHS150447@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HS153184', N'HienNDHS153184', N'Nguyễn', N'Đức', N'Hiển', N'HienNDHS153184@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HS160522', N'CuongNHHS160522', N'Nguyễn', N'Hùng', N'Cường', N'CuongNHHS160522@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'HS160970', N'TungNXHS160970', N'Nguyễn', N'Xuân', N'Tùng', N'TungNXHS160970@fpt.edu.vn')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [StudentSurname], [StudentMiddlename], [StudentGivenname], [StudentEmail]) VALUES (N'SE04535', N'MinhTDQSE04535', N'Trần', N'Đặng Quang', N'Minh', N'MinhTDQSE04535@fpt.edu.vn')
GO
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HA160009', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE130904', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE130927', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE140155', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE140647', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE140777', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE140954', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE140986', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE141083', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE141491', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE141683', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150013', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150167', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150469', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150469', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150798', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150819', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150865', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE150915', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151158', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151192', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151210', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151282', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151297', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151297', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151297', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151321', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151356', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151366', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151366', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151407', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151407', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE151431', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153012', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153257', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153263', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153276', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153306', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153311', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153330', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153527', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153602', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153603', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153622', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153711', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE153773', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160085', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160099', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160152', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160328', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160369', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160473', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160531', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160537', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160629', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160643', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160770', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160809', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE160853', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161082', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161089', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161149', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161149', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161153', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161201', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161203', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161300', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161318', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161371', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161448', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161496', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161499', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161499', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161530', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161574', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161574', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161574', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161575', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161581', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161637', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161637', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161637', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161697', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161697', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161697', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161699', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161699', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161699', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161701', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161701', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161722', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161827', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161880', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161887', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161888', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161888', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161888', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161928', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161928', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161928', 5)
GO
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE161943', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE162004', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163016', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163037', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163054', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163060', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163087', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163088', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163104', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163168', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163189', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163229', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163253', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163324', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163340', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163350', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163366', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163386', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163387', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163390', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163411', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163419', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163428', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163444', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163488', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163519', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163538', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163585', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163585', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163585', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163585', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163585', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163594', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163614', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163615', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163678', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163751', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163777', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163777', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163781', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163884', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163884', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163937', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163937', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163937', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163937', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163937', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE163971', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164001', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164001', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164001', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164001', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164001', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164016', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164016', 2)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164016', 3)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164016', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE164016', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HE169003', 1)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HS150072', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HS150447', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HS153184', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HS160522', 4)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'HS160970', 5)
INSERT [dbo].[StudentGroup] ([StudentID], [GroupID]) VALUES (N'SE04535', 5)
GO
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 1', CAST(N'07:30:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 2', CAST(N'09:10:00' AS Time), CAST(N'10:40:00' AS Time))
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 3', CAST(N'10:50:00' AS Time), CAST(N'12:20:00' AS Time))
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 4', CAST(N'12:50:00' AS Time), CAST(N'14:20:00' AS Time))
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 5', CAST(N'14:30:00' AS Time), CAST(N'16:00:00' AS Time))
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 6', CAST(N'16:10:00' AS Time), CAST(N'17:40:00' AS Time))
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 7', CAST(N'17:50:00' AS Time), CAST(N'19:20:00' AS Time))
INSERT [dbo].[Timeslot] ([TimeslotID], [start], [end]) VALUES (N'Slot 8', CAST(N'19:30:00' AS Time), CAST(N'21:00:00' AS Time))
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [fk_StudentSession_Sessin] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([SessionID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [fk_StudentSession_Sessin]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [fk_StudentSession_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [fk_StudentSession_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [fk_Group_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [fk_Group_Course]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [fk_Group_Instrutor] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructor] ([InstructorID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [fk_Group_Instrutor]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [fk_Session_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [fk_Session_Group]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [fk_Session_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [fk_Session_Room]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [fk_Session_Timeslot] FOREIGN KEY([TimeslotID])
REFERENCES [dbo].[Timeslot] ([TimeslotID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [fk_Session_Timeslot]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [fk_StudentGroup_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [fk_StudentGroup_Group]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [fk_StudentGroup_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [fk_StudentGroup_Student]
GO
