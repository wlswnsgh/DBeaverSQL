select * from board;
-- PK인 게시물번호로 검색
SELECT * FROM BOARD WHERE BOARD_NO = 1;

-- 제목으로 검색
SELECT * FROM BOARD WHERE TITLE = 'Bus Stop';

-- 제목으로 인덱스 생성
CREATE INDEX TITLE ON BOARD(TITLE);
Show INDEX FROM Board;

-- 다시 제목으로 검색하여 속도 확인
select * from board where TITLE = 'bus Stop';

-- 쿼리가 어떤 인덱스를 쓰는지 확인
explain
select * from board where TITLE = 'Bus Stop';

-- 인덱스 삭제
drop index index_title on BOARD;
show index from board;

