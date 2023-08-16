-- ##################  �׷� �Լ� �ǽ� ######################

-- 1)  30�� �μ� ������ ���(�Ҽ�2�ڸ� �Ʒ� �ø�), �ְ�, ����, �ο����� ���Ͽ� ����϶�.
select round(avg(sal),2), max(sal), min(sal), count(*) from emp group by deptno having deptno=30;
-- 2) �� �μ��� �޿��� ���(�Ҽ����� �ݿø�), �ְ�, ����, �ο����� ���Ͽ� ����϶�.
select round(avg(sal),2), max(sal), min(sal), count(*) from emp group by deptno;


-- 3) * �� �μ��� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ,������, �ο����� ����϶�.
select deptno, job, count(empno) from emp group by deptno, job;  -- group by �� ��ȸ�ϴ� ��� �÷� �� ��ƾ��Ѵ�

-- 4) * ���� ������ �ϴ� ����� ���� 2�� �̻��� ������ �ο�����  ����϶�.
select job, count(empno) from emp group by job having count(empno) >= 2;


-- 5) �� �μ��� ��� ����(�Ҽ����� ����), ��ü ����, �ְ� ����, ���� ������ ���Ͽ� ��� ������ ���� ������ ����϶�. 
select trim(avg(sal)), sum(sal), max(sal), min(sal) from emp group by deptno order by 1;


-- 6) *  �� �μ��� ���� ������ �ϴ� ����� �޿��� �հ踦 ���Ͽ� �μ���ȣ,�������� �޿��� �Ұ�� ������ ����϶�.
-- �μ��� �����Ѵ�.
select deptno,job, sum(sal) from emp group by rollup(deptno, job);




-- 7) �� �μ��� �ο����� ��ȸ�ϵ� �ο����� 5�� �̻��� �μ��� ��µǵ��� �Ͻÿ�.
select deptno, count(empno) from emp group by deptno having count(empno) >= 5;

-- 8)  �� �μ��� �ִ�޿��� �ּұ޿��� ��ȸ�Ͻÿ�.
--   ��, �ִ�޿��� �ּұ޿��� ���� �μ��� ������ �Ѹ��� ���ɼ��� ���⶧����    ��ȸ������� ���ܽ�Ų��.
select deptno, max(sal), min(sal) from emp group by deptno having max(sal)!=min(sal);


/* 9) **** �μ��� 10, 20, 30 ���� ������ �߿��� �޿��� 2500 �̻� 5000 ���ϸ� �޴�
   �������� ������� �μ��� ��� �޿��� ��ȸ�Ͻÿ�.
   ��, ��ձ޿��� 2000 �̻��� �μ��� ��µǾ�� �ϸ�, ��°���� ��ձ޿��� ����
   �μ����� ��µǵ��� �ؾ� �Ѵ�. */
 select deptno, avg(sal) 
 from emp
 where  deptno in (10,20,30)
 and sal between 2500 and 5000 
 group by deptno 
 having avg(sal) >= 2000 
 order by 2 desc  ;



 -- 10)