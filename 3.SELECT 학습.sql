

-- LIKE 연산자
-- 검색시 사용
-- 와일드카드 매핑 - %: 0글자 이상 // _: 단 1글자

SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '이%'
;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
WHERE emp_nm LIKE '%심'
;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
WHERE addr LIKE '%용인%'
;


SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '이__'
;

SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '_정%'
;

SELECT
    emp_no, emp_nm, birth_de, dept_cd
FROM tb_emp
WHERE emp_nm LIKE '김%'
    AND dept_cd IN('100003', '100004', '100006')
    AND birth_de BETWEEN '19900101' AND '19991231'
;

-- 부정 비교연산자( <>, != )
SELECT
    emp_no, 
    emp_nm, 
    sex_cd
FROM tb_emp
WHERE sex_cd <> 1
    AND emp_nm NOT LIKE '이%'
;

-- null값 조회
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
