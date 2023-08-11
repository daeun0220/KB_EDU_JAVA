-- ### SubQuery ###
-- 1.  ��SMITH'�� ������ ���� ����� �̸�, **** �μ���, �޿�, ������  ����϶�.
select emp.ename, dept.dname, emp.sal, emp.job
from emp, dept
where emp.deptno = dept.deptno 
and dept.deptno = (select deptno from emp where ename = 'SMITH');



-- 2.  ��JONES���� �����ִ� �μ��� ��� ����� �����ȣ, �̸�, �Ի���, �޿��� ����϶�.
select empno, ename, hiredate, sal
from emp
where deptno = (select deptno from emp where ename = 'JONES');

-- 3.  ��ü ����� ��ձ޿����� �޿��� ���� ����� �����ȣ, �̸�,�μ���ȣ, �Ի���,�޿��� ����϶�.
select empno, ename, deptno, hiredate, sal
from emp
where sal > (select avg(sal) from emp);


-- 4. 10�� �μ��� ���� ���� �ϴ� ����� �����ȣ, �̸�, �޿��� �˻�..�޿��� ���� ������ ����϶�.
select empno, ename, sal, job
from emp
where job in (select job from emp where deptno=10)
order by 3 desc;



-- 5.  10�� �μ� �߿��� 30�� �μ����� ���� ������ �ϴ� ����� �����ȣ, �̸�, �μ���ȣ,����, �Ի����� ����϶�.
select empno, ename, deptno, job, hiredate
from emp
where job not in (select job from emp where deptno=30);



-- 6.  ��KING���̳� ��JAMES'�� �޿��� ���� ����� �����ȣ, �̸�,�޿��� ����϶�.
select empno, ename, sal
from emp
where sal in (select sal from emp where ename in ('KING', 'JAMES'))
and ename!= 'KING' and ename!= 'JAMES';


-- 7.  �޿��� 30�� �μ��� �ְ� �޿����� ���� ����� �����ȣ,�̸�, �޿��� ����϶�.
select empno, ename, sal
from emp
where sal > (select max(sal) from emp where deptno=30);


-- 8. SCOTT�� �޿����� ������ �޿��� �޴� ����� �˻�
-- 2���� ����� ��� 1) ��������  2) ���̺� �˸��߽��� ���
-- 1) 
select *
from emp
where sal > (select sal from emp where ename='SCOTT');


-- 2) **** 
select * from emp a, (select sal from emp where ename='SCOTT') b
where a.sal > b.sal;

-- 9. ***** �μ��� �ּұ޿� �߿��� 20�� �μ��� �ּұ޿����� �� ū �ּұ޿��� �˻�
select min(sal), deptno
from emp
group by deptno
having min(sal) > (select min(sal) from emp where deptno=20);

-- 10. �޿��� 10���μ��� ���� ******�****** ����� �޿����� �� ���� �޿��� �޴� ����� �˻�. 
-- �̶� 10�� �μ��� ���� ����� ���� 
-- ������ �����ȣ������ �Ѵ�. 
select empno, ename, sal, deptno
from emp
where sal > ANY (select sal from emp where deptno=10)
and deptno!=10
order by 1;


-- 11. 30�� �Ҽ� ����� �߿��� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� �̸��� �޿��� �˻� 
-- 2���� ��� ���
-- 1)
select ename, sal
from emp 
where sal > (select max(sal) from emp where deptno=30);

-- 2) ****** ���� ����� ������ �ٽ� ���÷��� �ؾ��Ѵ�. having���� �ʿ� ************************* 

-- 1)
SELECT max(sal) FROM emp WHERE deptno = 30; -- (2850) 30�� �Ҽ� ����� �� ���� ���� �޴� ����� �޿�

-- 2) ���� ����� ������ �ٽ� ���÷��� �ؾ��Ѵ�. having���� �ʿ�
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


-- 12. ���������� �Ŵ��� ����� �˻� . ����̸��� ����� �����ȣ�� �˻��ǵ���(�⸮�߽� ����̸�, �������ȣ)
-- 1)
select distinct m. ename
from emp e, emp m
where e.mgr=m.empno;

-- 2)
select ename
from emp
where empno in (select mgr from emp);


