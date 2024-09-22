create table BOOK (
	BOOK_NO int not null auto_increment primary key comment '도서번호',
	TITLE varchar(30) not null comment '제목',
	PUBLISHER varchar(100) comment '출판사',
	PUB_DATE date comment '출간일',
	PRICE int comment '가격'
);

insert into BOOK values
(1, '역사1', '상상마당', '2023-01-01', 10000),
(2, '역사2', '상상마당', '2023-01-02', 20000),
(3, '스프링웹프로젝트', '한빛미디어', '2023-02-01', 40000),
(4, '자바프로그래밍', null, null, null);

create table CONTACTS(
	LAST_NAME varchar(255) not null comment '성',
	FIRST_NAME varchar(255) not null comment '이름',
	EMAIL varchar(255) not null comment '이메일',
	PHONE varchar(20) comment '연락처'
);

insert into CONTACTS values
('이', '서연', 'stone@naver.com', '010-2341-0000'),
('이', '시우', 'lavera@naver.com', null),
('김', '지호', 'shyla@gmail.com', '010-3171-4126'),
('김', '윤서', 'jeni@gmail.com', '010-8121-2341'),
('최', '수아', 'fern@gmail.com', null);

create table GIFT (
	NAME varchar(20) comment '상품명',
	type varchar(20) comment '품목',
	PRICE int comment '가격'
);

insert into GIFT values
('참치세트', '식품', 10000),
('햄세트', '식품', 20000),
('샴푸세트', '생활용품', 30000),
('세차용품', '생활용품', 40000),
('주방용품', '생활용품', 50000),
('노트북', '가전제품', 60000),
('벽걸이TV', '가전제품', 70000);

create table ClASS (
	CLASS_NO int not null primary key comment '수업번호',
	CLASS_NAME varchar(30) comment '과목명',
	CLASS_TIME time comment '수업시간'
);

insert into CLASS values 
(1, '수학', 090000),
(2, '국어', 100000),
(3, '영어', 110000);

create table RESERVATION(
	MOVIE_NAME varchar(20) not null comment '영화명',
	USER_NAME varchar(20) not null comment '예약자명',
	SEAT_NO varchar(5) comment '자리번호',
	DATE date comment '예약일'
);

insert into RESERVATION values
('아바타', '둘리', 'A1', '2024-04-20'),
('아바타', '또치', 'A2', '2024-04-20'),
('아바타', '도우너', 'B1', '2024-04-21'),
('슬렘덩크', '짱구', 'A2', '2024-04-20'),
('영웅', '고길동', 'A3', '2024-04-21');

create table PRODUCT (
	PRODUCT_NO int not null primary key comment '제품번호',
	PRODUCT_NAME varchar(20) comment '제품명',
	PRICE int comment '가격',
	CATEGORY varchar(10) comment '카테고리(과자,음료,주류)'
);

insert into PRODUCT values
(1, '허니버터칩', 2300, '과자'),
(2, '새우깡', 1100, '과자'),
(3, '코카콜라', 1100, '음료'),
(4, '아침에주스', 4900, '음료'),
(5, '처음처럼', 3000, '주류'),
(6, '참이슬', 2500, '주류');

create table CUSTOMER (
	CUSTOMER_NO int not null primary key comment '번호',
	CUSTOMER_NAME varchar(20) not null comment '이름',
	CUSTOMER_GENDER varchar(9) comment '주소'
);

insert into CUSTOMER values
(1, '둘리', '서울'),
(2, '또치', '인천'),
(3, '도우너', null),
(4, '고길동', '부산'),
(5, '마이콜', '부산');

select CUSTOMER_GENDER as 지역, count(CUSTOMER_NAME) as '회원의 수' 
from CUSTOMER 
group by CUSTOMER_GENDER;

select ifnull(CUSTOMER_GENDER,'--') as 지역 , group_concat(CUSTOMER_NAME) as 회원목록  
from CUSTOMER 
group by CUSTOMER_GENDER;

select ifnull(PUBLISHER, '--') as 출판사, count(TITLE) as 개수, ifnull(sum(PRICE), 0) as 합계
from book
group by PUBLISHER;

select concat(day(PUB_DATE), '월') as 월, count(TITLE) as '출판된 책의 개수'
from book
group by day(PUB_DATE);

select LAST_NAME, FIRST_NAME, concat(LAST_NAME, FIRST_NAME) as 'FULL_NAME'
from contacts;

select LAST_NAME as 성, count(FIRST_NAME) 
from contacts
group by LAST_NAME;

-- Q7
select * from reservation;
select `DATE` as '날짜', count(MOVIE_NAME) as '예매건수' 
from reservation
group by SEAT_NO
order by `DATE` asc;
