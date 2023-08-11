-- ##################  ���ڿ� �Լ� �ǽ� ######################
-- 1) ������ �̸��� ��ҹ��� ������� s�� �� ������ ��� ������ ����϶�.
select * from emp where ename like '%s%' or ename like '%S%';


-- 2) ���� ���� �� �����ȣ, �̸�, �޿��� ����Ѵ�.  ��, �̸��� �տ��� 3���ھ��� ����϶�.
select empno, substr(ename,1,3) "�̸�", sal from emp;

-- 3) �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� �̸����� ����϶�.
select lower(substr(ename,1,3)) "�̸�" from emp where length(ename) >= 6;


-- 4) *** ������ �̸��� �޿��� ����϶�, ��, �ݾ��� ��Ȯ���� ���� �޿��� 6�ڸ��� ����ϰ�, �� ������ ��� * �� ä�� ����϶�.
select  ename, lpad(sal, 6,'*') from emp;


-- 5) ���������� �Է��ϴ��� �Ʒ��� ���� �Է� �Ǿ���.(�̸��� ������ �Էµ�)
insert into emp values(8001,'   PARK   ', 'IT' ,  7521 , '21/11/10', 20000,1000,10);
select * from emp;

-- �̸��� 'PARK'�� ������ ������ ����Ͽ� ����.
select * from emp where ename='PARK';

-- �̸� �¿쿡 ������ �ִ��� ������ �����ϰ� �̸��� 'PARK'�� ������ ������ ����Ͽ� ����.
select * from emp where trim(ename)='PARK';

-- ##################  ���� �Լ� �ǽ� ######################
-- 1) �޿��� $1,500���� $3,000 ������ ����� �޿��� 15%�� ȸ��� �����ϱ�� �Ͽ���. 
-- �̸� �̸�, �޿�, ȸ��(�Ҽ��� �� �ڸ� �Ʒ����� �ݿø�)�� ����϶�.
select ename, sal, round(sal,2) "ȸ��" from emp where sal >= 1500 and sal<=3000;
 

-- 2) �޿��� $2,000 �̻��� ��� ����� �޿��� 5%�� ������� ���� �� �Ͽ���. 
-- �̸�, �޿�, ������(�Ҽ��� ���� ����)�� ����϶�.
select ename, sal, trunc(sal) "������" from emp where sal >= 2000;
  

 -- 3) ������ ����ϱ� ���� comm�� 150%�� ���ʽ��� �����Ϸ� �Ѵ�. comm�� �ִ� �������� ������� 
 -- ������ȣ, ������, �޿�, comm�� 150%�� �Ҽ������� �ø��Ͽ� ����϶�. (comm�� 0�̰ų�, null�̸� ����)
 select empno, ename, sal, ceil(comm*1.5) "���ʽ�" from emp where comm is not null and comm!=0;



-- ##################  ��¥ �Լ� �ǽ� ######################

-- 1)�Ի��Ϸκ��� 100���� ���� �ĸ� ���غ���. ����̸�, �Ի���, 100�� ���� ��, �޿��� ����϶�.
select ename, hiredate, hiredate+100 "100�� ���� ��", sal from emp;
-- 2) �Ի��Ϸκ��� 6������ ���� ���� ��¥�� ���Ϸ��� �Ѵ�.  �Ի���, 6���� ���� ��¥, �޿��� ����϶�
select hiredate, add_months(hiredate, 6) "6���� ���� ��", sal from emp;

-- 3) ***** �Ի��� ���� �ٹ��ϼ��� ����Ͽ� �μ���ȣ, �̸�, �ٹ��ϼ��� ����϶�.
select deptno, ename, last_day(hiredate)-hiredate �ٹ��ϼ� from emp;

-- 4) ��� ����� �Ի��� �������� 100���� ���� ���� �������� ��¥�� ���ؼ� �̸�, �Ի���,��MONDAY���� ����϶�.
select ename, hiredate, next_day(hiredate+100,2) "MONDAY" from emp;

-- ##################  ��ȯ �Լ� �ǽ� ######################

-- 1) ��� ������ �̸��� �Ի����� ��1996-05-14���� ���·� ��� �϶�.
select ename, to_char(hiredate, 'yyyy-mm-dd')"�Ի���" from emp;

-- 2) ��� ������ �̸��� �Ի��� �Ի���� '1981.05' �������� ����϶�
select ename, to_char(hiredate, 'yyyy.mm') from emp;

-- 3) **** ��� ������ ��ȣ, �̸�, �޿��� ����϶�. ��, �޿��տ� ȭ��ǥ��($), �׸��� õ����(,)ǥ��, �Ҽ������� 2�ڸ��� ǥ�õǵ��� �϶�.
select empno, ename, to_char(sal,'$99,999.99') �޿� from emp;

-- ##################  �Ϲ� �Լ� �ǽ� ######################

-- 1)  ��� ������ �̸�, �޿�, Ŀ�̼��� ����϶�. ��, comm�� null�̸� '����'���� ����϶�.
select ename, sal, decode(comm, null, '����', comm)"Ŀ�̼�" from emp;

-- 2)  ��� ������ �̸�, �޿�, Ŀ�̼�, ������ ����϶�. 
-- comm�� null�̸� �������� ����
-- ���ʽ��� comm�� null�̸� 10
select ename, sal, decode(comm, null, '����', comm)"Ŀ�̼�",
case when comm is null then sal*12 +10 
else sal*12
end "����"
from emp;


-- 3) ��� ������ �̸�, ����, �޿�, Ŀ�̼�, ���ʽ��� ����϶�. 
-- ���ʽ��� ������  MANAGER�̸� �޿��� 150%, �׿� ������ �޿��� 130% �̴�.
select ename, job, sal, comm,
case when job = 'MANAGER' then sal*1.5
else sal*1.3
end "���ʽ�"
from emp;


-- 4) 
-- mgr�� null�̸� ���������/ null�̸� mgr���� �������� �Ѵ�.
-- ��Ī�� mgr2�� ���� (2���� �̻� ��� ���)
SELECT ename, mgr,
		CASE  WHEN mgr is null THEN '���������'       
			 ELSE mgr || '' 
		END mgr2
FROM emp;

select ename, mgr,
        CASE  WHEN mgr is null THEN '���������'  
        ELSE mgr || '�����'
        END MGR2
from emp;

SELECT ename, mgr,
		CASE  WHEN mgr is null THEN '���������'       
			 ELSE TO_CHAR(mgr)
		END mgr2
FROM emp;

select ename, mgr, 
       decode(mgr, null, '����������', mgr ||'��� ')
 from emp;
 
 select ename, mgr, nvl2(mgr, mgr||'��� ', '���������� ')
  from emp;
