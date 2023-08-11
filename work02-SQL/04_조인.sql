--JOIN
--���� ���̺�κ��� �����͸� ������ �� ���Ǵ� ���

-- ������ ���� ������ ������ 
select * from emp;
-- �μ��� ���� ������ ������ 
select * from dept;

--����, �μ��� ���� ������ ������
select * from emp, dept;

/*
��ó�� ���� ����� Cartesian Product �� �Ѵ�
emp�� dept ���̺��� �������� ���� ���
14 X 4 = 56��
==> JOIN ����Ѵ�
*/
--step 1
--1. ���������� ���� ���̺��� �������� �÷��� ���� ������ �Ǵ� �÷��̴�.
--2. ���������� where������ ���� = �� ����ؼ� ���
select * from emp, dept where emp.deptno = dept.deptno;

--step 2 
--a.deptno / b.deptno ���������Ѵ�
-- deptno �� ��� ���̺��� �����;� �ϴ���...
-- ��� ���̺��� �� �����Ÿ��� ������ ���ɿ� ġ������ ������ ��ģ��
select empno, ename, sal, deptno, dname from emp, dept where emp.deptno = dept.deptno;   -- ���� ����

--3
select emp.empno, emp.ename, emp.sal, emp.deptno, dept.dname from emp, dept where emp.deptno = dept.deptno;

--4  ���̺�� �ٿ��༭ �� �����ϰ�! 
select e.empno, e.ename, e.sal, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno;

-- ����̸�,
select e.ename, e.sal, e.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and e.sal>=2000 and d.deptno=30;

--���忡�� �ٹ��ϴ� ����� �̸��� �޿�
select e.ename, e.sal
from emp e, dept d
where e.deptno= d.deptno and d.loc='NEW YORK';

--self ���� :: �ϳ��� ���̺��� ��ü������ ������
-- Ư�� ����� ����� �̸��� �˻�
select empno, ename, mgr from emp;

/*  1STEP
   EMP E
1. Ư�� ����� ename�� ��ȸ�ؼ� emp���̺��� ã�´�...SMITH
2. SMITH�� ����ȣ mgr�� ��ȸ.. �����ڹ�ȣ�� ã�´�...7902
   EMP M
3. �ٽ� 7902 ��ȣ�� empno�� ã�´�
4. empno�� 7902���� ����� �̸� ename�� ã�´�...FORD
*/

select empno, ename, mgr from emp; --e ����� ����ȣ ã��
select empno, ename from emp; --m ����� �̸��� ã�� 

select * from 
(select empno, ename, mgr from emp) e, 
(select empno, ename from emp) m;

-- 2step �������� �߰�
select * from 
(select empno, ename, mgr from emp) e, 
(select empno, ename from emp) m 
where e.mgr = m.empno;

--3step. Alias�� ����, �����ȣ, ����̸�, ����̸�
select e.empno as �����ȣ, e.ename ����̸�, m.ename ����̸� 
from emp e, emp m
where e.mgr = m.empno
order by 1;

--4step. Ư�� ���(BLAKE)�� ��� �̸��� �˻�
select m.ename ����̸� 
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



















