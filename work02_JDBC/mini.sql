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
 
insert into movies values( '������Ż', '�ڹ̵�', '2023/06/16', '�����', 0 );
insert into movies values( '�̼����ļ���7', '�׼�', '2023/07/12', '�Ķ󸶿�Ʈ���Ľ�,', 0);
insert into movies values( '�������츮', '�θǽ�', '2021/04/30', '����¡���Ľ�', 0);

insert into users values( 'kd1284', 0, '�ٿ��', null);
insert into users values( 'je123', 0, '����', null);
insert into users values( '2oo1', 1, null, 'server');
insert into reviews values( 'kd1284', '������Ż', '����~', 10);

insert into movies values( '������Ż', '�ִ�', '2023/06/14', '�����', 0 );
insert into movies values( '�̼����ļ���7', '�׼�', '2023/07/12', '�Ķ󸶿�Ʈ ��ó��', 0);
insert into movies values( '�������츮', '�θǽ�', '2023/06/28', '����¡ �ζ���Ʈ ���Ľ�', 0);
insert into movies values( '���������', '���', '2023/08/2', '��ڽ�', 0);
insert into movies values( '����', 'SF', '2023/08/2', 'CJ ENM', 0);
insert into movies values( '�м�', '����', '2023/07/26', 'NEW', 0);
insert into movies values( '�ٺ�', '���', '2023/07/19', '���� �귯���� �ڸ���', 0);
insert into movies values( '��Ž�� �ڳ�', '�ִ�', '2023/07/20', 'CJ ENM', 0);

insert into users values( 'imking', 1, null, 'server');
insert into users values( 'kd1284', 0, '�ٿ��', null);
insert into users values( '2oo1', 0, '����', null);
insert into users values( 'mellykim', 0, '����', null);
insert into users values('lcy923',0,'��ì��',null);


insert into reviews values( '2oo1', '������Ż', '���̵� ���� F', 10);
insert into reviews values( '2oo1', '�ٺ�', '�ʹ� ��ũ��ũ,,,', 2);
insert into reviews values( '2oo1', '�̼����ļ���7', '�� ���� ��', 4);

insert into reviews values( 'kd1284', '�ٺ�', '�� �� �ٺ��~', 10);
insert into reviews values( 'kd1284', '�̼����ļ���7', '��ũ���� �׼� ���', 7);


insert into reviews values( 'mellykim', '�̼����ļ���7', '������ ���� �� �ܿ�,,,', 7);
insert into reviews values( 'mellykim', '�ٺ�', '�巹�� �ڵ� ��ũ�ΰ� �ƽ���', 9);
insert into reviews values( 'mellykim', '�������츮', '������ ���� ���� ��ȭ�Դϴ�', 6);
insert into reviews values( 'mellykim', '��Ž�� �ڳ�', '�ִ� �������ϴµ� �̰� ����', 9);
insert into reviews values( 'mellykim', '������Ż', '���ٰ� �������', 3);

insert into reviews values( 'lcy923', '�м�', '�׳�����,,,', 5);
insert into reviews values( 'lcy923', '������Ż', '����� ���� �� ��ä', 9);

select * from users;
select * from movies;
select * from reviews;

commit;

ALTER TABLE reviews ADD CONSTRAINT fk_reviews_userid foreign key(userid) references users(userid) ON DELETE CASCADE;
ALTER TABLE reviews ADD CONSTRAINT fk_reviews_title foreign key(title) references movies(title) ON DELETE CASCADE;

SELECT nickname, COUNT(content) AS "�ۼ��� ���� ��" FROM reviews r LEFT JOIN  users u ON r.userid = u.userid GROUP BY nickname ORDER BY 2 DESC;

SELECT * DECODE(totalrate, 1,'��������',2,'��������',3,'����',7,'��õ',8,'��õ',9,'������õ',10,'�λ���ȭ', '����') TOTALREVIEW FROM movies;





SELECT * FROM movies ORDER BY totalrate DESC,(SELECT COUNT(*) FROM reviews WHERE reviews.title = movies.title) DESC;



SELECT DISTINCT m.title, m.genre, m.releasedate, m.company, m.totalrate, dense_rank() over (order by totalrate desc,(SELECT COUNT(*) FROM reviews r WHERE r.title = m.title))  from  movies m;