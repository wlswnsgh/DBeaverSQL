create table DEPT (
	DEPT_NO int comment '부서번호',
	DEPT_NAME varchar(20) comment '부서명'
);

insert into DEPT (DEPT_NO, DEPT_NAME)
values
(1, '인사부'),
(2, '홍보부'),
(3, '개발부'),
(null, '임시부서');

create table EMP (
	EMP_NO int comment '직원번호',
	EMP_NAME varchar(20) comment '직원명',
	EMP_RANK varchar(20) comment '직급',
	DEPT_NO int comment '부서번호'
);

insert into EMP (EMP_NO, EMP_NAME, EMP_RANK, DEPT_NO)
values
(1001, '둘리', '사원', 1),
(1002, '또치', '대리', 2),
(1003, '도우너', '대리', 3),
(1004, '고길동', '과장', 3),
(1005, '마이콜', '부장', null);

select * from dept
join emp
on dept.DEPT_NO  = emp.DEPT_NO;

select EMP.EMP_NO, EMP.EMP_NAME , EMP.DEPT_NO, DEPT.DEPT_NAME from dept
join emp
on dept.DEPT_NO  = emp.DEPT_NO;

-- 어떤테이블의 컬럼인지 명시하지 않아서 에러남
-- select EMP_NO, DEPT_NO
-- from emp
-- join dept
-- on EMP.DEPT_NO = EMP_NO;

-- 테이블에 별칭 붙이기 (join과 같이 이용가능)
select T1.EMP_NO, T2.DEPT_NO, T2.DEPT_NAME 
from EMP T1, dept T2
where T1.DEPT_NO  = T2.DEPT_NO;

-- 사원과 부서 테이블을 공통컬럼없이 그냥 조인하기
-- 4 곱하기 5해서 출력은 20개가 나옴
select *
from emp, dept; 

-- 부서가 없는 사원을 포함하여 사원정보 가져오기
select * from emp
left join dept
on emp.DEPT_NO = dept.DEPT_NO;

select * from emp
right join dept
on emp.DEPT_NO = dept.DEPT_NO;

create table CINEMA (
	THEATER_NO int comment '상영관번호',
	LOCATION varchar(100) comment '위치',
	TEL varchar(50) comment '전화번호'
);

insert into CINEMA(THEATER_NO, LOCATION, TEL)
values
(1, '송도점', '032-111-1111'),
(2, '구월점', '032-222-2222');

create table MOVIE (
	THEATER_NO int comment '상영관번호',
	MOVIE_NAME varchar(20) comment '영화명'
);

insert into MOVIE(THEATER_NO, MOVIE_NAME)
values
(1, '슬램덩크'),
(1, '교섭'),
(2, '슬램덩크'),
(2, '아바타2'),
(2, '영웅');

select movie.THEATER_NO, cinema.LOCATION , movie.MOVIE_NAME  from cinema
join movie
on movie.THEATER_NO = cinema.THEATER_NO;

-- Q4

-- Q5
create table PURCHASE (
	PURCHASE_DATE date not null comment '구매일자',
	PRODUCT_NO int not null comment '상품번호'
);

insert into purchase (PURCHASE_DATE, PRODUCT_NO)
values
('2023-01-05', 1),
('2023-01-05', 2),
('2023-01-11', 3),
('2023-01-20', 5),
('2023-01-25', 5),
('2023-02-02', 2),
('2023-02-07', 3),
('2023-02-11', 5),
('2023-02-12', 6);

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

select product.CATEGORY as '카테고리', count(purchase.PURCHASE_DATE) as '판매건수' from product
join PURCHASE
on product.PRODUCT_NO = PURCHASE.PRODUCT_NO group by product.CATEGORY order by count(purchase.PURCHASE_DATE) desc;

-- 퀴즈
select product.CATEGORY, count(purchase.PURCHASE_DATE) from product
join PURCHASE
on product.PRODUCT_NO = PURCHASE.PRODUCT_NO 
group by product.CATEGORY 
order by count(purchase.PURCHASE_DATE) desc 
limit 1;

select product.PRODUCT_NO as '상품번호', product.PRODUCT_NAME as '상품명', PURCHASE.PURCHASE_DATE as '판매날짜'
from product join PURCHASE on product.PRODUCT_NO = PURCHASE.PRODUCT_NO;

create table attendance(
	EMP_NO int not null comment '사원번호',
	ATT_DATE date not null comment '출석 체크한 날',
	ATT_TIME time not null comment '출석 체크한 시간'
);

insert into attendance (EMP_NO, ATT_DATE, ATT_TIME)
values
(1001, '2024-04-25', '08:50:00'),
(1002, '2024-04-25', '08:55:00'),
(1003, '2024-04-25', '09:01:00'),
(1004, '2024-04-25', '09:05:00'),
(1005, '2024-04-25', '11:20:00'),
(1001, '2024-04-26', '08:58:00'),
(1002, '2024-04-26', '08:59:00'),
(1003, '2024-04-26', '09:30:00'),
(1004, '2024-04-26', '09:03:00'),
(1005, '2024-04-26', '10:50:00');

select attendance.ATT_DATE as '날짜', emp.EMP_NAME as '지각자 명단' from emp
join attendance
on attendance.EMP_NO = emp.EMP_NO group by attendance.ATT_DATE;

-- Q.10
select 
E.DEPT_NO as 부서번호,
D.DEPT_NAME as 부서명,
count(*) as 지각건수
from emp e

join attendance A
on E.EMP_NO = A.EMP_NO

join DEPT D
on E.DEPT_NO = D.DEPT_NO 

where A.ATT_TIME > '09:10:00' and D.DEPT_NO = 3;

create table STORE1 (
	PRODUCT varchar(20),
	PRICE int
);

insert into STORE1(PRODUCT, PRICE)
values
('소주', 4000),
('맥주', 5000),
('와인', 20000);

create table STORE2 (
	PRODUCT varchar(20),
	PRICE int
);

insert into STORE2(PRODUCT, PRICE)
values
('소주', 4000),
('맥주', 5000),
('위스키', 50000);

select *
from store1
union all
select *
from store2;

select *
from store1
union
select *
from store2;

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

select * from product;
select * from book;

select PRODUCT_NO as 제품번호, 
concat('(과자)', PRODUCT_NAME),
ifnull(PRICE,0) as 가격   
from product
where CATEGORY = '과자';

union

select BOOK_NO,
concat('(책)', TITLE), 
ifnull(PRICE,0) as 가격
from book;

select BOOK_NO as '제품번호', concat('(책)', TITLE) as '제품명', ifnull(0,PRICE) as '가격' 
from book;

select PRODUCT_NO as '제품명', concat('(과자)', PRODUCT_NAME) as '제품명', ifnull(0,PRICE) as '가격'
from product;

select 

-- 기본키 추가하기
create table PERSON(
	LAST_NAME varchar(5) primary key,
	FIRST_NAME varchar(5),
	NICKNAME varchar(10)
);

-- 기본키 추가하기
create table PERSON(
	LAST_NAME varchar(5),
	FIRST_NAME varchar(5),
	NICKNAME varchar(10),
	primary key (LAST_NAME)
);

-- 기본키 삭제하기
alter table person drop primary key;

-- 다시 기본키 추가하기
alter table person add primary key (LAST_NAME);

-- 키본키의 제약사항 확인
insert into person 
values
(null, '짱구', '아들'); -- NULL을 입력할 수 없음

insert into person
values
('신', '짱구', '아들'),
('신', '짱아', '딸'); -- 중복된 성을 입력할 수 없음

create table PERSON(
	LAST_NAME varchar(5),
	FIRST_NAME varchar(5),
	NICKNAME varchar(10),
	primary key (LAST_NAME, FIRST_NAME)
);

-- 같은 성이지만, 조합이 다르기 때문에 중복이 ㄴㄴ함
insert into person values
('신', '짱구', '아들'),
('신', '짱아', '딸');

