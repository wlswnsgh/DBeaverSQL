create table custom(
	CUSTOM_ID varchar(20) primary key comment '고객 아이디',
	CUSTOM_NAME varchar(20) not null comment '고객 이름',
	CUSTOM_AGE int comment '고객 나이',
	CUSTOM_GRADE varchar(20) not null comment '고객 등급',
	CUSTOM_ADDRESS varchar(20) comment '주소'
);

insert into custom values
('a001', '짱구', 5, '일반고객', '서울'),
('a002', '철수', 5, 'VIP', '서울'),
('a003', '훈이', 5, '일반고객', '인천'),
('a004', '유리', 5, 'VIP', '인천'),
('a005', '맹구', 5, '일반고객', '서울');

create table product (
	product_No int primary key comment '상품번호',
	product_NAME varchar(20) comment '상품명',
	product_stock int comment '재고량',
	product_price int comment '가격',
	product_company varchar(20) comment '제조사'
);

insert into product values 
(101, '마우스', 10, 15000, '삼성'),
(102, '키보드', 10, 13000, '엘지'),
(103, '스피커', 10, 20000, '샤오미'),
(104, '모니터', 10, 50000, '벤규');

create table EMP (
	EMP_NO int primary key comment '주문번호',
	CUSTOMER_ID varchar(20) comment '주문고객',
	ITEM_ID int comment '주문상품',
	COUNT int comment '수량',
	ORDER_DATE date comment '주문일',
	foreign key(CUSTOMER_ID) references custom(CUSTOM_ID),
	foreign key(ITEM_ID) references product(product_No)
);

insert into EMP values
(1, 'a001', 101, 1, 20240101),
(2, 'a001', 103, 1, 20240301),
(3, 'a002', 102, 5, 20240101),
(4, 'a002', 103, 2, 20240201),
(5, 'a002', 104, 2, 20240201),
(6, 'a003', 102, 1, 20240201),
(7, 'a003', 104, 3, 20240301),
(8, 'a004', 101, 2, 20240301),
(9, 'a004', 102, 1, 20240301),
(10, 'a005', 101, 5, 20240201);


-- select product.product_NAME, max(emp.COUNT)
select emp.EMP_NO, product.product_NAME, Max(emp.COUNT) 
from emp
join custom
on emp.CUSTOMER_ID  = custom.CUSTOM_ID
join product
on emp.ITEM_ID = product.product_No
group by product.product_NAME
order by Max(emp.COUNT) desc
limit 3;

select custom.CUSTOM_GRADE as '등급', custom.CUSTOM_ADDRESS as '배송지', sum(product.product_price) as '합계', count(product.product_company) as '판매건수' 
from emp
join custom
on emp.CUSTOMER_ID  = custom.CUSTOM_ID
join product
on emp.ITEM_ID = product.product_No
group by product.product_company 
order by custom.CUSTOM_GRADE asc;

create table users (
	USERs_ID varchar(30) primary key comment '아이디',
	USERs_PASSWORD int not null comment '패스워드',
	USERs_NAME varchar(30) comment '이름',
	USERs_EMAIL varchar(30) comment '이메일'
);

insert  into  users values
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
	table_WRITER varchar(100) not null comment '작성자',
	REG_DATE date comment '등록일',
	UPDATE_DATE date comment '수정일',
	foreign key(table_WRITER) references users(USERS_ID),
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

select tables.BOARD_NO as '게시물번호', concat(tables.BOARD_NO, '번')  as '게시물제목', users.USERs_NAME as '게시물작성자', group_concat(tables.TABLE_CONTENT) as '댓글목록'
from tables
join users
on users.USERs_ID = tables.table_WRITER
join categle
on tables.BOARD_NO = categle.categle_NO
group by tables.BOARD_NO; 

select tables.BOARD_NO as '게시물번호', concat(tables.BOARD_NO, '번')  as '게시물제목', max(users.USERs_NAME) as '게시물작성자', group_concat(tables.TABLE_CONTENT) as '댓글목록'
from tables
join users
on users.USERs_ID = tables.table_WRITER
join categle
on tables.BOARD_NO = categle.categle_NO
group by tables.BOARD_NO; 

select categle_NO, categle_TITLE, categle.categle_REG_DATE
from users
join categle
on users.USERs_ID = categle.categle_WRITER;