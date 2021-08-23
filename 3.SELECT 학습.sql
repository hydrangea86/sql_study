

-- LIKE ������
-- �˻��� ���
-- ���ϵ�ī�� ���� - %: 0���� �̻� // _: �� 1����

SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '��%'
;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
WHERE emp_nm LIKE '%��'
;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
WHERE addr LIKE '%����%'
;


SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '��__'
;

SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '_��%'
;

SELECT
    emp_no, emp_nm, birth_de, dept_cd
FROM tb_emp
WHERE emp_nm LIKE '��%'
    AND dept_cd IN('100003', '100004', '100006')
    AND birth_de BETWEEN '19900101' AND '19991231'
;

-- ���� �񱳿�����( <>, != )
SELECT
    emp_no, 
    emp_nm, 
    sex_cd
FROM tb_emp
WHERE sex_cd <> 1
    AND emp_nm NOT LIKE '��%'
;

-- null�� ��ȸ
SELECT 
    emp_no, emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NULL
;

SELECT 
    emp_no, emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL
;
