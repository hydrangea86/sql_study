CREATE TABLE score (
    stu_num NUMBER(10),
    stu_name VARCHAR2(20) NOT NULL,
    kor NUMBER(3) NOT NULL,
    eng NUMBER(3) NOT NULL,
    math NUMBER(3) NOT NULL,
    total NUMBER(3),
    average NUMBER(5,2), 
    CONSTRAINT pk_score PRIMARY KEY (stu_num)
);


-- ¿¬¼ÓµÈ ¼ýÀÚ »ý¼º
CREATE SEQUENCE seq_score;

SELECT * FROM score;

INSERT INTO score VALUES (seq_score.nextval,  'È«±æµ¿', 90, 90, 90, 270, 90);
INSERT INTO score VALUES (seq_score.nextval,  '±èÃ¶¼ö', 80, 80, 80, 240, 80);
INSERT INTO score VALUES (seq_score.nextval,  '¹Ú¿µÈñ', 100, 100, 100, 300, 100);
COMMIT;


DELETE FROM score WHERE stu_num = 1;
COMMIT;


CREATE SEQUENCE seq_board;

DROP TABLE board;
CREATE TABLE board (
    board_no NUMBER(10),
    writer VARCHAR2(20) NOT NULL,
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(2000),
    view_cnt NUMBER(10) DEFAULT 0,
    reg_date DATE DEFAULT SYSDATE,
    CONSTRAINT pk_board PRIMARY KEY (board_no)
);

INSERT INTO board 
    (board_no, writer, title, content)
VALUES (seq_board.nextval,'°³±¼ÀÌ', '¶Ñ²®µÎ²®','Áñ~~~~~');
COMMIT;

SELECT * FROM board;