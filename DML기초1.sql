
-- DML: ������ ���۾�
-- SELECT, INSERT, UPDATE, DELETE

INSERT INTO BOARD
    (bno,title,content,writer,reg_date)
VALUES
    (1,'�ȳ�~','��մ� �����Դϴ�.','������',SYSDATE);
    
SELECT*FROM board

-- NOT NULL �������ǿ� ����

INSERT INTO BOARD
    (bno,title,content,writer,reg_date)
VALUES
    (2,'��մ� �����Դϴ�2.','�Ѹ�',SYSDATE);
    
INSERT INTO BOARD
    (bno,title,content,writer,reg_date)
VALUES
    (1,'���ο� ���̾�', '��մ� �����Դϴ�3.','�Ѹ�', SYSDATE);
    
INSERT INTO BOARD
    (bno,title,content,writer,reg_date)
VALUES
    (3,'���ο� ���̾�','�Ѹ�',SYSDATE);
    
-- ���̺��� ��� �÷��� ä���� ������ ��� �÷������� ������ �� ����
INSERT INTO BOARD
   
VALUES
    (4,'�ȳ�~4','��մ� �����Դϴ�.4','��浿',SYSDATE);
    
    
SELECT * FROM board

-- ������ ����
UPDATE board
SET content='�¾����ʹ�'
WHERE bno = 3;

UPDATE board
SET title = '�޷ո޷���'
    .content = '��ȣ��ȣ��ȣ��ȣ~~~'
    .writer = '�ڿ���'
WHERE bno = 1;

-- WHERE���� ������ ��� ��ü���� �����ǹǷ� ����
UPDATE board
SET writer = '������';

--ex)
UPDATE member
SET age = age + 1;


--������ ����
DELETE FROM board
WHERE bno = 3;

COMMIT;

-- �ѹ��� ���� ���� COMMIT���� ���ư��� ��.
ROLLBACK;

SELECT * FROM board

-- ��ü ������ ����
-- 1. WHERE���� ������ DELETE�� (ROLLBACK ����, ����Ŀ��, �α׳���� ����)
DELETE FROM board;
ROLLBACK;

-- 2. TRUNCATE TABLE(ROLLBACK �Ұ���, �ڵ�Ŀ��, �α׳�������, ���̺���� �ʱ���·� ���ư�)
TRUNCATE TABLE board;

-- 3. DROP TABLE(ROLLBACK �Ұ���, �ڵ�Ŀ��, �α׳�������, ���̺� ������ ���� ������)
-- DDL(CREATE, ALTER, DROP, RENAME, TURNCATE)�� �ڵ�Ŀ��

DROP TABLE board;


