--JOIN
--여러 테이블로부터 데이터를 가져올 때 사용되는 기법

-- 직원에 대한 정보를 가져옴 
select * from emp;
-- 부서에 대한 정보를 가져옴 
select * from dept;

--직원, 부서에 대한 정보를 가져옴
select * from emp, dept;

/*
위처럼 나온 결과를 Cartesian Product 라 한다
emp와 dept 테이블의 수평적인 결합 결과
14 X 4 = 56행
==> JOIN 써야한다
*/
--step 1
--1. 조인조건은 양쪽 테이블의 공통적인 컬럼이 조인 조건이 되는 컬럼이다.
--2. 조인조건은 where절에서 지정 = 를 사용해서 명시
select * from emp, dept where emp.deptno = dept.deptno;

--step 2 
--a.deptno / b.deptno 명시해줘야한다
-- deptno 이 어느 테이블에서 가져와야 하는지...
-- 모든 테이블을 다 뒤적거리기 때문에 성능에 치명적인 영향을 끼친다
select empno, ename, sal, deptno, dname from emp, dept where emp.deptno = dept.deptno;   -- 에러 난다

--3
select emp.empno, emp.ename, emp.sal, emp.deptno, dept.dname from emp, dept where emp.deptno = dept.deptno;

--4  테이블명 붙여줘서 더 간단하게! 
select e.empno, e.ename, e.sal, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno;

-- 사원이름,
select e.ename, e.sal, e.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and e.sal>=2000 and d.deptno=30;

--뉴욕에서 근무하는 사원의 이름과 급여
select e.ename, e.sal
from emp e, dept d
where e.deptno= d.deptno and d.loc='NEW YORK';

--self 조인 :: 하나의 테이블을 자체적으로 조인함
-- 특정 사원의 상사의 이름을 검색
select empno, ename, mgr from emp;

/*  1STEP
   EMP E
1. 특정 사원의 ename을 조회해서 emp테이블에서 찾는다...SMITH
2. SMITH의 상사번호 mgr을 조회.. 관리자번호를 찾는다...7902
   EMP M
3. 다시 7902 번호의 empno을 찾는다
4. empno가 7902번인 사원의 이름 ename을 찾는다...FORD
*/

select empno, ename, mgr from emp; --e 사원의 상사번호 찾고
select empno, ename from emp; --m 사원의 이름을 찾고 

select * from 
(select empno, ename, mgr from emp) e, 
(select empno, ename from emp) m;

-- 2step 조인조건 추가
select * from 
(select empno, ename, mgr from emp) e, 
(select empno, ename from emp) m 
where e.mgr = m.empno;

--3step. Alias를 지정, 사원번호, 사원이름, 상사이름
select e.empno as 사원번호, e.ename 사원이름, m.ename 상사이름 
from emp e, emp m
where e.mgr = m.empno
order by 1;

--4step. 특정 사원(BLAKE)의 상사 이름을 검색
select m.ename 상사이름 
from emp e, emp m
where e.mgr = m.empno AND e.ename = 'BLAKE';


-- OUTER JOIN
select distinct(deptno) from emp;
select deptno from dept; 

select e.empno, e.ename, e.job, e.deptno e_edeptno, d.deptno d_deptno, d.dname
from dept d, emp e
where d. deptno = e.deptno(+);

select e.ename, e.sal, e.deptno, d.deptno, d.dname
from emp e, dept d
where e.deptno(+) = d.deptno and e.sal(+) > 2000;



















