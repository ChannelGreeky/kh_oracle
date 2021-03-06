--GROUP BY 예제
SELECT NVL(DEPT_CODE,'부서없음') AS 부서, 
TO_CHAR(SUM(SALARY),'L999,999,999') AS 급여합계, 
TO_CHAR(FLOOR(AVG(SALARY)),'L999,999,999') AS 급여평균,
COUNT(*)||'명' AS 인원수 
FROM EMPLOYEE GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

SELECT DECODE(SUBSTR(EMP_NO,8,1),1,'남', 2,'여') AS 성별,
SUM(SALARY) AS 월급합계, 
FLOOR(AVG(SALARY)) AS 월급평균,
COUNT(*) AS 인원수
FROM EMPLOYEE 
GROUP BY DECODE(SUBSTR(EMP_NO,8,1),1,'남', 2,'여')
ORDER BY COUNT(*) DESC;

--HAVING절 예제
SELECT DEPT_CODE AS 부서코드, 
TRIM(TO_CHAR(FLOOR(AVG(SALARY)), 'L999,999,999')) AS 월급평균
FROM EMPLOYEE GROUP BY DEPT_CODE
HAVING AVG(SALARY) > 3000000;


--ROLLUP / CUBE 예제
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE GROUP BY ROLLUP(DEPT_CODE);

SELECT DEPT_CODE, JOB_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE, JOB_CODE)
ORDER BY DEPT_CODE;

--ROLLUP / CUBE / GROUPING 문제
--문제 부서내 직급별 급
SELECT CASE
    WHEN DEPT_CODE IS NULL AND GROUPING(DEPT_CODE)=1 THEN '집계'
    WHEN DEPT_CODE IS NULL THEN '인턴'
    ELSE DEPT_CODE
END AS "부서명",
NVL(JOB_CODE, '합계') AS "직급코드", 
COUNT(*)||'명' AS 인원,
CASE
    WHEN GROUPING(DEPT_CODE)='1' AND GROUPING(JOB_CODE)='1' THEN '총 합계'
    WHEN GROUPING(DEPT_CODE)='0' AND GROUPING(JOB_CODE)='1' THEN '부서별 집계'
    WHEN GROUPING(DEPT_CODE)='1' AND GROUPING(JOB_CODE)='0' THEN '직급별 집계'
    ELSE '그룹별 집계'
END AS 통계,
TRIM(TO_CHAR(SUM(SALARY), 'L999,999,999')) AS 월급합계
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE, JOB_CODE)
ORDER BY "부서명" ASC, "직급코드" ASC;