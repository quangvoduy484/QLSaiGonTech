﻿CREATE DATABASE QLSGT
DROP DATABASE QLSGT

--CREATE TABLE ACADEMICYEAR (NĂM HOC VD: 2015-2016)--
CREATE TABLE ACADEMICYEAR(
	ID_ACADEMICYEAR CHAR(7) NOT NULL PRIMARY KEY DEFAULT dbo.AUTO_ACA(),
	ID_YEAR INT NOT NULL,
	ACADEMICNAME NVARCHAR(20) NULL
);

--CREATE TABLE CANDIDATETYPE (XẾP LOẠI THÍ SINH VD: BTH, MIỄN THI MÔN ABC)--
CREATE TABLE CANDIDATETYPE(
	ID_CANDIDATE CHAR(7) NOT NULL PRIMARY KEY DEFAULT dbo.AUTO_CAN(),
	CANDIDATENAME NVARCHAR(100) NULL
);

--CREATE TABLE EDUCATION (PHÂN LOẠI SINH VIÊN VD: ĐÃ TỐT NGHIỆP, ĐANG HỌC LỚP 10,11,12)--
CREATE TABLE EDUCATION(
	ID_EDUCATION CHAR(7) NOT NULL PRIMARY KEY DEFAULT dbo.AUTO_EDU(),
	EDUCATIONNAME NVARCHAR(100) NULL
);

--CREATE TABLE INPUTTYPE (KIỂU INPUT VD: TEXT, CHECKBOX, COMBOBOX)--
CREATE TABLE INPUT(
	ID_INPUT INT NOT NULL IDENTITY PRIMARY KEY,
	INPUTNAME CHAR(40) NULL
);

--CREATE TABLE INTAKES (KHÓA NHẬP HỌC VD: 2015, 2016, 2017)--
CREATE TABLE INTAKES(
	ID_INTAKES CHAR(7) NOT NULL PRIMARY KEY DEFAULT dbo.AUTO_INT(),
	INTAKENAME INT NULL
);

--CREATE TABLE STAGE (ĐỢT TUYỂN SINH VD: STAGE1, STAGE2)--
CREATE TABLE STAGE(
	ID_STAGE CHAR(7) NOT NULL PRIMARY KEY DEFAULT dbo.AUTO_STA(),
	ID_SEMESTER CHAR(7) NOT NULL,
	ID_INTAKES CHAR(7) NOT NULL,
	STAGENAME NVARCHAR(100) NULL,
	ADMISSIONS_DATE DATE NULL,
	EXAM_DATE DATE NULL,
	EXAM_TIME CHAR(20) NULL,
	TIMEOFENGLISHEXAM CHAR(20) NULL
);

--CREATE TABLE PROFILETYPE (PHÂN LOẠI HỒ SƠ VD: GIẤY KHÁM SỨC KHỎE, HÌNH 3x4,....)--
CREATE TABLE PROFILETYPE(
	ID_PROFILE INT NOT NULL IDENTITY PRIMARY KEY,
	ID_INPUT INT NOT NULL,
	ID_STATUS INT NOT NULL,
	ENGLISH_NAME VARCHAR(100) NULL,
	VIETNAMESE_NAME NVARCHAR(100) NULL,
	SEQUENCE_NUM INT NULL,
	NOTE NVARCHAR(MAX) NULL
);

--CREATE TABLE SEMESTER (HỌC KÌ VD: MÙA XUÂN, HÈ, THU)--
CREATE TABLE SEMESTER(
	ID_SEMESTER CHAR(7) NOT NULL PRIMARY KEY DEFAULT dbo.AUTO_SEM(),
	ID_ACADEMICYEAR CHAR(7) NULL,
	SEMESTER_NAME NVARCHAR(50) NULL
);

--CREATE TABLE STATUS (TRẠNG THÁI HỒ SƠ VD: INACTIVE, ACTIVE ENG, ACTIVE VN...)--
CREATE TABLE STATUS(
	ID_STATUS INT NOT NULL IDENTITY PRIMARY KEY,
	STATUS_NAME NVARCHAR(50)
);

--CREATE TABLE CANDIDATEPROFILE (HỒ SƠ THÍ SINH)--
CREATE TABLE CANDIDATEPROFILE(
	ID_CANDIDATEPROFILE INT NOT NULL IDENTITY PRIMARY KEY,
	CANDIDATE_PROFILE_NAME NVARCHAR(100) NULL,
	ID_STUDENT INT NULL,
	ID_PROFILE INT NULL
);

--CREATE TABLE STUDENT (THÔNG TIN THÍ SINH)--
CREATE TABLE STUDENT(
	ID_EDUCATION CHAR(7) NULL,
	ID_INTAKES CHAR(7) NULL,
	ID_CADIDATE CHAR(7) NULL,
	ID_PROGRAM CHAR(7) NULL,
	ID_STUDENT INT NOT NULL IDENTITY PRIMARY KEY,
    LASTNAME NVARCHAR(20) NULL,
    FIRSTNAME NVARCHAR(20) NULL,
    BIRTHDAY DATE NULL,
    GENDER CHAR(6) NULL,
    PHONE CHAR(20) NULL,
    WARDS NVARCHAR(50) NULL,
    DISTRICT NVARCHAR(50) NULL,
    PROVINCE NVARCHAR(50) NULL,
    NATION NVARCHAR(50) NULL,
    PLACEOFBIRTH NVARCHAR(100) NULL,
    MARITAL_STATUS VARCHAR(20) NULL,
    HOMEPHONE VARCHAR(20) NULL,
    HIGHSCHOOLNAME NVARCHAR(50) NULL,
    HIGHSCHOOLCITY NVARCHAR(50) NULL,
    GRADUATEYEAR DATE NULL,
    HOMECOUNTRY NVARCHAR(50) NULL,
    REGISTRYDATE DATE NULL
);

--CREATE TABLE PROGRAM (NGÀNH ĐÀO TẠO VD: IT, DESIGN...)--
CREATE TABLE STUDYPROGRAM(
	ID_PROGRAM CHAR(7) NOT NULL PRIMARY KEY DEFAULT dbo.AUTO_STU(),
	PROGRAMS_NAME NVARCHAR(100) NULL
);

--CREATE TABLE COURSE (ĐIỂM THÍ SINH VD: TOÁN, VĂN, ANH, PHỎNG VẤN)--
CREATE TABLE COURSE(
	ID_STUDENT INT NOT NULL,
	MATH FLOAT NULL,
	LITERATURE FLOAT NULL,
	INTERVIEW FLOAT NULL,
	ENGLIST FLOAT NULL,
	GRADE_COMMENT NVARCHAR(50) NULL,
	RESULT NVARCHAR(50)
);

--CREATE TABLE YEAR (NĂM HỌC THEO HỌC KÌ VD: HỌC KÌ MÙA XUÂN THEO NĂM 2015)--
CREATE TABLE YEARS(
	ID_YEAR INT NOT NULL IDENTITY PRIMARY KEY,
	YEARS_NAME INT NULL
);

----------------------RELATIONSHIP---------
ALTER TABLE dbo.ACADEMICYEAR ADD CONSTRAINT FK_ACADEMIDYER_YEARS FOREIGN KEY (ID_YEAR) REFERENCES dbo.YEARS(ID_YEAR);
ALTER TABLE dbo.SEMESTER ADD CONSTRAINT FK_SEMESTER_ACADEMICYEAR FOREIGN KEY (ID_ACADEMICYEAR) REFERENCES dbo.ACADEMICYEAR(ID_ACADEMICYEAR);
ALTER TABLE dbo.STAGE ADD CONSTRAINT FK_STAGE_SEMESTER FOREIGN KEY (ID_SEMESTER) REFERENCES dbo.SEMESTER(ID_SEMESTER);
ALTER TABLE dbo.STAGE ADD CONSTRAINT FK_STAGE_INTAKES FOREIGN KEY (ID_INTAKES) REFERENCES dbo.INTAKES(ID_INTAKES);
ALTER TABLE dbo.STUDENT ADD CONSTRAINT FK_STUDENT_INTAKES FOREIGN KEY (ID_INTAKES) REFERENCES dbo.INTAKES(ID_INTAKES);
ALTER TABLE dbo.PROFILETYPE ADD CONSTRAINT FK_PROFILE_STATUS FOREIGN KEY (ID_STATUS) REFERENCES dbo.STATUS(ID_STATUS);
ALTER TABLE dbo.PROFILETYPE ADD CONSTRAINT FK_PROFILE_INPUT FOREIGN KEY (ID_INPUT) REFERENCES dbo.INPUT(ID_INPUT);
ALTER TABLE dbo.CANDIDATEPROFILE ADD CONSTRAINT FK_CANDIDATEPROFILE_PROFILE FOREIGN KEY (ID_PROFILE) REFERENCES dbo.PROFILETYPE(ID_PROFILE);
ALTER TABLE dbo.CANDIDATEPROFILE ADD CONSTRAINT FK_CANDIDATEPROFILE_STUDENT FOREIGN KEY (ID_STUDENT) REFERENCES dbo.STUDENT(ID_STUDENT);
ALTER TABLE dbo.STUDENT ADD CONSTRAINT FK_STUDENT_CANDIDATETYPE FOREIGN KEY (ID_CADIDATE) REFERENCES dbo.CANDIDATETYPE(ID_CANDIDATE);
ALTER TABLE dbo.STUDENT ADD CONSTRAINT FK_STUDENT_EDUCATION FOREIGN KEY (ID_EDUCATION) REFERENCES dbo.EDUCATION(ID_EDUCATION);
ALTER TABLE dbo.STUDENT ADD CONSTRAINT FK_STUDENT_STUDYPROGRAM FOREIGN KEY (ID_PROGRAM) REFERENCES dbo.STUDYPROGRAM(ID_PROGRAM);
ALTER TABLE dbo.COURSE ADD CONSTRAINT FK_COURSE_STUDENT FOREIGN KEY (ID_STUDENT) REFERENCES dbo.STUDENT(ID_STUDENT);



------------------TỰ ĐỘNG TĂNG MÃ ACADEMICYEAR------------------------
CREATE FUNCTION AUTO_ACA()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(ID_ACADEMICYEAR) FROM dbo.ACADEMICYEAR) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_ACADEMICYEAR, 4)) FROM dbo.ACADEMICYEAR
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'ACA000' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'ACA00' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
---------------------TỰ ĐỘNG TĂNG MÃ CANDIDATETYPE---------------------
CREATE FUNCTION AUTO_CAN()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(ID_CANDIDATE) FROM dbo.CANDIDATETYPE) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_CANDIDATE, 4)) FROM dbo.CANDIDATETYPE
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'CAN000' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'CAN00' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
------------------------TỰ ĐỘNG TĂNG MÃ COURSE--------------------
--CREATE FUNCTION AUTO_COU()
--RETURNS VARCHAR(7)
--AS
--BEGIN
--	DECLARE @ID VARCHAR(7)
--	IF (SELECT COUNT(ID_COURSE) FROM dbo.COURSE) = 0
--		SET @ID = '0'
--	ELSE
--		SELECT @ID = MAX(RIGHT(ID_COURSE, 4)) FROM dbo.COURSE
--		SELECT @ID = CASE
--			WHEN @ID >= 0 and @ID < 9 THEN 'COU000' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
--			WHEN @ID >= 9 THEN 'COU00' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
--		END
--	RETURN @ID
--END
----------------------TỰ ĐỘNG TĂNG MÃ EDUCATION--------------------
CREATE FUNCTION AUTO_EDU()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(ID_EDUCATION) FROM dbo.EDUCATION) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_EDUCATION, 4)) FROM dbo.EDUCATION
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'EDU000' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'EDU00' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
---------------------TỰ ĐỘNG TĂNG MÃ INTAKES---------------------
CREATE FUNCTION AUTO_INT()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(ID_INTAKES) FROM dbo.INTAKES) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_INTAKES, 4)) FROM dbo.INTAKES
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'INT000' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'INT00' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
---------------------TỰ ĐỘNG TĂNG MÃ STAGE---------------------
CREATE FUNCTION AUTO_STA()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(ID_STAGE) FROM dbo.STAGE) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_STAGE, 4)) FROM dbo.STAGE
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'STA000' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'STA00' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
---------------------TỰ ĐỘNG TĂNG MÃ SEMESTER---------------------
CREATE FUNCTION AUTO_SEM()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(ID_SEMESTER) FROM dbo.SEMESTER) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_SEMESTER, 4)) FROM dbo.SEMESTER
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'SEM000' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'SEM00' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
------------------------TỰ ĐỘNG TĂNG MÃ STUDYPROGRAM------------------
CREATE FUNCTION AUTO_STU()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(ID_PROGRAM) FROM dbo.STUDYPROGRAM) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_PROGRAM, 4)) FROM dbo.STUDYPROGRAM
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'STU000' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'STU00' + CONVERT(VARCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END