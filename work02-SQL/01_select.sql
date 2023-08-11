SELECT * FROM emp;
/* SELECT :: Projection | Selection
   Projection 원하는 컬럼만 가져옴
   Selection 원하는 행만 가져옴... 조건부여 
*/
SELECT empno, ename, job, deptno FROM emp;

--emp에서 모든 사원의 이름과 입사일을 검색 + Selection
SELECT ename, hiredate FROM emp;
SELECT ename, hiredate FROM emp WHERE job = 'SALESMAN';
--emp에서 부서번호가 10번 부서인 사원의 이름, 업무, 급여, 부서번호를 검색
SELECT ename, job, sal, deptno FROM emp WHERE deptno=10;
--급여순으로 정렬 (default가 오름차순) 
SELECT ename, job, sal, deptno FROM emp WHERE deptno=10 ORDER BY sal ASC;
SELECT ename, job, sal, deptno FROM emp WHERE deptno=10 ORDER BY sal DESC;
--컬럼명 줄 수도 번호로 줄 수도 있다
SELECT ename, job, sal, deptno FROM emp WHERE deptno=10 ORDER BY 3 DESC;
--행을 나타내는 키워드 :: rownum :: 행을 제한할 때 사용 
--ORDER BY가 오라클에서는 가장 마지막에 실행(ROWNUM이 그전에 실행된다)
SELECT ename, sal, job, rownum FROM emp WHERE deptno=10 ORDER BY sal DESC;
--정렬을 강제적으로 먼저 시킨 다음, ROWNUM을 적용!! (FROM 먼저 도니까 그 안에 ORDER BY 끼워넣는다) 
SELECT ename, sal, job, rownum AS RANKING
FROM (SELECT * FROM emp ORDER BY sal DESC)
WHERE rownum<=3;
/*
SELECT 구문의 서버 안에서의 실행순서
1. 오라클 실행순서
FROM(테이블) --> WHERE(행제한) --> SELECT(컬럼제한) --> ORDER BY(정렬)
2. MYSQL 실행순서
FROM(테이블) --> WHERE(행제한) --> SELECT(컬럼제한) --> ORDER BY(정렬) --> LIMIT(ROWNUM대신) 
*/
/*
Alias
주로 산술연산자 적용된 컬럼에 Alias 를 지정한다
1. 컬럼명 AS 별칭 | 컬럼명 별칭 | 컬럼명 "별칭" | ''은 안됨  
2. "별칭" 별칭에 공백이 있거나 특수문자가 있을 때, 대소문자를 구분할 때 사용한다  (MYSQL은 안됨)
*/
--모든 사원의 급여를 기존급여에서 100을 더한 값의 2배로 증가...
SELECT ename, sal, (sal+100)*2 AS 증가급여, job FROM emp;
--SELECT ename, sal, (sal+100)*2 "증가 급여", job FROM emp ORDER BY "증가 급여";
-- 사원 급여에서 세금을 제외하고 수령한 급여를 검색
--이름, 업무, 금여, 실제수령한 급여,,, 정렬은 실제수령한 급여순으로
SELECT ename, job, sal, sal-(sal*0.1) from emp ordert by 4;

select sal, sal*12 as 연봉 from emp;
/*
null 정리
1. 0도 아니고 공백도 아니다
2. 나름의 의미를 가지는 값이다.
3. 자격없음 혹은 미확정을 뜻하는 값일때 주로 사용된다
3. 연산작용이 안되고 비교
4. null값을 가지고 연산을 해야할때는 다른 값으로 치환시켜 연산한다
5. 오라클에서 null값은 가장 큰 값으로 취급 / MYSQL 은 반대
*/
SELECT job, comm FROM emp ORDER BY comm DESC;

SELECT ename, sal, sal*12+NVL(comm,0) FROM emp;

SELECT ename, job, sal FROM emp WHERE comm IS NULL;
--emp테이블에서 업무가 salesman인 사원의 ~ 연봉이 높은순에서 낮은순으로 정렬되도록
SELECT ename, sal, sal*12 AS 연봉 FROM emp WHERE job='SALESMAN' ORDER BY 연봉 DESC;
--COMM 을 가장 많이 받는 사원순  (// null 인 것 제외해야한다)
SELECT empno, ename, job, comm from emp where comm is not null order by comm desc;
--emp테이블에서 부서번호 검색 (distinct : 중복 제거) 정렬은 별도로 시켜줘야함
/*
DISTINCT : 중복을 벗겨내는 키워드
1. SELECT절 바로 뒤에 온다 2. 정렬기능이 빠져 별도로 정렬해야한다 
3. 중복값을 제거하는 연산은 많은 시간이 걸린다. 성능에 안좋음.
   만약에 불가피하게 사용해야하는 상황이라면 DISTINCT연산 대체하는 방법이나, 
   연산의 대상이 되는 테이블의 크기를 최소화하는 방법을 제안한다
   
   가장 대표적인 대체방법으로 EXISTS를 활용하는 방법이 있다
*/
select deptno from emp group by deptno;
select distinct deptno from emp order by deptno asc; 

select deptno 
from dept d 
where exists(select*from emp e where d.deptno = e.deptno);
/*
LIKE연산자와 와일드카드(%..)
특정 단어가 포함되어 있는 데이터를 검색할 때 많이 사용 
*/
select ename from emp where ename like 'S%';

select ename from emp where ename like '%S%';
--이름에 2번째 문자에 A가 들어간 사원
select ename from emp where ename like '_A%';
--81년도 입사한 사원
select ename from emp where hiredate like '81%';


