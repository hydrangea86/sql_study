
-- �ǽ�����

-- 1. employees���̺��� �� ����� �μ��� �μ� ��ȣ(department_id)�� ��� �޿�(salary)�� ��ȸ�ϼ���. 
SELECT 
    NVL(department_id, 0) AS dep_id
    ,TO_CHAR(AVG(salary), 'L999,999,999') AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY dep_id
;

-- 2. employees���̺��� �μ��� �μ� ��ȣ(department_id)�� �μ��� �� ��� ���� ��ȸ�ϼ���.
SELECT 
    NVL(department_id, 0) AS dep_id
    ,COUNT(*)
FROM employees
GROUP BY department_id
ORDER BY dep_id
;

-- 3. employees���̺��� �μ��� �޿� ����� 8000�� �ʰ��ϴ� �μ��� �μ���ȣ�� �޿� ����� ��ȸ�ϼ���.
SELECT
     NVL(department_id, 0) AS dep_id
    ,TO_CHAR(AVG(salary), 'L999,999,999')
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 8000
ORDER BY dep_id
;


-- 4. employees���̺��� �޿� ����� 8000�� �ʰ��ϴ� �� ����(job_id)�� ���Ͽ� 
--    ���� �̸�(job_id)�� SA�� �����ϴ� ����� �����ϰ� ���� �̸��� �޿� ����� 
--    �޿� ����� ���� ������ �����Ͽ� ��ȸ�ϼ���.
SELECT
    job_id
    ,TO_CHAR(AVG(salary), 'L999,999,999') AS avg_salary
FROM employees
WHERE job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING AVG(salary) > 8000
ORDER BY avg_salary DESC
;

