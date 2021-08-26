
-- 실습문제

-- 1. employees테이블에서 각 사원의 부서별 부서 번호(department_id)와 평균 급여(salary)를 조회하세요. 
SELECT 
    NVL(department_id, 0) AS dep_id
    ,TO_CHAR(AVG(salary), 'L999,999,999') AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY dep_id
;

-- 2. employees테이블에서 부서별 부서 번호(department_id)와 부서별 총 사원 수를 조회하세요.
SELECT 
    NVL(department_id, 0) AS dep_id
    ,COUNT(*)
FROM employees
GROUP BY department_id
ORDER BY dep_id
;

-- 3. employees테이블에서 부서의 급여 평균이 8000을 초과하는 부서의 부서번호와 급여 평균을 조회하세요.
SELECT
     NVL(department_id, 0) AS dep_id
    ,TO_CHAR(AVG(salary), 'L999,999,999')
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 8000
ORDER BY dep_id
;


-- 4. employees테이블에서 급여 평균이 8000을 초과하는 각 직무(job_id)에 대하여 
--    직무 이름(job_id)이 SA로 시작하는 사원은 제외하고 직무 이름과 급여 평균을 
--    급여 평균이 높은 순서로 정렬하여 조회하세요.
SELECT
    job_id
    ,TO_CHAR(AVG(salary), 'L999,999,999') AS avg_salary
FROM employees
WHERE job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING AVG(salary) > 8000
ORDER BY avg_salary DESC
;

