
CREATE TABLE BOARD(
    BNO NUMBER(10) PRIMARY KEY,
    TITLE VARCHAR2(200) NOT NULL,
    CONTENT VARCHAR2(2000),
    WRITER VARCHAR2(50) NOT NULL,
    REG_DATE DATE
);

-- DML: 데이터 조작어
-- SELECT, INSERT, UPDATE, DELETE

INSERT INTO BOARD
    (bno, title, content, writer, reg_date)
VALUES
    (1, '안녕~', '재밌는 내용입니다.', '마이콜', SYSDATE);
    

-- NOT NULL 제약조건에 위반 

INSERT INTO BOARD
    (bno, content, writer, reg_date)
VALUES 
    (2, '재밌는 내용입니다2.', '둘리', SYSDATE);
    
    
-- PK 제약조건 위반
INSERT INTO BOARD
    (bno, title, content, writer, reg_date)
VALUES
    (1, '새로운 글이야', '재밌는 내용입니다3.','둘리', SYSDATE);

SELECT * FROM BOARD;
    
INSERT INTO BOARD
    (bno, title, writer, reg_date)
VALUES
    (3,'새로운 글이야','둘리',SYSDATE);
    
    
-- 테이블의 모든 컬럼을 채워서 삽입할 경우 컬럼지정을 생략할 수 있음
INSERT INTO BOARD
   VALUES
    (4,'안녕~4','재밌는 내용입니다.4','고길동',SYSDATE);
    

-- 데이터 수정
UPDATE board
SET title = '굿애프터눈'
WHERE bno = 3;

UPDATE board
SET content = 'hello'
WHERE bno = 3;


UPDATE board
SET title = '방가방가'
        , content = 'hello~~~'
        , writer = '박영희'
WHERE bno = 1;


SELECT * FROM board;


-- WHERE절을 생략할 경우 전체행이 수정되므로 주의
UPDATE board
SET writer = '관리자';

--ex)
UPDATE member
SET age = age + 1;


--데이터 삭제
DELETE FROM board
WHERE bno = 4;

INSERT INTO BOARD
    (bno, title, content, writer, reg_date)
VALUES 
    (3, '안녕~', '재밌는 내용입니다.', '마이콜', SYSDATE);

COMMIT;

SELECT * FROM board;

INSERT INTO BOARD
    (bno, title, content, writer, reg_date)
VALUES 
    (4, '안녕~', '재밌는 내용입니다.', '마이콜', SYSDATE);
    
-- 롤백은 최종 시점 COMMIT으로 돌아가는 것.

ROLLBACK;

DELETE FORM board
WHERE bno = 1;

SELECT * FROM board;


-- 전체 데이터 삭제
-- 1. WHERE절을 생략한 DELETE절 (ROLLBACK 가능, 수동커밋, 로그남기기 가능)
DELETE FROM board;
ROLLBACK;


-- 2. TRUNCATE TABLE(ROLLBACK 불가능, 자동커밋, 로그남지않음, 테이블생성 초기상태로 돌아감)
TRUNCATE TABLE board;


-- 3. DROP TABLE(ROLLBACK 불가능, 자동커밋, 로그남지않음, 테이블 구조가 완전 삭제)
-- DDL(CREATE, ALTER, DROP, RENAME, TURNCATE)은 자동커밋

DROP TABLE board;



