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

insert into mymember (no, name) values(seq_mymember.nextVal, '홍길동');  --seq_mymember.nextVal : 자동 증가 
insert into mymember (no, name) values(seq_mymember.nextVal, '강감찬');
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

--------------------------분석함수------------------------------------------



-- over 함수는 ORDER BY 다음에 사용한다 --> rownumber 사용할 필요가 없다 
select empno, ename, deptno, sal,
RANK() OVER (ORDER BY sal desc) "Rank" 
from emp;

select empno, ename, deptno, sal,
DENSE_RANK() OVER (ORDER BY sal desc) "Rank" 
from emp;

--PARTIOTION BY : 부서별로 그룹핑 (group by)
select empno, ename, deptno, sal,    
RANK() OVER (PARTITION BY deptno ORDER BY sal desc) "Rank" 
from emp;

--SETP1
select ename, sal, rownum from emp order by sal desc;   --order by가 젤 늦게 돌아가서 rownum 1,2,3 순서대로 안찍힘

--STEP2
select ename, sal, rownum
from (select * from emp order by sal desc)   -- order by 먼저 돌아가게 해서 해결...!
where rownum <= 3;

--STEP3
select ename, sal,
ROW_NUMBER() over (order by sal desc) "rank"
from emp;

--ROW_NUMBER() : 유니크한 값으로 나와서, 겹치는 순위일 경우 한 번 더 정렬할 기준 주는것이 정확하다 
select ename, sal, hiredate,  
row_number() over(order by sal desc, hiredate asc) 순번
from emp;


-----------------------------------제약조건---------------------------------------

create table employee
as
(select * from emp);

create table department
as
(select * from dept);

--테이블구조 확인  --> 제약조건까지 복사는 안됨
desc employee;
desc department;

--ALTER 로 기본키 제약조건 추가!
ALTER TABLE employee ADD CONSTRAINT employee_empno_pk PRIMARY KEY(empno);
ALTER TABLE department ADD CONSTRAINT department_deptno_pk PRIMARY KEY(deptno);

delete employee where empno=7369;
select * from employee;
-- 20번 부서 삭제해도 20번 부서 근무하는 근무자는 그대로다 --> 테이블이 연관되어져 있지 않기 때문!! => 외래키 제약조건 추가해야한다
delete department where deptno=20;
select * from department;

drop table employee;
drop table department;

---외래키 제약조건
ALTER TABLE employee ADD CONSTRAINT employee_deptno_fk foreign key(deptno)
REFERENCES department(deptno);

--FK 제약조건 추가하면 자식을 가지고 있는 부모 테이브 삭제가 안된다
-- 자식레코드 먼저 삭제한 후, 부모레코드 삭제해야한다
-- ==> ON DELETE CASCADE  (위와 같은 작업을 해주는 옵션)
-- FK 제약조건 줄 때 ON DELETE CASCADE 옵션을 함께 지정해야 한다!!!!
ALTER TABLE employee ADD CONSTRAINT employee_deptno_fk foreign key(deptno)
REFERENCES department(deptno) ON DELETE CASCADE;












