/*
IN ������ 
�������� �� �߿��� ��� �ϳ��� ���� ��ġ�ϴ����� ��

�����ȣ�� 7369�̰ų� 7782�� ��� �˻�
*/
select * from emp where empno=7369;
select * from emp where empno=7782;
select * from emp where empno=7369 or empno=7782;
select * from emp where empno in (7369, 7782);

select * from emp where empno not in (7369, 7782);
select * from emp where empno!=7369 and empno!=7782;

--�����Լ� :: SUBSTR()
--SUBSTR(���ڿ�, ������ġ, ���ⰳ��) // ù��° �ε����� 1
SELECT SUBSTR('Hello World', 6) FROM dual;
SELECT SUBSTR('Hello World', 6, 3) FROM dual;
SELECT SUBSTR('Hello World', -4, 2) FROM dual;
--N���� ������ �̸� ���� ��� 
select * from emp where ename like '%N';
select * from emp where substr(ename,-1)='N';

select distinct substr(hiredate,1,2)as �Ի�⵵ from emp;

-- TRIM() : ������ �����ϴ� �Լ�
SELECT RTRIM('James Gosling      ') name FROM dual;
SELECT LTRIM('       James Gosling      P') name FROM dual;
SELECT TRIM('       James Gosling      ') name FROM dual;

--REPLACE() : (���ڿ�, �ٲ� ���ڿ�, new���ڿ�) / ��� ���鵵 ���� �� �ִ�
SELECT REPLACE(job, 'MAN', 'PERSON') AS NewJob from emp where job='SALESMAN';
select replace('   James   Gosling  is Good', ' ', '') from dual;  
-- �����Լ�
--Round : �ι�° ���ڰ� n �Ҽ��� ���� n�ڸ����� ���ڸ� ��Ÿ����� �� / �Ҽ��� ���� n�ڸ����� ���������� �ݿø��� ����ȴ� 
select round(45.923,2) from dual;
select round(45.923) from dual;
-- �ι�° ���ڰ� n�� �����϶� : ��, ��, �� ... ������ �Ž��� �ö�
select round(45.923, -1) from dual;

--FLOOR() : ����(�Ҽ��� �Ʒ� ����)
select floor(45.923) from dual;
--select floor(45.923, 2) from dual;  floor()�� �ڸ��� ������ �ȵ� 

--TRUNC() : ���� / �ڸ��� ������ �����ϴ�!! / ������ �Ҽ��� n �ڸ��� ���ϸ� ���� 
select trunc(45.923) from dual;
select trunc(45.923, 2) from dual;

--CEIL() : �ø� / �ڸ��� ������ �ȵ� --> ������ ����� 
select ceil(45.923) from dual;

select greatest(1,2,3) from dual;
select least(1,2,3) from dual;

--��¥ �Լ�
select SYSDATE from dual;
select SYSTIMESTAMP from dual;
--��¥ + ���� = ��¥ 
select SYSDATE+100 from dual;
--TO_DATE() : ���ڿ� -> ��¥ 
select SYSDATE-1999/02/20 "��ƿ»���" from dual;
--EXTRACT() : �⵵/��/�� ����
select extract(day from sysdate) ����, extract(month from sysdate) ��, extract(year from sysdate) �⵵ from dual;

select ename, hiredate, extract(year from hiredate) as year, extract(day from hiredate) as day from emp;
--MONTHS_BETWEEN(D1, D2)
select ename, hiredate, sysdate, months_between(sysdate, hiredate) m_between, floor(months_between(sysdate, hiredate)) t_between
from emp
where deptno=10
order by m_between desc;

select ename, hiredate, next_day(hiredate, 6) "���ƿ��±ݿ���", next_day(hiredate, 7) "���ƿ��������"
from emp
where deptno=10
order by hiredate desc;

--��¥�� ��¥ ���� ���� �� : MONTHS_BETWEEN(D1, D2) : D1 - D2 ������
--EMP���̺��� �Ի��� ���κ��� 2023/07/25 ������
select trunc(abs(months_between(hiredate, '2023/07/25'))) "������" from emp;

select ename, hiredate, to_char(hiredate, 'YYYY"��" MM"��" DD"��"') "��¥" from emp;

select ename, hiredate, to_char(next_day(add_months(hiredate, 6),1), 'yyyy/mm/dd') "6������" from emp; 

--�Ϲ��Լ� : DECODE() 
-- emp���̺��� ������
select ename, job, DECODE(job, 'PRESIDENT', '����', 'MANAGER', '������', 'ANALYST', '�м���', '����') "�����з�" from emp; 

select ename, job, sal, DECODE(sal, 5000, 'owner�޿�', 3000, '��ױ޿�', '�Ϲݱ޿�') "�޿� ����" from emp; 

select ename, job, sal,
CASE when sal = '5000' THEN 'owner�޿�'
when sal = '3000' THEN '��ױ޿�'   
else '�Ϲݱ޿�' END "�޿�����"
from emp;
