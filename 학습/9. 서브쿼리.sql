
-- # 단일 행 서브쿼리
-- 서브쿼리의 조회 결과가 1건 이하인 경우

-- 부서번호가 100004번인 부서의 모든 사원정보 조회
SELECT * 
from tb_emp
WHERE dept_cd = '100004'
;


-- 이나라가 속해있는 부서의 모든 사원정보 조회

SELECT * 
from tb_emp
WHERE dept_cd = (SELECT dept_cd FROM tb_emp WHERE emp_nm = '이관심')
;


-- 20200525에 받은 급여가 회사의 20200525일 전체 평균 급여보다 높은 사원들의 사원정보 조회
SELECT
    A.emp_no, A.emp_nm, B.pay_de, B.pay_amt
FROM tb_emp A 
JOIN tb_sal_his B
ON A.emp_no = B.emp_no
WHERE B.pay_de = '20200525'
    AND B.pay_amt >= '5월 급여 평균'
ORDER BY A.emp_no, B.pay_de;

-- 회사 5월 급여 평균
SELECT 
    AVG(pay_amt)
FROM tb_sal_his
WHERE pay_de = '20200525'
;

--해설
SELECT
    A.emp_no, A.emp_nm, B.pay_de, B.pay_amt
FROM tb_emp A 
JOIN tb_sal_his B
ON A.emp_no = B.emp_no
WHERE B.pay_de = '20200525'
    AND B.pay_amt >= (
                        SELECT 
                            AVG(pay_amt)
                        FROM tb_sal_his
                        WHERE pay_de = '20200525'
                        )
ORDER BY A.emp_no, B.pay_de;

-- *단일 행은 한 컬럼에 한 열에 값만


-- #다중 행 서브 쿼리
-- 서브쿼리의 조회 건수가 여러 행인 것

-- 한국데이터베이스진흥원에서 발급한 자격증을 가지고 있는
-- 사원의 사원번호와 사원이름과 자격증 개수를 조회

SELECT
*
FROM tb_certi
WHERE issue_insti_nm = '한국데이터베이스진흥원'
;

SELECT
    A.emp_no, B.emp_nm, COUNT(A.certi_cd)
FROM tb_emp_certi A
JOIN tb_emp B
ON A.emp_no = B.emp_no
WHERE A.certi_cd IN(SELECT certi_cd FROM tb_certi WHERE issue_insti_nm = '한국데이터베이스진흥원')
GROUP BY A.emp_no, B.emp_nm
ORDER BY A.emp_no
;

-- # 다중 컬럼 서브쿼리
-- 비교 대상 다중 컬럼 수 맞춰줘야 함

-- 부서원이 2명 이상인 부서 중에서 각 부서의 가장 연장자의 사원정보를 조회
SELECT
    A.emp_no, A.emp_nm, A.birth_de, A.dept_cd, B.dept_nm
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
WHERE (A.dept_cd, A.birth_de) IN(
                    SELECT 
                        dept_cd, MIN(birth_de)
                    FROM tb_emp
                    GROUP BY dept_cd
                    HAVING COUNT(*) >= 2
                   )
ORDER BY A.emp_no
;

-- EXISTS 문

-- 주소가 강남인 직원들이 근무하고 있는 부서들의 부서정보를 조회

SELECT
    emp_nm, addr, dept_cd
FROM tb_emp
WHERE addr LIKE '%강남%'
;

SELECT * FROM tb_dept WHERE dept_cd IN('100009','100010');

SELECT 'X' FROM tb_emp WHERE addr LIKE '%서울%';

SELECT 
    A.dept_cd, A.dept_nm
FROM tb_dept A
WHERE EXISTS(
                SELECT
                    1
                FROM tb_emp B
                WHERE B.addr LIKE '%강남%'
                AND A.dept_cd = B.dept_cd
            )
;

-- 스칼라 서브쿼리 (SELECT절에 쓰는 서브쿼리) 연관성 서브쿼리
SELECT
    A.emp_no, A.emp_nm
    , (SELECT dept_nm FROM tb_dept B WHERE A.dept_cd = B.dept_cd)AS dept_nm
    , A.addr, A.birth_de
FROM tb_emp A
;

-- 인라인 뷰 (FROM절에 쓰는 서브쿼리)
SELECT 
    B.emp_no, B.emp_nm, A.pay_avg
FROM(
        SELECT emp_no, AVG(pay_amt) AS pay_avg
        FROM tb_sal_his
        GROUP BY emp_no
    )A, tb_emp B
WHERE A.emp_no = B.emp_no
;
