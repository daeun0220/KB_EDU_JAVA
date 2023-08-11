------------------- SEQUENCE --------------------------
create sequence ora_seq 
start with 1
increment by 1;

select ora_seq.nextVal from dual;

select ora_seq.currVal from dual;

create SEQUENCE seq_mymember
start with 1
increment by 1;

create table mymember(no number primary key, name varchar(30));

insert into mymember (no, name) values(seq_mymember.nextVal, 'ȫ�浿');  --seq_mymember.nextVal : �ڵ� ���� 
insert into mymember (no, name) values(seq_mymember.nextVal, '������');
select * from mymember;

CREATE TABLE member
(
id number primary key,
name varchar2(20),
email varchar2(30),
phone varchar2(30)
);

CREATE SEQUENCE seq_id
INCREMENT BY 1
START WITH 1;

select * from member;

--------------------------�м��Լ�------------------------------------------



-- over �Լ��� ORDER BY ������ ����Ѵ� --> rownumber ����� �ʿ䰡 ���� 
select empno, ename, deptno, sal,
RANK() OVER (ORDER BY sal desc) "Rank" 
from emp;

select empno, ename, deptno, sal,
DENSE_RANK() OVER (ORDER BY sal desc) "Rank" 
from emp;

--PARTIOTION BY : �μ����� �׷��� (group by)
select empno, ename, deptno, sal,    
RANK() OVER (PARTITION BY deptno ORDER BY sal desc) "Rank" 
from emp;

--SETP1
select ename, sal, rownum from emp order by sal desc;   --order by�� �� �ʰ� ���ư��� rownum 1,2,3 ������� ������

--STEP2
select ename, sal, rownum
from (select * from emp order by sal desc)   -- order by ���� ���ư��� �ؼ� �ذ�...!
where rownum <= 3;

--STEP3
select ename, sal,
ROW_NUMBER() over (order by sal desc) "rank"
from emp;

--ROW_NUMBER() : ����ũ�� ������ ���ͼ�, ��ġ�� ������ ��� �� �� �� ������ ���� �ִ°��� ��Ȯ�ϴ� 
select ename, sal, hiredate,  
row_number() over(order by sal desc, hiredate asc) ����
from emp;


-----------------------------------��������---------------------------------------

create table employee
as
(select * from emp);

create table department
as
(select * from dept);

--���̺��� Ȯ��  --> �������Ǳ��� ����� �ȵ�
desc employee;
desc department;

--ALTER �� �⺻Ű �������� �߰�!
ALTER TABLE employee ADD CONSTRAINT employee_empno_pk PRIMARY KEY(empno);
ALTER TABLE department ADD CONSTRAINT department_deptno_pk PRIMARY KEY(deptno);

delete employee where empno=7369;
select * from employee;
-- 20�� �μ� �����ص� 20�� �μ� �ٹ��ϴ� �ٹ��ڴ� �״�δ� --> ���̺��� �����Ǿ��� ���� �ʱ� ����!! => �ܷ�Ű �������� �߰��ؾ��Ѵ�
delete department where deptno=20;
select * from department;

drop table employee;
drop table department;

---�ܷ�Ű ��������
ALTER TABLE employee ADD CONSTRAINT employee_deptno_fk foreign key(deptno)
REFERENCES department(deptno);

--FK �������� �߰��ϸ� �ڽ��� ������ �ִ� �θ� ���̺� ������ �ȵȴ�
-- �ڽķ��ڵ� ���� ������ ��, �θ��ڵ� �����ؾ��Ѵ�
-- ==> ON DELETE CASCADE  (���� ���� �۾��� ���ִ� �ɼ�)
-- FK �������� �� �� ON DELETE CASCADE �ɼ��� �Բ� �����ؾ� �Ѵ�!!!!
ALTER TABLE employee ADD CONSTRAINT employee_deptno_fk foreign key(deptno)
REFERENCES department(deptno) ON DELETE CASCADE;












