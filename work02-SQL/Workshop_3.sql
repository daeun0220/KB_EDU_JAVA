-- ##################  그룹 함수 실습 ######################

-- 1)  30번 부서 월급의 평균(소수2자리 아래 올림), 최고, 최저, 인원수를 구하여 출력하라.
select round(avg(sal),2), max(sal), min(sal), count(*) from emp group by deptno having deptno=30;
-- 2) 각 부서별 급여의 평균(소수이하 반올림), 최고, 최저, 인원수를 구하여 출력하라.
select round(avg(sal),2), max(sal), min(sal), count(*) from emp group by deptno;


-- 3) * 각 부서별 같은 업무를 하는 사람의 인원수를 구하여 부서번호,업무명, 인원수를 출력하라.
select deptno, job, count(empno) from emp group by deptno, job;  -- group by 에 조회하는 모든 컬럼 다 담아야한다

-- 4) * 같은 업무를 하는 사람의 수가 2명 이상인 업무와 인원수를  출력하라.
select job, count(empno) from emp group by job having count(empno) >= 2;


-- 5) 각 부서별 평균 월급(소수이하 버림), 전체 월급, 최고 월급, 최저 월급을 구하여 평균 월급이 많은 순으로 출력하라. 
select trim(avg(sal)), sum(sal), max(sal), min(sal) from emp group by deptno order by 1;


-- 6) *  각 부서별 같은 업무를 하는 사람의 급여의 합계를 구하여 부서번호,업무명별 급여의 소계와 총합을 출력하라.
-- 부서별 정렬한다.
select deptno,job, sum(sal) from emp group by rollup(deptno, job);




-- 7) 각 부서별 인원수를 조회하되 인원수가 5명 이상인 부서만 출력되도록 하시오.
select deptno, count(empno) from emp group by deptno having count(empno) >= 5;

-- 8)  각 부서별 최대급여와 최소급여를 조회하시오.
--   단, 최대급여와 최소급여가 같은 부서는 직원이 한명일 가능성이 높기때문에    조회결과에서 제외시킨다.
select deptno, max(sal), min(sal) from emp group by deptno having max(sal)!=min(sal);


/* 9) **** 부서가 10, 20, 30 번인 직원들 중에서 급여를 2500 이상 5000 이하를 받는
   직원들을 대상으로 부서별 평균 급여를 조회하시오.
   다, 평균급여가 2000 이상인 부서만 출력되어야 하며, 출력결과를 평균급여가 높은
   부서먼저 출력되도록 해야 한다. */
 select deptno, avg(sal) 
 from emp
 where  deptno in (10,20,30)
 and sal between 2500 and 5000 
 group by deptno 
 having avg(sal) >= 2000 
 order by 2 desc  ;



 -- 10)