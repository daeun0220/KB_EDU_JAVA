--�׷��Լ� : �� �׷�� ��
/*
 COUNT, SUM, AVG, MAX, MIN
 
 SUM, AVG
 COUNT, MAX, MIN
*/
-- count() 
select count(*) ��ü����� from emp;
select count(empno) ��ü����� from emp; -- null ���� �� �� ���� �⺻Ű�� ��ü���� �� �� �ִ�
select count(-1) ��ü����� from emp;

select round(avg(sal)), sum(sal), min(sal), max(sal) from emp;

select min(hiredate), max(hiredate)from emp;

select count(*) "�����" from emp where deptno in (10,20);

--emp���̺��� �μ���ȣ ��
select count(distinct deptno) from emp;

select distinct count(deptno) from emp;

select round(avg(nvl(comm,0))) from emp;  -- null�� ���� 

--select deptno, avg(sal) from emp;     X) deptno�� �Ѱ��� �ƴ϶�
--grpup by �� �ڿ� ��õǾ����� �Ѵ�

select deptno, avg(sal) from emp group by deptno;  

select deptno, avg(sal)"AvgSalary" from emp group by deptno order by 2;  

--GROUP BY �ڿ� as ������ ���Ѵ�. --> ������� ������ / *** MYSQL �� �ȳ� 

select deptno DNumber, round(avg(sal)) AVGSAL --4
from emp    --1
where deptno!=10  --2
group by deptno  --3
order by deptno; --5 �׻� �������� 

select extract(year from hiredate)"�Ի�⵵", count(*)�ο���
from emp
group by extract(year from hiredate); -- �Ի�⵵ ���°� �ȵ� 

select to_char(hiredate, 'YY')�Ի��, count(empno)����� 
from emp
group by to_char(hiredate, 'YY')
order by 1;
----******** WHERE���� GROUP BY ��� XXXXXX ************ AS �� ���´�
--select deptno, round(avg(sal)) from emp where round(avg(sal))>=2000 group by deptno;

select deptno, round(avg(sal)) from emp HAVING round(avg(sal))>=2000 group by deptno;
--HAVING : GROUPING �� �� ������ �߷��� ���÷����Ѵ�.
select deptno, round(avg(sal)) 
from emp  
group by deptno
HAVING round(avg(sal))>=2000;

--�ִ� �޿��� 2900 �Ѵ� �μ����� �ִ�޿� ���     / WHERE������ HAVING������ �ľ� --> HAVING�̸� GROUP BY �����
select deptno, max(sal)"�ִ�޿�"     -- 1) �μ��� �ִ�޿�
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
-- UNION ALL ���� Ÿ�Գ����� ��ĥ �� �ִ�

select to_char(deptno), sum(sal) -- to_char ��� ���ڿ��� �ٲٱ� ����
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
������� �ۼ��� ������ �������� Group by ���� �ۼ��ϰ� ����Ǵ� �κе��� ������ �ۼ��� �� UNION ALL�� �����ϴ� ��İ�(3,4,5)
GROUPING SETS�� ����ϴ� ����� �ִµ�(1)
GROUPING SETS�� ����� ����� �ξ� �ӵ��� ������ ****
*/




