/*
IN 연산자 
여러개의 값 중에서 어느 하나의 값과 일치하는지를 비교

사원번호가 7369이거나 7782인 사원 검색
*/
select * from emp where empno=7369;
select * from emp where empno=7782;
select * from emp where empno=7369 or empno=7782;
select * from emp where empno in (7369, 7782);

select * from emp where empno not in (7369, 7782);
select * from emp where empno!=7369 and empno!=7782;

--문자함수 :: SUBSTR()
--SUBSTR(문자열, 시작위치, 추출개수) // 첫번째 인덱스는 1
SELECT SUBSTR('Hello World', 6) FROM dual;
SELECT SUBSTR('Hello World', 6, 3) FROM dual;
SELECT SUBSTR('Hello World', -4, 2) FROM dual;
--N으로 끝나는 이름 가진 사원 
select * from emp where ename like '%N';
select * from emp where substr(ename,-1)='N';

select distinct substr(hiredate,1,2)as 입사년도 from emp;

-- TRIM() : 공백을 제거하는 함수
SELECT RTRIM('James Gosling      ') name FROM dual;
SELECT LTRIM('       James Gosling      P') name FROM dual;
SELECT TRIM('       James Gosling      ') name FROM dual;

--REPLACE() : (문자열, 바꿀 문자열, new문자열) / 가운데 공백도 없앨 수 있다
SELECT REPLACE(job, 'MAN', 'PERSON') AS NewJob from emp where job='SALESMAN';
select replace('   James   Gosling  is Good', ' ', '') from dual;  
-- 숫자함수
--Round : 두번째 인자값 n 소수점 이하 n자리까지 숫자를 나타내라는 뜻 / 소수점 이하 n자리에서 실질적으로 반올림이 진행된다 
select round(45.923,2) from dual;
select round(45.923) from dual;
-- 두번째 인자값 n이 음수일때 : 일, 십, 백 ... 단위로 거슬러 올라감
select round(45.923, -1) from dual;

--FLOOR() : 내림(소수점 아래 버림)
select floor(45.923) from dual;
--select floor(45.923, 2) from dual;  floor()는 자리수 지정이 안됨 

--TRUNC() : 버림 / 자리수 지정이 가능하다!! / 지정된 소수점 n 자릿수 이하를 버림 
select trunc(45.923) from dual;
select trunc(45.923, 2) from dual;

--CEIL() : 올림 / 자리수 지정이 안됨 --> 정수로 만든다 
select ceil(45.923) from dual;

select greatest(1,2,3) from dual;
select least(1,2,3) from dual;

--날짜 함수
select SYSDATE from dual;
select SYSTIMESTAMP from dual;
--날짜 + 숫자 = 날짜 
select SYSDATE+100 from dual;
--TO_DATE() : 문자열 -> 날짜 
select SYSDATE-1999/02/20 "살아온생애" from dual;
--EXTRACT() : 년도/월/일 추출
select extract(day from sysdate) 일자, extract(month from sysdate) 월, extract(year from sysdate) 년도 from dual;

select ename, hiredate, extract(year from hiredate) as year, extract(day from hiredate) as day from emp;
--MONTHS_BETWEEN(D1, D2)
select ename, hiredate, sysdate, months_between(sysdate, hiredate) m_between, floor(months_between(sysdate, hiredate)) t_between
from emp
where deptno=10
order by m_between desc;

select ename, hiredate, next_day(hiredate, 6) "돌아오는금요일", next_day(hiredate, 7) "돌아오는토요일"
from emp
where deptno=10
order by hiredate desc;

--날짜와 날짜 사이 개월 수 : MONTHS_BETWEEN(D1, D2) : D1 - D2 개월수
--EMP테이블에서 입사한 날로부터 2023/07/25 개월수
select trunc(abs(months_between(hiredate, '2023/07/25'))) "개월수" from emp;

select ename, hiredate, to_char(hiredate, 'YYYY"년" MM"월" DD"일"') "날짜" from emp;

select ename, hiredate, to_char(next_day(add_months(hiredate, 6),1), 'yyyy/mm/dd') "6개월뒤" from emp; 

--일반함수 : DECODE() 
-- emp테이블에서 업무가
select ename, job, DECODE(job, 'PRESIDENT', '사장', 'MANAGER', '관리자', 'ANALYST', '분석가', '직원') "직업분류" from emp; 

select ename, job, sal, DECODE(sal, 5000, 'owner급여', 3000, '고액급여', '일반급여') "급여 구분" from emp; 

select ename, job, sal,
CASE when sal = '5000' THEN 'owner급여'
when sal = '3000' THEN '고액급여'   
else '일반급여' END "급여구분"
from emp;
