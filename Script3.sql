create table customer (
	customer int auto_increment primary key comment '회원번호',
	name varchar(20) not null comment '이름',
	address varchar(100) comment '주소'
);

insert into customer (name, address) values('둘리', '서울');
insert into customer values(2, '또치', '인천');

insert into customer (name, address) 
values
('고길동', '부산'),
('마이콜', '부산');

-- 불완전한 회원정보
insert into customer (name, address) values('도우너', null);

-- NOT NULL 제약사항을 어겨서 에러함.
insert into customer values(6, null, null);

create table BOOK (
	BOOK_NO int auto_increment primary key not null comment '도서번호',
	TITLE varchar(30) not null comment '제목',
	PUBLISHER varchar(100) comment '출판사',
	PUB_DATE date comment '출간일',
	PRICE int comment '가격'
);

insert into book (TITLE, PUBLISHER, PUB_DATE, PRICE)
values
('역사1', '상상마당', '2021-01-01', '10000'),
('역사2', '상상마당', '2021-01-02', '20000'),
('스프링웹프로젝트', '한빛미디어', '2021-02-01', '40000'),
('자바프로그래밍', null, null, null);

create table CONTACTS (
	LAST_NAME varchar(255) not null comment '성',
	FIRST_NAME varchar(255) not null comment '이름',
	EMAIL varchar(255) not null comment '이메일',
	PHONE varchar(20) comment '연락처'
);


insert into contacts (LAST_NAME, FIRST_NAME, EMAIL, PHONE)
values
('이','서연','stone@naver.com','010-2341-0000'),
('이','시우','lavera@naver.com', null),
('김','지호','shyla@gmail.com','010-3171-4126'),
('김','윤서','jeni@gmail.com','010-8121-2341'),
('최','수아','fern@gmail.com', null);

create table GIFT(
	NAME varchar(20) comment '상품명',
	TYPES varchar(20) comment '품목',
	PRICE int comment '가격'
);

insert into GIFT (NAME, TYPES, PRICE)
values
('참치세트', '식품', '10000'),
('햄세트', '식품', '20000'),
('샴푸세트', '생활용품', '30000'),
('세차세트', '생활용품', '40000'),
('주방용품', '생활용품', '50000'),
('노트북', '가전제품', '60000'),
('벽걸이TV', '가전제품', '70000');

create table class (
	CLASS_NO int not null auto_increment primary key comment '수업번호',
	CLASS_NAME varchar(30) comment '과목명',
	CLASS_TIME time comment '수업시간'
);

-- auto_increment 자동으로 추가 명령어이다.
insert into class (CLASS_NAME, `CLASS_TIME`)
values 
('수학',090000),
('국어','10:00:00'),
('영어','11:00:00');

create table RESERVATION (
	MOVIE_NAME varchar(20) not null comment '영화명',
	USER_NAME varchar(20) not null comment '예약자명',
	SEAT_NO varchar(5) comment '자리번호',
	DATE date comment '예약일'
);

insert into reservation (MOVIE_NAME, USER_NAME, SEAT_NO, `DATE`)  
values
('아바타', '둘리', 'A1', '2024-04-20'),
('아바타', '또치', 'A2', '2024-04-20'),
('아바타', '도우너', 'B1', '2024-04-21'),
('슬램덩크', '짱구', 'A2', '2024-04-20'),
('영웅', '고길동', 'B3', 20240421);

create table PRODUCT (
	PRODUCT_NO int not null primary key comment '제품번호',
	PRODUCT_NAME varchar(20) comment '제품명',
	PRICE int comment '가격',
	CATEGORY varchar(10) comment '카테고리(과자,음류,주류)');
	
insert into product (PRODUCT_NO, PRODUCT_NAME, PRICE, CATEGORY)
values
('1', '허니버터칩', '2300', '과자'),
('2', '새우깡', '1100', '과자'),
('3', '코카콜라', '1000', '음료'),
('4', '아침에주스', '4900', '음료'),
('5', '처음처럼', '3000', '주료'),
('6', '참이슬', '2500', '주료');

-- 회원테이블에서 회원번호와 이름 가져오기
-- select PRODUCT_NO, PRICE from PRODUCT;

-- 회원테이블에서 모든 데이터 가져오기
-- select * from PRODUCT;

-- 비교 연산자
select * from product;
select * from product where PRODUCT_NO=1; 
select * from product where PRODUCT_NO!=1; 
select * from product where PRODUCT_NO<3; 
select * from product where PRODUCT_NO<=3;

-- 논리 연산자
select * from product
where CATEGORY = '과자' and  PRICE > 2000;

select * from product
where PRODUCT_NAME or PRICE > 2000 and PRICE < 4000;

select * from book
where PRICE = 20000;

select * from book 
where PRICE < 10000 or  PRICE < 30000;

select * from book
where TITLE = '역사1' or TITLE = '역사2';

select * from book
where PUB_DATE < '2023-01-30' and PRICE = 10000;

select * from contacts
where LAST_NAME = '이';

select * from  contacts
where not LAST_NAME = '김';

select * from contacts
where FIRST_NAME = '윤서' or FIRST_NAME = '수아';

select * from class
where CLASS_NO = 1;

select * from class
where CLASS_TIME >= '10:00:00';

select CLASS_NAME  from class
where CLASS_TIME = '09:00:00' or CLASS_TIME = '11:00:00';

-- 별칭 사용 가능
-- select CLASS_NAME  from class c
-- where c.CLASS_TIME = '09:00:00' or c.CLASS_TIME = '11:00:00';

select MOVIE_NAME, SEAT_NO  from reservation
where `DATE` = '2024-04-21';

select MOVIE_NAME from reservation
where not MOVIE_NAME = '아바타';

select USER_NAME  from reservation
where SEAT_NO = 'A2' and `DATE` = 20240420;

select * from product
where PRICE < 2000;

select CATEGORY, PRODUCT_NAME  from product
where CATEGORY = '과자' or CATEGORY = '음료';

select PRODUCT_NAME, PRICE  from product
where PRICE >= 4900;

-- 범위 연산자
-- 회원번호가 2와 4 사이인 회원 가져오기
select * from customer 
where customer between 2 and 4;

-- 회원번호가 1, 4인 회원 가져오기
select * from customer
where customer in (1,4);

-- 회원번호가 1, 4인 빼고 가져오기
select * from customer
where customer not in(1,4);

select * from book
where PRICE between 10000 and 30000;

select * from contacts
where LAST_NAME in('김','최');

select * from gift
where PRICE between 30000 and 60000;

select * from gift
where TYPES in('식품','생활용품');

select * from gift
where PRICE  in(10000,30000,40000);

-- 패턴 연산자
-- 이름이 '둘'로 시작하는 회원 가져오기
select * from customer
where name like '둘%'; -- 앞 글자가 둘인 값을 전부 가져온다.

-- 이름이 '길'로 포함된 회원 가져오기
select * from customer
where name like '%길%'; -- 가운데 글자가 길인 값을 전부 가져온다.

-- 이름이 '치'로 끝나는 회원 가져오기
select * from customer
where name like '%치'; -- 마지막 글자인 치 값을 전부 가져온다.

-- 비교연산자로는 빈값을 찾을 수 없음
select * from customer
where address = null;

-- 주소가 없는 회원 가져오기
select * from customer
where address is null;

-- 주소가 있는 회원 가져오기
select * from customer
where address is not null;

select * from contacts
where PHONE like '%-%-4126';

select * from contacts
where PHONE like '%-2341-%' or PHONE like '%-%-2341';

select * from contacts
where EMAIL like '%@naver.com' and PHONE Is NULL;

select * from contacts
where EMAIL like '%@gmail.com' and LAST_NAME = '김';

select * from gift
where NAME like '%용품';

select * from gift
where TYPES like '식품' and PRICE between 10000 and 20000;

-- 회원번호를 기준으로 순정렬
select * from customer
order by customer;

-- 회원번호를 기준으로 역정렬
select * from customer
order by customer desc;

-- 주소를 기준으로 순정렬
select * from customer
order by address asc;

-- 주소와 이름으로 정렬
select * from customer
order by address asc, name desc;

-- 회원 테이블에서 3건만 가지고 오기
select * from customer limit 3;

select customer as code 
from customer; 

select customer as '회원의 번호' 
from customer; -- 한글도 가능

update customer set name = '도우너';
update customer set address = '제주도' where customer = 1;

update book set PUBLISHER = '믿음사' where PRICE between 10000 and 30000;
update book set PUBLISHER = '없음' where TITLE = '자바프로그래밍';
update book set PRICE = 0 where TITLE = '자바프로그래밍';

update contacts set FIRST_NAME = '지수' where LAST_NAME = '이' and PHONE like '%-2341-%';
-- select * from contacts where LAST_NAME = '이' and PHONE like '%-2341-%';

update contacts set FIRST_NAME = '현우', PHONE = '010-1234-5678' where LAST_NAME ='최';

update class set CLASS_TIME = '12:30:00' where CLASS_NAME = CLASS_NAME;
-- select * from class  where CLASS_NAME = CLASS_NAME;

update class set CLASS_NAME = '문학' where CLASS_NO = 2;

update product set PRICE = 5000 where PRODUCT_NO in(1,3,5);

update product set CATEGORY = '기타' where PRODUCT_NO between 2 and 4; 




