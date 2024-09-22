-- Q1
create table custom(
	CUSTOM_NO int primary key comment '번호',
	CUSTOM_NAME varchar(20) comment '이름',
	CUSTOM_GRADE int comment '학년',
	CUSTOM_ADDRESS varchar(20) comment '주소'
);

insert into custom values
(1001, '짱구', 1, '인천 구월동'),
(1002, '철수', 1, '인천 연수동'),
(1003, '훈이', 2, '인천 구월동'),
(1004, '유리', 2, '인천 연수동'),
(1005, '맹구', 2, '인천 송도동');

create table Class (
	Class_NAME varchar(20) primary key comment '수업명',
	Class_TEACHER varchar(20) comment '담당교사',
	Class_TIME time comment '수업시간'
);

insert into Class values 
('국어', '민아', 010000),
('수학', '수현', 120000);

create table ATTENDANCE (
	STUDNET_NO INT COMMENT '학생번호',
	CLASS_NAME varchar(20) COMMENT '수업명',
	SCORE int COMMENT '점수',
	foreign key(STUDNET_NO) references custom(CUSTOM_NO),
	foreign key(CLASS_NAME) references Class(Class_NAME)
);

insert into ATTENDANCE values
(1001, '국어', 80),
(1001, '수학', 70),
(1002, '국어', 100),
(1002, '수학', 100),
(1003, '국어', 50),
(1003, '수학', 60),
(1004, '국어', 70),
(1004, '수학', 70),
(1005, '국어', 90),
(1005, '수학', 30);

-- Q2
select * from custom;
select * from class;

select ATTENDANCE.STUDNET_NO as '학생번호', custom.CUSTOM_NAME as '학생이름', avg(ATTENDANCE.SCORE) as '평균점수'
from ATTENDANCE
join custom
on custom.CUSTOM_NO = ATTENDANCE.STUDNET_NO
join class
on class.Class_NAME = ATTENDANCE.CLASS_NAME
group by ATTENDANCE.STUDNET_NO;

select ATTENDANCE.STUDNET_NO as '학생번호', custom.CUSTOM_NAME as '학생이름', avg(ATTENDANCE.SCORE) as '평균점수'
from ATTENDANCE
join custom
on custom.CUSTOM_NO = ATTENDANCE.STUDNET_NO
join class
on class.Class_NAME = ATTENDANCE.CLASS_NAME
where custom.CUSTOM_GRADE = 2
group by ATTENDANCE.STUDNET_NO
order by avg(ATTENDANCE.SCORE) desc
limit 1;

-- Q3
create table USERS (
	USERS_ID varchar(30) primary key comment '아이디',
	USERS_PASSWORD int not null comment '패스워드',
	USERS_NAME varchar(30) comment '이름',
	USERS_EMAIL varchar(30) comment '이메일'
);

insert  into  USERS values
('USER1', 1234, '둘리', 'user1@naver.com'),
('USER2', 1234, '또치', 'user2@naver.com'),
('USER3', 1234, '도우너', 'user3@gmail.com'),
('USER4', 1234, '마이콜', 'user4@gmail.com'),
('USER5', 1234, '고길동', 'user5@gmail.com');

create table categle(
	categle_NO int primary key comment '글번호',
	categle_TITLE varchar(20) not null comment '제목',
	categle_CONTENT varchar(100) comment '내용',
	categle_WRITER varchar(100) not null comment '작성자',
	categle_REG_DATE date comment '등록일',
	categle_UPDATE_DATE date comment '수정일'
);

insert into categle values 
(1, '1번', '1번 게시물입니다.', 'USER1', '2024-05-02 18:28:06.000', '2024-05-02 18:28:06.000'),
(2, '2번', '2번 게시물입니다.', 'USER1', '2024-05-02 18:28:06.000', '2024-05-02 18:28:06.000'),
(3, '3번', '3번 게시물입니다.', 'USER2', '2024-05-02 18:28:06.000', '2024-05-02 18:28:06.000'),
(4, '4번', '4번 게시물입니다.', 'USER3', '2024-05-02 18:28:06.000', '2024-05-02 18:28:06.000'),
(5, '5번', '5번 게시물입니다.', 'USER3', '2024-05-02 18:28:06.000', '2024-05-02 18:28:06.000'),
(6, '6번', '6번 게시물입니다.', 'USER4', '2024-05-02 18:28:06.000', '2024-05-02 18:28:06.000'),
(7, '7번', '7번 게시물입니다.', 'USER4', '2024-05-02 18:28:06.000', '2024-05-02 18:28:06.000'),
(8, '8번', '8번 게시물입니다.', 'USER4', '2024-05-02 18:28:06.000', '2024-05-02 18:28:06.000'),
(9, '9번', '9번 게시물입니다.', 'USER4', '2024-05-02 18:28:06.000', '2024-05-02 18:28:06.000'),
(10, '10번', '10번 게시물입니다.', 'USER5', '2024-05-02 18:28:06.000', '2024-05-02 18:28:06.000');

create table tables (
	TABLE_NO int primary key comment '댓글번호',
	TABLE_CONTENT varchar(100) comment '내용',
	BOARD_NO int not null comment '게시물 번호',
	TABLE_WRITER varchar(100) not null comment '작성자',
	REG_DATE date comment '등록일',
	UPDATE_DATE date comment '수정일',
	foreign key(TABLE_WRITER) references users(USERS_ID),
	foreign key(BOARD_NO) references categle(categle_NO)
);

insert into tables values
(1, '게시물1의 댓글1', 1, 'USER1', '2024-05-02 18:28:13.000', '2024-05-02 18:28:13.000'),
(2, '게시물1의 댓글2', 1, 'USER4', '2024-05-02 18:28:13.000', '2024-05-02 18:28:13.000'),
(3, '게시물3의 댓글1', 3, 'USER1', '2024-05-02 18:28:13.000', '2024-05-02 18:28:13.000'),
(4, '게시물3의 댓글2', 3, 'USER2', '2024-05-02 18:28:13.000', '2024-05-02 18:28:13.000'),
(5, '게시물3의 댓글3', 3, 'USER4', '2024-05-02 18:28:13.000', '2024-05-02 18:28:13.000'),
(6, '게시물5의 댓글1', 5, 'USER2', '2024-05-02 18:28:13.000', '2024-05-02 18:28:13.000'),
(7, '게시물6의 댓글1', 6, 'USER4', '2024-05-02 18:28:13.000', '2024-05-02 18:28:13.000'),
(8, '게시물9의 댓글1', 9, 'USER1', '2024-05-02 18:28:13.000', '2024-05-02 18:28:13.000'),
(9, '게시물9의 댓글2', 9, 'USER2', '2024-05-02 18:28:13.000', '2024-05-02 18:28:13.000'),
(10, '게시물10의 댓글1', 10, 'USER1', '2024-05-02 18:28:13.000', '2024-05-02 18:28:13.000');

-- Q4
select tables.BOARD_NO as '게시물번호', categle.categle_TITLE as '게시물제목', max(Users.USERS_NAME) as '게시물작성자', group_concat(tables.TABLE_CONTENT) as '댓글목록'
from tables
join users
on tables.TABLE_WRITER = users.USERS_ID 
join categle
on tables.BOARD_NO = categle.categle_NO
group by categle.categle_NO;

update tables set TABLE_CONTENT = '2번 게시물이 수정되었습니다' where TABLE_NO = 2;
update tables set UPDATE_DATE = '2024-05-02 18:29:57.000' where TABLE_NO = 2;

select tables.TABLE_NO as 'NO', concat(tables.TABLE_NO,'번') as 'TITLE', min(tables.TABLE_CONTENT) as 'CONTENT', tables.UPDATE_DATE as 'UPDATE_DATE', users.USERS_NAME as 'NAME', users.USERS_EMAIL as 'EMAIL' 
from tables
join users
on tables.TABLE_WRITER = users.USERS_ID 
join categle
on tables.BOARD_NO = categle.categle_NO;

select categle.categle_WRITER as 'ID', USERS.USERS_NAME as 'NAME'
from tables
join users
on tables.TABLE_WRITER = users.USERS_ID 
join categle
where categle.categle_WRITER = 'USER3' or categle.categle_WRITER = 'USER5' 
group by categle.categle_WRITER;

-- Q5
create table BOOK (
	BOOK_NO int primary key comment '도서번호',
	BOOK_TITLE varchar(30) not null comment '제목',
	BOOK_AUTHOR varchar(100) comment '저자',
	BOOK_PUBLISHER varchar(100) comment '출판사',
	BOOK_PUB_DATE date comment '출간일'
);

insert into BOOK values
(1, '혼자 공부하는 머신러닝', '박해선', '한빛미디어', 20200101),
(2, '비전공자를 위한 IT지식', '최원영', '한빛미디어', 20180101),
(3, '클린 코드', '마틴', '에이콘', 20190101),
(4, '모두의 SQL', '김도연', '길벗', 20200101),
(5, '블록체인 해설서', '이병욱', '에이콘', 20220101);

create table CONTACTS (
	CONTACTS_ID varchar(50) primary key comment '회원아이디',
	CONTACTS_FIRST_NAME varchar(50) not null comment '이름',
	CONTACTS_LAST_NAME varchar(50) not null comment '성',
	CONTACTS_AGE int comment '나이',
	CONTACTS_EMAIL varchar(50) comment '이메일'
);


insert into CONTACTS values
('M001', '애숙', '한', 43, 'm001@naver.com'),
('M002', '영복', '오', 45, 'm002@naver.com'),
('M003', '아리', '오', 17, 'm003@gmail.com'),
('M004', '동동', '오', 15, 'm004@gmail.com');

create table Abookloan (
	BOOK_NO int comment '대여한책',
	MEMBER_ID varchar(50) not null comment '대여자',
	LOAN_DATE date comment '대여일',
	DUE_DATE date comment '대여 마지막날',
	RETURN_DATE date comment '반납일',
	foreign key(BOOK_NO) references BOOK(BOOK_NO),
	foreign key(MEMBER_ID) references CONTACTS(CONTACTS_ID)
);

insert into Abookloan values
(1, 'M002', 20240101, 20240108, 20240107),
(1, 'M003', 20240210, 20240217, 20240220),
(1, 'M004', 20240305, 20240312, 20240310),
(2, 'M002', 20240101, 20240108, 20240105),
(3, 'M001', 20240205, 20240212, 20240218),
(3, 'M001', 20240220, 20240227, 20240222),
(5, 'M002', 20240111, 20240118, 20240115),
(5, 'M003', 20240117, 20240124, 20240125),
(5, 'M004', 20240305, 20240312, 20240311),
(5, 'M004', 20240320, 20240327, 20240320);

-- Q6
select abookloan.BOOK_NO as '도서번호', BOOK.BOOK_TITLE as '제목', abookloan.DUE_DATE as '대여 마지막날', abookloan.RETURN_DATE as '반납일', concat(CONTACTS.CONTACTS_LAST_NAME, CONTACTS.CONTACTS_FIRST_NAME) as '대여자'  
from abookloan
join book
on abookloan.BOOK_NO = Book.BOOK_NO
join contacts
on abookloan.MEMBER_ID = contacts.CONTACTS_ID
where abookloan.RETURN_DATE >= 20240125 and abookloan.RETURN_DATE <= 20240220
group by abookloan.BOOK_NO;

select concat(month(abookloan.LOAN_DATE), '월') as '월', BOOK.BOOK_TITLE as '제목', count(BOOK.BOOK_TITLE) as '대출건수'
from abookloan
join book
on abookloan.BOOK_NO = Book.BOOK_NO
join contacts
on abookloan.MEMBER_ID = contacts.CONTACTS_ID
group by BOOK.BOOK_TITLE, month(abookloan.LOAN_DATE)
order by month(abookloan.LOAN_DATE), BOOK.BOOK_TITLE asc;

select abookloan.MEMBER_ID as '회원 아이디', concat(contacts.CONTACTS_LAST_NAME,contacts.CONTACTS_FIRST_NAME) as '회원이름',  contacts.CONTACTS_AGE as '나이', count(BOOK.BOOK_TITLE) as '대출건수' 
from abookloan
join book
on abookloan.BOOK_NO = Book.BOOK_NO
join contacts
on abookloan.MEMBER_ID = contacts.CONTACTS_ID
where contacts.CONTACTS_AGE < 20
group by abookloan.MEMBER_ID;

-- Q7
select * from custom;
select length(users.USERS_EMAIL) + length(users.USERS_ID) as 'age' from users;
select * from CONTACTS;

select custom.CUSTOM_NO as 'NO', custom.CUSTOM_NAME as 'NAME', length(CUSTOM_ADDRESS) - length(CUSTOM_GRADE) as 'age'
from custom
union
select users.USERS_ID, users.USERS_NAME, length(users.USERS_EMAIL) + length(users.USERS_ID)
from USERS
union
select CONTACTS.CONTACTS_ID, concat(contacts.CONTACTS_LAST_NAME, contacts.CONTACTS_FIRST_NAME), CONTACTS.CONTACTS_AGE 
from CONTACTS;