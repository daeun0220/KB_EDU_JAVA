-- SUB QUERY
-- ? 에 해당하는 부분을 ()안에 쿼리를 먼저 수행하고, 그 결과가 main쿼리에서 실행..
-- (CLARK의 급여)보다 더 많은 급여를 받는 사원의 이름과 급여, 업무를 검색
-- One row + One column => 스칼라 서브쿼리
select ename, sal, job                -- Main Query  (Outer) 
from emp 
where sal > (select sal from emp where ename='CLARK');    --Sub Query (Inner)

select empno, ename, job, hiredate, sal
from emp
where job = (select job from emp where empno = 7521)
and sal > (select sal from emp where empno = 7934);

select ename, deptno, sal, hiredate
from emp 
where sal = (select max(sal) from emp);

select ename
from emp
where deptno=10
and sal > (select AVG(sal) from emp);

--job별 가장 작은 평균급여 검색
--HAVING 절 뒤에 오는 서브쿼리 
--*** 그룹함수 중첩    // MySQL은 그룹함수 중첩 안됨 
select job, round(avg(sal))
from emp
group by job
having avg(sal) = (select min(avg(sal)) from emp group by job); 

--FROM 절 뒤에 오는 서브쿼리
--사원중에서 급여를 가장 많이 받는 사원 랭킹3 검색
select ename, sal, rownum 급여순위
from (select * from emp order by sal desc)
where rownum<=3;

--scott의 급여보다 더 많은 급여를 받는 사원 검색
--step1
select ename, sal
from emp
where sal > (select sal from emp where ename='SCOTT');

--step2
select * from emp a, (select sal from emp where ename='SCOTT') b
where a.sal > b.sal;

select empno, ename 
from emp
where sal in (select min(sal) from emp group by deptno);  -- 다중행 서브쿼리라서 IN 사용해야함!! 

select ename, sal, job 
from emp
where sal > ANY (select sal from emp where job='SALESMAN');

select ename, sal, job, hiredate
from emp
where sal > ALL (select sal from emp where job='SALESMAN');

--***** 부서번호가 30인 사원의 급여중에서 가장 낮은 급여보다 더 높은 급여를 받는 서원의 이름...
--1)그룹함수


--2) ****다중행 연산자
select sal, empno, deptno
from emp
where sal >= ANY(select sal from emp where deptno=30) order by 1;

-- 서브쿼리에서 NULL값
--emp테이블에서 부하직원을 거느린 사원 검색
select ename, empno
from emp
where empno in (select mgr from emp);

select distinct m.ename, m.empno
from emp e, emp m
where e.mgr = m.empno;
----------------------------------------------
-- 반대 NOT IN 썼는데 안나오는 이유 : NULL값은 비교연산자 사용할 수 없어서 나오지 않는거
--> ******* NVL로 치환해줘야한다
select ename, empno
from emp
where empno not in (select NVL(mgr,0) from emp);

















