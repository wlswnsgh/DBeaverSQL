-- 회원 테이블 만들기
CREATE TABLE customer (
	ID	 			INT primary KEY,
	NAME 			VARCHAR(20) NOT NULL,
	ADDRESS 		VARCHAR(100)
);

-- 주문 테이블 만들기
create table orders (
	order_no 		INT primary key comment '주문번호',
	saleSMAN_ID 	INT comment '판매자아이디',
	order_date		DATE not null comment '주문일자'
);

create table categosries(
	MENU_ID 		INT primary key comment '메뉴아이디',
	MENU_NAME		char(10) not null comment '메뉴명',
	KILOCALORIES	INT  not null comment '칼로리',
	PRICE			INT  not null comment '가격'
);

create table location (
	LOCATION_ID		INT primary key not null,
	ADDRESS 		varchar(255) not null,
	POSTAL_CODE		varchar(20),
	CITY			varchar(50)
);

create table menus (
	MENU_ID 		int primary key not null comment '메뉴아이디',
	MENU_NAME		char(10) not null comment '메뉴명',
	KILOCALORIES 	int not null comment '칼로리',
	PRICE			int not null comment '가격'
);

create table curriculum (
	NO 				int primary key not null comment '과목번호',
	NAME			varchar(30) comment '과목명',
	POINTS 			int comment '학점',
	PROFID			int comment '교수 번호'
);

create table DEPT(
	DEPT_NO 		int primary key not null comment '부서번호',
	DEPT_NAME		varchar(20) comment '부서명',
	DEPT_LOC 		varchar(20) comment '부서위치'
);

create table EMP(
	EMP_NO 			int primary key not null,
	DEPT_NO			int,
	EMP_NAME 		varchar(10),
	HDATE			DATE
);

create table CINEMA(
	THEATER_NO 		int not null,
	CINEMA_NO		int primary key not null,
	MOVIE_NAME 		varchar(20),
	PRICE			int,
	SEAT  			int
);

create table RESERVATION(
	THEATER_NO 		int not null,
	CINEMA_NO		int not null,
	USER_NAME 		varchar(20) not null,
	SEAT_NO			int,
	DATE  			date
);

alter table RESERVATION add EX_1 varchar(25);


