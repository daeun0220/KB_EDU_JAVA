--�뷮�� ���õ����� ����
--CTAS (Create Table As Select) 
--emp/ dept ���� ���̺��� �����͸� �״�� ���÷� �޾ƿͼ� ���ο� ���̺��� ���� / ���� ���̺��� ��ȭ X

select * from emp;

--emp1 ���̺� ����
CREATE TABLE emp1
AS
(SELECT * FROM emp);

select * from emp1;

--emp2 ���̺� ���� (��������)
create table emp2 
as 
(select empno, ename, sal, deptno from emp);

select * from emp2;

--emp3 ���̺� ���� (where�� )
create table emp3 
as 
(select empno, ename, sal, deptno from emp where deptno=10);

select * from emp3;

desc emp; --�⺻Ű�� not null�� ���������� �ִ�
desc emp1; --�������Ǳ��� ���������� �ʴ´�
/*
insert / delete / update
*/

select empno, ename, sal, deptno from emp3;

--1. INSERT
INSERT INTO emp3 (empno, ename, sal, deptno) VALUES(1111, 'JAMES', 2800, 20);


--2. UPDATE :: 1111����� ���� ����  // �ȹٲ�� �͵� �Ȱ��� �ᵵ��
--EMPNO(PK) �÷��� ������ ����� �ƴϴ�. PK�� ������ ������ �÷��� ������ ����� �ȴ�
UPDATE emp3 SET ename='JAMES', sal=2900, deptno=10 where empno=1111; 


--2. DELETE :: 1111 ��� ���� ����� ����  / DELETE FROM �� �� 
-- 1) where �ο�    2) where �ο� ���ϴ� ��� --> ��ü �� ������ 
DELETE emp3 where empno=1111;
delete emp3;

select * from emp2;














