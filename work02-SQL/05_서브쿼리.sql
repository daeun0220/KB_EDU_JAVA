-- SUB QUERY
-- ? �� �ش��ϴ� �κ��� ()�ȿ� ������ ���� �����ϰ�, �� ����� main�������� ����..
-- (CLARK�� �޿�)���� �� ���� �޿��� �޴� ����� �̸��� �޿�, ������ �˻�
-- One row + One column => ��Į�� ��������
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

--job�� ���� ���� ��ձ޿� �˻�
--HAVING �� �ڿ� ���� �������� 
--*** �׷��Լ� ��ø    // MySQL�� �׷��Լ� ��ø �ȵ� 
select job, round(avg(sal))
from emp
group by job
having avg(sal) = (select min(avg(sal)) from emp group by job); 

--FROM �� �ڿ� ���� ��������
--����߿��� �޿��� ���� ���� �޴� ��� ��ŷ3 �˻�
select ename, sal, rownum �޿�����
from (select * from emp order by sal desc)
where rownum<=3;

--scott�� �޿����� �� ���� �޿��� �޴� ��� �˻�
--step1
select ename, sal
from emp
where sal > (select sal from emp where ename='SCOTT');

--step2
select * from emp a, (select sal from emp where ename='SCOTT') b
where a.sal > b.sal;

select empno, ename 
from emp
where sal in (select min(sal) from emp group by deptno);  -- ������ ���������� IN ����ؾ���!! 

select ename, sal, job 
from emp
where sal > ANY (select sal from emp where job='SALESMAN');

select ename, sal, job, hiredate
from emp
where sal > ALL (select sal from emp where job='SALESMAN');

--***** �μ���ȣ�� 30�� ����� �޿��߿��� ���� ���� �޿����� �� ���� �޿��� �޴� ������ �̸�...
--1)�׷��Լ�


--2) ****������ ������
select sal, empno, deptno
from emp
where sal >= ANY(select sal from emp where deptno=30) order by 1;

-- ������������ NULL��
--emp���̺��� ���������� �Ŵ��� ��� �˻�
select ename, empno
from emp
where empno in (select mgr from emp);

select distinct m.ename, m.empno
from emp e, emp m
where e.mgr = m.empno;
----------------------------------------------
-- �ݴ� NOT IN ��µ� �ȳ����� ���� : NULL���� �񱳿����� ����� �� ��� ������ �ʴ°�
--> ******* NVL�� ġȯ������Ѵ�
select ename, empno
from emp
where empno not in (select NVL(mgr,0) from emp);

















