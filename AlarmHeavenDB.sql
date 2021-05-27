create table TESTQUIZ(
	quiztype varchar2(30) not null,
	question varchar2(100) not null,
	answer varchar2(100) not null
);
create table manager(
	managerid varchar2(100) primary key,
	managerpw varchar2(100) not null,
	managerrank varchar2(10) not null
);
create table login(
	id varchar2(100) primary key,
	pw varchar2(100) not null,
	email varchar2(100),
	name varchar2(20) not null
);
create table bgColorDB(
	bgCode number(10) primary key,
	bgColor varchar2(100) not null
);
create table usermusic(
	id		  varchar2(100) not null,
	musicname varchar2(100)	
);
insert into login values('kang','1234','abc@naver.com','강감찬');
insert into login values('hong','1234','abc@naver.com','홍길동');

insert into testquiz values('수학','2+5는?','7');
insert into testquiz values('수학','4+5는?','9');
insert into testquiz values('수학','6*8은?','7');
insert into testquiz values('영어','책상을 영어로 하면?','desk');
insert into testquiz values('영어','house의 뜻은?','집');
insert into testquiz values('영어','야구를 영어로 하면?','baseball');
insert into testquiz values('넌센스','왕이 넘어지면?','킹콩');
insert into testquiz values('넌센스','별 중에 가장 슬픈 별은?','이별');
insert into testquiz values('넌센스','사람의 몸무게가 가장 많이 나갈 때는?','철들때');

insert into manager values('admin11','admin1234','중');
insert into manager values('admin22','admin1234','상');
insert into manager values('admin33','admin1234','중');
insert into manager values('admin44','admin1234','하');
insert into manager values('admin55','admin1234','상');

insert into bgColorDB values(0,'gray');
insert into bgColorDB values(1,'red');
insert into bgColorDB values(2,'black');
insert into bgColorDB values(3,'bright');
commit;

