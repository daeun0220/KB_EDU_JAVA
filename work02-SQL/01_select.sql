SELECT * FROM emp;
/* SELECT :: Projection | Selection
   Projection ���ϴ� �÷��� ������
   Selection ���ϴ� �ุ ������... ���Ǻο� 
*/
SELECT empno, ename, job, deptno FROM emp;

--emp���� ��� ����� �̸��� �Ի����� �˻� + Selection
SELECT ename, hiredate FROM emp;
SELECT ename, hiredate FROM emp WHERE job = 'SALESMAN';
--emp���� �μ���ȣ�� 10�� �μ��� ����� �̸�, ����, �޿�, �μ���ȣ�� �˻�
SELECT ename, job, sal, deptno FROM emp WHERE deptno=10;
--�޿������� ���� (default�� ��������) 
SELECT ename, job, sal, deptno FROM emp WHERE deptno=10 ORDER BY sal ASC;
SELECT ename, job, sal, deptno FROM emp WHERE deptno=10 ORDER BY sal DESC;
--�÷��� �� ���� ��ȣ�� �� ���� �ִ�
SELECT ename, job, sal, deptno FROM emp WHERE deptno=10 ORDER BY 3 DESC;
--���� ��Ÿ���� Ű���� :: rownum :: ���� ������ �� ��� 
--ORDER BY�� ����Ŭ������ ���� �������� ����(ROWNUM�� ������ ����ȴ�)
SELECT ename, sal, job, rownum FROM emp WHERE deptno=10 ORDER BY sal DESC;
--������ ���������� ���� ��Ų ����, ROWNUM�� ����!! (FROM ���� ���ϱ� �� �ȿ� ORDER BY �����ִ´�) 
SELECT ename, sal, job, rownum AS RANKING
FROM (SELECT * FROM emp ORDER BY sal DESC)
WHERE rownum<=3;
/*
SELECT ������ ���� �ȿ����� �������
1. ����Ŭ �������
FROM(���̺�) --> WHERE(������) --> SELECT(�÷�����) --> ORDER BY(����)
2. MYSQL �������
FROM(���̺�) --> WHERE(������) --> SELECT(�÷�����) --> ORDER BY(����) --> LIMIT(ROWNUM���) 
*/
/*
Alias
�ַ� ��������� ����� �÷��� Alias �� �����Ѵ�
1. �÷��� AS ��Ī | �÷��� ��Ī | �÷��� "��Ī" | ''�� �ȵ�  
2. "��Ī" ��Ī�� ������ �ְų� Ư�����ڰ� ���� ��, ��ҹ��ڸ� ������ �� ����Ѵ�  (MYSQL�� �ȵ�)
*/
--��� ����� �޿��� �����޿����� 100�� ���� ���� 2��� ����...
SELECT ename, sal, (sal+100)*2 AS �����޿�, job FROM emp;
--SELECT ename, sal, (sal+100)*2 "���� �޿�", job FROM emp ORDER BY "���� �޿�";
-- ��� �޿����� ������ �����ϰ� ������ �޿��� �˻�
--�̸�, ����, �ݿ�, ���������� �޿�,,, ������ ���������� �޿�������
SELECT ename, job, sal, sal-(sal*0.1) from emp ordert by 4;

select sal, sal*12 as ���� from emp;
/*
null ����
1. 0�� �ƴϰ� ���鵵 �ƴϴ�
2. ������ �ǹ̸� ������ ���̴�.
3. �ڰݾ��� Ȥ�� ��Ȯ���� ���ϴ� ���϶� �ַ� ���ȴ�
3. �����ۿ��� �ȵǰ� ��
4. null���� ������ ������ �ؾ��Ҷ��� �ٸ� ������ ġȯ���� �����Ѵ�
5. ����Ŭ���� null���� ���� ū ������ ��� / MYSQL �� �ݴ�
*/
SELECT job, comm FROM emp ORDER BY comm DESC;

SELECT ename, sal, sal*12+NVL(comm,0) FROM emp;

SELECT ename, job, sal FROM emp WHERE comm IS NULL;
--emp���̺��� ������ salesman�� ����� ~ ������ ���������� ���������� ���ĵǵ���
SELECT ename, sal, sal*12 AS ���� FROM emp WHERE job='SALESMAN' ORDER BY ���� DESC;
--COMM �� ���� ���� �޴� �����  (// null �� �� �����ؾ��Ѵ�)
SELECT empno, ename, job, comm from emp where comm is not null order by comm desc;
--emp���̺��� �μ���ȣ �˻� (distinct : �ߺ� ����) ������ ������ ���������
/*
DISTINCT : �ߺ��� ���ܳ��� Ű����
1. SELECT�� �ٷ� �ڿ� �´� 2. ���ı���� ���� ������ �����ؾ��Ѵ� 
3. �ߺ����� �����ϴ� ������ ���� �ð��� �ɸ���. ���ɿ� ������.
   ���࿡ �Ұ����ϰ� ����ؾ��ϴ� ��Ȳ�̶�� DISTINCT���� ��ü�ϴ� ����̳�, 
   ������ ����� �Ǵ� ���̺��� ũ�⸦ �ּ�ȭ�ϴ� ����� �����Ѵ�
   
   ���� ��ǥ���� ��ü������� EXISTS�� Ȱ���ϴ� ����� �ִ�
*/
select deptno from emp group by deptno;
select distinct deptno from emp order by deptno asc; 

select deptno 
from dept d 
where exists(select*from emp e where d.deptno = e.deptno);
/*
LIKE�����ڿ� ���ϵ�ī��(%..)
Ư�� �ܾ ���ԵǾ� �ִ� �����͸� �˻��� �� ���� ��� 
*/
select ename from emp where ename like 'S%';

select ename from emp where ename like '%S%';
--�̸��� 2��° ���ڿ� A�� �� ���
select ename from emp where ename like '_A%';
--81�⵵ �Ի��� ���
select ename from emp where hiredate like '81%';


