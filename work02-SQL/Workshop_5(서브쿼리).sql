-- ### SubQuery ###
-- 1.  ‘SMITH'의 직무와 같은 사람의 이름, **** 부서명, 급여, 직무를  출력하라.
select emp.ename, dept.dname, emp.sal, emp.job
from emp, dept
where emp.deptno = dept.deptno 
and dept.deptno = (select deptno from emp where ename = 'SMITH');



-- 2.  ‘JONES’가 속해있는 부서의 모든 사람의 사원번호, 이름, 입사일, 급여를 출력하라.
select empno, ename, hiredate, sal
from emp
where deptno = (select deptno from emp where ename = 'JONES');

-- 3.  전체 사원의 평균급여보다 급여가 많은 사원의 사원번호, 이름,부서번호, 입사일,급여를 출력하라.
select empno, ename, deptno, hiredate, sal
from emp
where sal > (select avg(sal) from emp);


-- 4. 10번 부서와 같은 일을 하는 사원의 사원번호, 이름, 급여를 검색..급여가 많은 순으로 출력하라.
select empno, ename, sal, job
from emp
where job in (select job from emp where deptno=10)
order by 3 desc;



-- 5.  10번 부서 중에서 30번 부서에는 없는 업무를 하는 사원의 사원번호, 이름, 부서번호,업무, 입사일을 출력하라.
select empno, ename, deptno, job, hiredate
from emp
where job not in (select job from emp where deptno=30);



-- 6.  ‘KING’이나 ‘JAMES'의 급여와 같은 사원의 사원번호, 이름,급여를 출력하라.
select empno, ename, sal
from emp
where sal in (select sal from emp where ename in ('KING', 'JAMES'))
and ename!= 'KING' and ename!= 'JAMES';


-- 7.  급여가 30번 부서의 최고 급여보다 높은 사원의 사원번호,이름, 급여를 출력하라.
select empno, ename, sal
from emp
where sal > (select max(sal) from emp where deptno=30);


-- 8. SCOTT의 급여보다 더많은 급여를 받는 사원을 검색
-- 2가지 방법을 사용 1) 서브쿼리  2) 테이블 알리야스를 사용
-- 1) 
select *
from emp
where sal > (select sal from emp where ename='SCOTT');


-- 2) **** 
select * from emp a, (select sal from emp where ename='SCOTT') b
where a.sal > b.sal;

-- 9. ***** 부서별 최소급여 중에서 20번 부서의 최소급여보다 더 큰 최소급여를 검색
select min(sal), deptno
from emp
group by deptno
having min(sal) > (select min(sal) from emp where deptno=20);

-- 10. 급여가 10번부서에 속한 ******어떤****** 사원의 급여보다 더 많은 급여를 받는 사원을 검색. 
-- 이때 10번 부서에 속한 사원은 제외 
-- 정렬은 사원번호순으로 한다. 
select empno, ename, sal, deptno
from emp
where sal > ANY (select sal from emp where deptno=10)
and deptno!=10
order by 1;


-- 11. 30번 소속 사원들 중에서 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사원의 이름과 급여를 검색 
-- 2가지 방법 사용
-- 1)
select ename, sal
from emp 
where sal > (select max(sal) from emp where deptno=30);

-- 2) ****** 위의 결과를 가지고 다시 디스플레이 해야한다. having절이 필요 ************************* 

-- 1)
SELECT max(sal) FROM emp WHERE deptno = 30; -- (2850) 30번 소속 사원들 중 가장 많이 받는 사원의 급여

-- 2) 위의 결과를 가지고 다시 디스플레이 해야한다. having절이 필요
SELECT deptno, max(sal) FROM emp GROUP BY deptno; -- 5000 | 3000 | 2850

SELECT deptno, max(sal) FROM emp 
GROUP BY deptno 
HAVING deptno=30;

SELECT ename, sal FROM emp 
WHERE sal > (SELECT max(sal) FROM emp 
GROUP BY deptno 
HAVING deptno=30);

SELECT ename, sal FROM emp
WHERE sal > ALL(SELECT sal FROM emp WHERE deptno = 30);


-- 12. 부하직원을 거느린 사원을 검색 . 상사이름과 상사의 사원번호가 검색되도록(얄리야스 상사이름, 상사사원번호)
-- 1)
select distinct m. ename
from emp e, emp m
where e.mgr=m.empno;

-- 2)
select ename
from emp
where empno in (select mgr from emp);


