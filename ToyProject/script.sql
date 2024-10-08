show user;

create user toy identified by java1234;
grant connect, resource, dba to toy;

show user;

--유저 테이블
create table tblUser (
    id varchar2(50) primary key,                --아이디PK
    pw varchar2(50) not null,                   --암호
    name varchar2(50) not null,                 --이름
    email varchar2(100) not null,               --이메일
    lv number(1) not null,                      --등급
    pic varchar2(100) default 'pic.png' not null,--사진
    intro varchar2(500) null,                   --자기소개
    regdate date default sysdate not null,      --가입날짜
    ing number(1) default 1 not null            --탈퇴(1활동, 0탈퇴)
);

--회원 데이터
insert into tblUser (id, pw, name, email, lv, pic, intro, regdate, ing) values ('hong', '1111', '홍길동', 'hong@gmail.com', 1, default, '안녕 길동쓰', default, default);
insert into tblUser (id, pw, name, email, lv, pic, intro, regdate, ing) values ('dog', '1111', '강아지', 'dog@gmail.com', 1, default, '멍멍!', default, default);
insert into tblUser (id, pw, name, email, lv, pic, intro, regdate, ing) values ('cat', '1111', '고양이', 'cat@gmail.com', 2, default, '냐옹~관리자', default, default);

select * from tblUser;

commit;

--로그인
--select * from tblUser where id = ? pw = ?;