drop table book;
drop table author;
drop sequence seq_author_id;
drop sequence seq_book_id;


create table author(
    author_id number(10)
    ,author_name varchar2(100) not null
    ,author_desc varchar2(500)
    ,primary key(author_id)
);

create table book(
    book_id number(10)
    ,title varchar2(100) not null
    ,pubs varchar2(500)
    ,pub_date date
    ,author_id number(10)
    ,primary key(book_id)
    ,constraint book_fk foreign key (author_id)
    references author(author_id)
);

create sequence seq_author_id
increment by 1
start with 1
nocache;

create sequence seq_book_id
increment by 1
start with 1
nocache;

insert into author
values(seq_author_id.nextval, '이문열', '경북 영양');

insert into author
values(seq_author_id.nextval, '박경리', '경상남도 통영');

insert into author
values(seq_author_id.nextval, '유시민', '17대 국회의원');

insert into author
values(seq_author_id.nextval, '기안84', '기안동에서 산 84년생');

insert into author
values(seq_author_id.nextval, '강풀', '온라인 만화가 1세대');

insert into author
values(seq_author_id.nextval, '김영하', '알쓸신잡');

insert into book
values( seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);

insert into book
values( seq_book_id.nextval, '삼국지', '민음사', '2002-03-01', 1);

insert into book
values( seq_book_id.nextval, '토지', '마로니에북스', '2012-08-15', 2);

insert into book
values( seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);

insert into book
values( seq_book_id.nextval, '패션왕', '중앙북스(books)', '2012-02-22', 4);

insert into book
values( seq_book_id.nextval, '순정만화', '재미주의', '2011-08-03', 5);

insert into book
values( seq_book_id.nextval, '오직두사람', '문학동네', '2017-05-04', 6);

insert into book
values( seq_book_id.nextval, '26년', '재미주의', '2012-02-04', 5);

update author
set author_desc = '서울특별시'
where author_id = 5;

delete from author
where author_id = 4;
--book에서 fk로 사용중이여서 삭제 안 됨


select book_id
    ,title
    ,pubs
    ,to_char(pub_date, 'yyyy-mm-dd') pub_date
    ,a.author_id
    ,author_name
    ,author_desc
from book b, author a
where a.author_id = b.author_id;
