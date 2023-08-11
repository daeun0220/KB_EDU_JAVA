create table users
       (userid varchar2(13) primary key,
       admin number(3) not null,
       nickname varchar2(20),
       dept varchar2(30)) ; 
 
create table movies
       (title varchar2(50) primary key,
       genre varchar2(10) not null,
       releaseDate Date not null,
       company varchar2(50) not null,
       totalrate number(4,2)) ; 
 
create table reviews
       (userid varchar2(13) not null,
       title varchar2(50) not null,
       content varchar2(100) not null,
       rate number(4,2)) ; 
 
insert into movies values( '엘리멘탈', '코미디', '2023/06/16', '디즈니', 0 );
insert into movies values( '미션임파서블7', '액션', '2023/07/12', '파라마운트픽쳐스,', 0);
insert into movies values( '여름날우리', '로맨스', '2021/04/30', '베이징픽쳐스', 0);

insert into users values( 'kd1284', 0, '다우니', null);
insert into users values( 'je123', 0, '지은', null);
insert into users values( '2oo1', 1, null, 'server');
insert into reviews values( 'kd1284', '엘리멘탈', '감동~', 10);

insert into movies values( '엘리멘탈', '애니', '2023/06/14', '디즈니', 0 );
insert into movies values( '미션임파서블7', '액션', '2023/07/12', '파라마운트 픽처스', 0);
insert into movies values( '여름날우리', '로맨스', '2023/06/28', '베이징 인라이트 픽쳐스', 0);
insert into movies values( '비공식작전', '드라마', '2023/08/2', '쇼박스', 0);
insert into movies values( '더문', 'SF', '2023/08/2', 'CJ ENM', 0);
insert into movies values( '밀수', '범죄', '2023/07/26', 'NEW', 0);
insert into movies values( '바비', '드라마', '2023/07/19', '워너 브러더스 코리아', 0);
insert into movies values( '명탐정 코난', '애니', '2023/07/20', 'CJ ENM', 0);

insert into users values( 'imking', 1, null, 'server');
insert into users values( 'kd1284', 0, '다우니', null);
insert into users values( '2oo1', 0, '주주', null);
insert into users values( 'mellykim', 0, '꺄악', null);
insert into users values('lcy923',0,'올챙이',null);


insert into reviews values( '2oo1', '엘리멘탈', '웨이드 완전 F', 10);
insert into reviews values( '2oo1', '바비', '너무 핑크핑크,,,', 2);
insert into reviews values( '2oo1', '미션임파서블7', '내 취향 놉', 4);

insert into reviews values( 'kd1284', '바비', '암 어 바비걸~', 10);
insert into reviews values( 'kd1284', '미션임파서블7', '톰크루즈 액션 대박', 7);


insert into reviews values( 'mellykim', '미션임파서블7', '톰쿠르즈 존잘 그 외엔,,,', 7);
insert into reviews values( 'mellykim', '바비', '드레스 코드 핑크인거 아시죠', 9);
insert into reviews values( 'mellykim', '여름날우리', '여름에 보기 좋은 영화입니다', 6);
insert into reviews values( 'mellykim', '명탐정 코난', '애니 안좋아하는데 이건 좋아', 9);
insert into reviews values( 'mellykim', '엘리멘탈', '보다가 잠들었어요', 3);

insert into reviews values( 'lcy923', '밀수', '그냥저냥,,,', 5);
insert into reviews values( 'lcy923', '엘리멘탈', '디즈니 감성 그 잡채', 9);

select * from users;
select * from movies;
select * from reviews;

commit;

ALTER TABLE reviews ADD CONSTRAINT fk_reviews_userid foreign key(userid) references users(userid) ON DELETE CASCADE;
ALTER TABLE reviews ADD CONSTRAINT fk_reviews_title foreign key(title) references movies(title) ON DELETE CASCADE;

SELECT nickname, COUNT(content) AS "작성한 리뷰 수" FROM reviews r LEFT JOIN  users u ON r.userid = u.userid GROUP BY nickname ORDER BY 2 DESC;

SELECT * DECODE(totalrate, 1,'완전비추',2,'완전비추',3,'비추',7,'추천',8,'추천',9,'완전추천',10,'인생영화', '보통') TOTALREVIEW FROM movies;





SELECT * FROM movies ORDER BY totalrate DESC,(SELECT COUNT(*) FROM reviews WHERE reviews.title = movies.title) DESC;



SELECT DISTINCT m.title, m.genre, m.releasedate, m.company, m.totalrate, dense_rank() over (order by totalrate desc,(SELECT COUNT(*) FROM reviews r WHERE r.title = m.title))  from  movies m;