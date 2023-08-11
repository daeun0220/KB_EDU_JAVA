--대량의 샘플데이터 생성
--CTAS (Create Table As Select) 
--emp/ dept 원본 테이블의 데이터를 그대로 샘플로 받아와서 새로운 테이블을 생성 / 원본 테이블은 변화 X

select * from emp;

--emp1 테이블 생성
CREATE TABLE emp1
AS
(SELECT * FROM emp);

select * from emp1;

--emp2 테이블 생성 (프로젝션)
create table emp2 
as 
(select empno, ename, sal, deptno from emp);

select * from emp2;

--emp3 테이블 생성 (where절 )
create table emp3 
as 
(select empno, ename, sal, deptno from emp where deptno=10);

select * from emp3;

desc emp; --기본키는 not null인 제약조건이 있다
desc emp1; --제약조건까지 가져오지는 않는다
/*
insert / delete / update
*/

select empno, ename, sal, deptno from emp3;

--1. INSERT
INSERT INTO emp3 (empno, ename, sal, deptno) VALUES(1111, 'JAMES', 2800, 20);


--2. UPDATE :: 1111사원의 정보 수정  // 안바뀌는 것도 똑같이 써도됨
--EMPNO(PK) 컬럼은 수정의 대상이 아니다. PK를 제외한 나머지 컬럼이 수정의 대상이 된다
UPDATE emp3 SET ename='JAMES', sal=2900, deptno=10 where empno=1111; 


--2. DELETE :: 1111 사번 가진 사원을 삭제  / DELETE FROM 도 됨 
-- 1) where 부여    2) where 부여 안하는 경우 --> 전체 다 삭제됨 
DELETE emp3 where empno=1111;
delete emp3;

select * from emp2;














