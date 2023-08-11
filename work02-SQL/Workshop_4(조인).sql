-- ### equi join ###

-- 1.  emp와 dept Table을 JOIN하여 부서번호, 부서명, 이름, 급여를  출력하라.
select d.deptno, d.dname, e.ename, e.sal
from dept d, emp e
where d.deptno = e.deptno;



-- 2.  이름이 ‘SMITH’인 사원의 부서명을 출력하라.
select d.dname
from dept d, emp e
where d.deptno = e.deptno and e.ename='SMITH';

 
-- ### outer join ###
-- 3.  dept Table에 있는 모든 부서를 출력하고, emp Table에 있는 DATA와 JOIN하여 
-- 모든 사원의 이름, 부서번호, 부서명, 급여를 출력 하라.
select e.ename, e.deptno, d.dname, e.sal
from dept d, emp e
where d.deptno = e.deptno(+);


-- ###self join###
-- 4.  emp Table에 있는 empno와 mgr을 이용하여 서로의 관계를 다음과 같이 출력하라. ‘SMTH의 매니저는 FORD이다’
select e.ename || '의 매니저는 ' || m.ename || '이다'
from emp e, emp m
where e.mgr = m.empno;




-- ### join 실습 ###

-- 1. 관리자가 7698인 사원의 이름, 사원번호, 관리자번호, 관리자명을 출력하라.
select e.ename, e.empno, m.empno, m.ename
from emp e, emp m
where e.mgr = m.empno and e.mgr = 7698;


-- 2. 업무가 MANAGER이거나 CLERK인 사원의 사원번호, 이름, 급여, 업무, 부서명
select e.empno, e.ename, e.sal, e.job, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.job in ('MANAGER', 'CLERK');

--조인 표시..?
select empno, ename, job, deptno, dname
FROM   emp   JOIN dept   USING (deptno)
WHERE  job ='MANAGER' or job='CLERK'  ;







