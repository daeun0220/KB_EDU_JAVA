--그룹함수 : 각 그룹당 한
/*
 COUNT, SUM, AVG, MAX, MIN
 
 SUM, AVG
 COUNT, MAX, MIN
*/
-- count() 
select count(*) 전체사워수 from emp;
select count(empno) 전체사워수 from emp; -- null 값이 들어갈 수 없는 기본키로 전체개수 셀 수 있다
select count(-1) 전체사워수 from emp;

select round(avg(sal)), sum(sal), min(sal), max(sal) from emp;

select min(hiredate), max(hiredate)from emp;

select count(*) "사원수" from emp where deptno in (10,20);

--emp테이블에서 부서번호 수
select count(distinct deptno) from emp;

select distinct count(deptno) from emp;

select round(avg(nvl(comm,0))) from emp;  -- null값 주의 

--select deptno, avg(sal) from emp;     X) deptno가 한개가 아니라서
--grpup by 절 뒤에 명시되어저야 한다

select deptno, avg(sal) from emp group by deptno;  

select deptno, avg(sal)"AvgSalary" from emp group by deptno order by 2;  

--GROUP BY 뒤에 as 붙이지 못한다. --> 실행순서 때문에 / *** MYSQL 은 안남 

select deptno DNumber, round(avg(sal)) AVGSAL --4
from emp    --1
where deptno!=10  --2
group by deptno  --3
order by deptno; --5 항상 마지막임 

select extract(year from hiredate)"입사년도", count(*)인원수
from emp
group by extract(year from hiredate); -- 입사년도 쓰는거 안됨 

select to_char(hiredate, 'YY')입사년, count(empno)사원수 
from emp
group by to_char(hiredate, 'YY')
order by 1;
----******** WHERE절에 GROUP BY 사용 XXXXXX ************ AS 도 못온다
--select deptno, round(avg(sal)) from emp where round(avg(sal))>=2000 group by deptno;

select deptno, round(avg(sal)) from emp HAVING round(avg(sal))>=2000 group by deptno;
--HAVING : GROUPING 을 한 다음에 추려서 디스플레이한다.
select deptno, round(avg(sal)) 
from emp  
group by deptno
HAVING round(avg(sal))>=2000;

--최대 급여가 2900 넘는 부서들의 최대급여 출력     / WHERE절인지 HAVING절인지 파악 --> HAVING이면 GROUP BY 따라옴
select deptno, max(sal)"최대급여"     -- 1) 부서별 최대급여
from emp                             -- 2) 5000, 3000 
group by deptno
having max(sal) > 2900;

select deptno, count(*), sum(sal) from emp group by ROLLUP(deptno);
select deptno, count(*), sum(sal) from emp group by deptno;
--ROLLUP
select deptno, job, sum(sal) from emp group by rollup(deptno, job);
select deptno, job, sum(sal) from emp group by deptno, job;
select deptno, job, sum(sal) from emp group by rollup(job, deptno);
--GROUPING SETS
select deptno, job, sum(sal) from emp group by GROUPING SETS(deptno, job);

select deptno, sum(sal)
from emp
group by deptno
UNION ALL
select job, sum(sal)
from emp
group by job;
-- UNION ALL 같은 타입끼리만 합칠 수 있다

select to_char(deptno), sum(sal) -- to_char 사용 문자열로 바꾸기 위해
from emp
group by deptno
UNION ALL
select job, sum(sal)
from emp
group by job;

-- GROUPING SETS!!! 
-- step 1
select deptno, job, sum(sal) from emp group by grouping sets(deptno, job);
-- step 2
select deptno, sum(sal) from emp group by deptno 
union all
select job, sum(sal) from emp group by job;

-- step 3
select to_char(deptno), sum(sal) from emp group by deptno 
union all
select job, sum(sal) from emp group by job;

-- step 4
select deptno ||'', sum(sal) from emp group by deptno 
union all
select job, sum(sal) from emp group by job;

-- step 5
select deptno, NULL job, sum(sal) from emp group by deptno 
union all
select NULL deptno, job, sum(sal) from emp group by job;
/*
통계쿼리 작성시 동일한 쿼리문을 Group by 절에 작성하고 변경되는 부분들을 일일이 작성한 후 UNION ALL로 결합하는 방식과(3,4,5)
GROUPING SETS를 사용하는 방식이 있는데(1)
GROUPING SETS를 사용한 방식이 훨씬 속도가 빠르다 ****
*/




