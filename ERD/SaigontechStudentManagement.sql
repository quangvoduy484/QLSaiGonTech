go
create table catalog (
	catalog_id int,
	catalogname nvarchar(20),
	primary key(catalog_id)
)

go
create table semester (
	semester_id int,
	semestername nvarchar(20),
	primary key(semester_id)
)

go
create table years (
	year_id int,
	yearname int,
	primary key(year_id)
)


go 
create table exam (
	exam_id int,
	examname nvarchar(20),
	primary key(exam_id)
)

go
create table intake (
	intake_id int,
	intakename nvarchar(20),
	primary key(intake_id)
)

go
create table stage (
	stage_id int,
	stagename nvarchar(20),
	stagedate date,
	examdate date,
	examtime time,
	enlishexamtime time,
	exam_id int,
	intake_id int,
	primary key(stage_id),
	foreign key(exam_id) references exam,
	foreign key(intake_id) references intake
)


go 
create table nation (
	nation_id int,
	nationname nvarchar(20),
	primary key(nation_id)
)

go 
create table province (
	province_id int,
	provincename nvarchar(20),
	nation_id int,
	primary key(province_id),
	foreign key(nation_id) references nation
)

go
create table district (
	district_id int,
	districtname nvarchar(20),
	province_id int,
	primary key(district_id),
	foreign key(province_id) references province
)

go 
create table document (
	doc_id int,
	nameinenglish varchar(50),
	nameinvietnamese nvarchar(50),
	sequencenum int,
	inputtype int,
	status int,
	note text,
	primary key (doc_id)
)

go 
create table candidatetype (
	cantype_id int,
	typename nvarchar(20),
	primary key(cantype_id)
)

go 
create table major (
	major_id int,
	majorname nvarchar(20),
	primary key(major_id)
)

go 
create table education (
	education_id int,
	educationname nvarchar(20),
	primary key(education_id)
)

go 
create table parameter (
	signaturename nvarchar(40),
	morecontact nvarchar(40),
	documentcode varchar(20),
	intake_id int,
	year_id int,
	semester_id int,
	foreign key(intake_id) references intake,
	foreign key(year_id) references years,
	foreign key(semester_id) references semester
)

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
	year_id int,
	semester_id int,
	catalog_id int,
	cantype_id int,
	major_id int, 
	education_id int,
	province_id int,
	hometown int,
	homecountry int,
	intake_id int,
	stage_id int,
	foreign key(year_id) references years,
	foreign key(semester_id) references semester,
	foreign key(catalog_id) references catalog,
	foreign key(cantype_id) references candidatetype,
	foreign key(major_id) references major,
	foreign key(education_id) references education,
	foreign key(hometown) references province(province_id),
	foreign key(province_id) references province,
	foreign key(homecountry) references nation(nation_id),
	foreign key(intake_id) references intake,
	foreign key(stage_id) references stage,
	primary key(id)
)

go
create table grade (
	grade float,
	interviewer nvarchar(50),
	result int,
	candidate_id int,
	exam_id int,
	foreign key(candidate_id) references candidate,
	foreign key(exam_id) references exam
)

go
create table candidatedocument (
	document_id int,
	candidate_id int,
	value float,
	foreign key(document_id) references document,
	foreign key(candidate_id) references candidate
)