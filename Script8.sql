create table EMP(
	EMP_NO int not null primary key comment '직원번호',
	EMP_NAME varchar(20) comment '직원명',
	DEPT_NO int comment '소속번호',
	ADDRESS varchar(50) comment '주소'
);

insert into EMP values
(1001, '정소화', 1, '인천 연수구 송도동'),
(1002, '김용욱', 2, '인천 남동구 구월동'),
(1003, '고명석', 3, '인천 미추홀구 숭의동'),
(1004, '박종하', 1, '인천 서구 가좌동'),
(1005, '하유경', 2, '서울 관악구 온천동'),
(1006, '손준우', 3, '서울 금천구 가산동'),
(1007, '손미정', 1, '서울 서초구 반포동'),
(1008, '이예성', 2, '부산 동구 초량동'),
(1009, '노희영', 3, '부산 영도구 남향동'),
(1010, '문채윤', 1, '부산 사하구 감천동');

create table DEPT(
	DEPT_NO int not null primary key comment '부서번호',
	DEPT_NAME varchar(20) comment '부서명'
);

insert into DEPT values
(1, '인사부'),
(2, '연구부'),
(3, '홍보부');

select * from dept;
select * from emp;

