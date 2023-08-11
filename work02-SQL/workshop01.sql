-- 1) emp ���̺� ������ Ȯ���ϼ���.
SELECT * FROM emp;

-- 2) �μ���ȣ�� 20���� �μ��� ��� �� �����ȣ, �̸�, ������ ����϶�
SELECT empno, ename, sal FROM emp WHERE deptno = 20;


-- 3) �̸��� JONES�� ����� ��� ������ ����϶�.
select * from emp where ename='JONES';

-- 4)������ MANAGER�� �ƴ� ����� ��� ������ ����϶�.
select * from emp where job!='MANAGER';

-- 5) �޿��� $1,600���� ũ�� $3,000���� ���� ����� �̸�, ����, �޿��� ����϶�.
select ename, job, sal from emp where sal > 1600 and sal < 3000;

-- 6) �Ի����� 80�⵵�� ����� ��� ������ ����϶�
select * from emp where hiredate like '80%';


-- 7) �Ի����� 81/12/09 ���� ���� �Ի��� ������� ��� ������ ����϶�. *** 
select * from emp where hiredate < to_date('19811209');


-- 8) �̸� �� S�ڰ� �� �ִ� ����� ��� ������ ����϶�.
select * from emp where ename like '%S%';


-- 9) comm�� null�� �ƴ� ������� �̸�, �޿�, comm, �μ���ȣ�� ��ȸ
-- comm�� ��Ī�� ���ʽ��� �ϰ� ���ʽ��� ���� ���������(desc) ����
select ename, sal, comm as ���ʽ�, deptno from emp where comm is not null order by ���ʽ� desc;


-- 10) ����߿��� �������� SALESMAN�̰ų� ����(PRESIDENT)�̸鼭 ���ÿ� �޿��� 1500 �̻��� �Ǵ� ����� �˻�
select * from emp where job='SALESMAN' or job='PRESIDENT' and sal >= 1500;


-- 11) �μ���ȣ�� �⺻ ��������, �μ���ȣ�� ������� �޿��� ���� ������ �����Ͽ� ���, �̸�, ����, �μ���ȣ,�޿��� ��ȸ
select empno, ename, job, deptno, sal from emp order by deptno, sal desc;

-- 12) �μ����� ����ϴ� ������ �ѹ��� ��ȸ�Ͻÿ�
-- ��, ���� �������� �����մϴ�.
select distinct job from emp order by job asc;

-- 13) �Ի����� ���� ������ ��� 5�� ��ȸ�Ͻÿ� ***
select ename, rownum from (select * from emp order by hiredate) where rownum<=5;

-- 14) emp Table���� �̸�, �޿�, Ŀ�̼� �ݾ�, �Ѿ�(sal + comm)��  ���Ͽ� �Ѿ��� ���� ������ ����϶�. 
-- ��, Ŀ�̼��� NULL�� ����� �����Ѵ�.(Ŀ�̼Ǳݾ�: sal*comm/100)
select ename, sal, sal*comm/100 as "Ŀ�̼� �ݾ�", sal+comm as �Ѿ� from emp where comm is not null order by �Ѿ� desc;

-- 15)  10�� �μ��� ��� ����鿡�� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���. �̸�, �޿�, ���ʽ� �ݾ�, �μ���ȣ�� ����϶�.
select ename, sal, sal*0.13 as "���ʽ� �ݾ�", deptno from emp where deptno=10;

