go
create table candidate (
	id int,
	candidate_id varchar(20),
	lastname nvarchar(20),
	firstname nvarchar(20),
	birthday date,
	gender int,
	phonenumber varchar(10),
	ward nvarchar(20),
	marialstatus int,
	highschoolname nvarchar(50),
	highschoolcity nvarchar(40),
	graduateyear int,
	registrydate date,
	email varchar(50),
	idcard varchar(9),
	primary key(id)
)

go
create table catalog (
	catalog_id int,
	catalogname nvarchar(20),
	primary key(catalog_id)
)

go
create table semester (
	sem_id int,
	semestername nvarchar(20),
	primary key(sem_id)
)

go
create table year (
	year_id int,
	yearname int,
	primary key(year_id)
)

go
create table stage (
	stage_id int,
	stagename nvarchar(20),
	stagedate date,
	examdate date,
	examtime time,
	enlishexamtime time,
	primary key(stage_id)
)

go
create table intake (
	intake_id int,
	intakename nvarchar(20),
	primary key(intake_id)
)

go 
create table exam (
	exam_id int,
	examname nvarchar(20),
	primary key(exam_id)
)

go
create table grade (
	grade float,
	interviewer nvarchar(50),
	result int
)

go
create table district (
	district_id int,
	districtname nvarchar(20),
	primary key(district_id)
)

go 
create table province (
	province_id int,
	provincename nvarchar(20),
	primary key(province_id)
)

go 
create table nation ()

go 
create table candidatedocument ()

go 
create table document ()

go 
create table candidatetype ()

go 
create table major ()

go 
create table education ()

go 
create table education ()

go 
create table parameter ()
