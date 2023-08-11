-- ### equi join ###

-- 1.  emp�� dept Table�� JOIN�Ͽ� �μ���ȣ, �μ���, �̸�, �޿���  ����϶�.
select d.deptno, d.dname, e.ename, e.sal
from dept d, emp e
where d.deptno = e.deptno;



-- 2.  �̸��� ��SMITH���� ����� �μ����� ����϶�.
select d.dname
from dept d, emp e
where d.deptno = e.deptno and e.ename='SMITH';

 
-- ### outer join ###
-- 3.  dept Table�� �ִ� ��� �μ��� ����ϰ�, emp Table�� �ִ� DATA�� JOIN�Ͽ� 
-- ��� ����� �̸�, �μ���ȣ, �μ���, �޿��� ��� �϶�.
select e.ename, e.deptno, d.dname, e.sal
from dept d, emp e
where d.deptno = e.deptno(+);


-- ###self join###
-- 4.  emp Table�� �ִ� empno�� mgr�� �̿��Ͽ� ������ ���踦 ������ ���� ����϶�. ��SMTH�� �Ŵ����� FORD�̴١�
select e.ename || '�� �Ŵ����� ' || m.ename || '�̴�'
from emp e, emp m
where e.mgr = m.empno;




-- ### join �ǽ� ###

-- 1. �����ڰ� 7698�� ����� �̸�, �����ȣ, �����ڹ�ȣ, �����ڸ��� ����϶�.
select e.ename, e.empno, m.empno, m.ename
from emp e, emp m
where e.mgr = m.empno and e.mgr = 7698;


-- 2. ������ MANAGER�̰ų� CLERK�� ����� �����ȣ, �̸�, �޿�, ����, �μ���
select e.empno, e.ename, e.sal, e.job, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.job in ('MANAGER', 'CLERK');

--���� ǥ��..?
select empno, ename, job, deptno, dname
FROM   emp   JOIN dept   USING (deptno)
WHERE  job ='MANAGER' or job='CLERK'  ;







