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






-- 게시판 테이블
create table tblBoard (
    seq number primary key,                         --글번호(PK)
    subject varchar2(300) not null,                 --제목
    content varchar2(4000) not null,                --내용
    regdate date default sysdate not null,          --날짜
    readcount number default 0 not null,            --조회수
    id varchar2(50) not null references tblUser(id) --아이디(FK)
);

create sequence seqBoard;

select * from tblBoard;

--drop table tblBoard;
--drop sequence seqBoard;

commit;



-- 작성날짜 or 작성시간함수
--1. 조회시각이 오늘과 같은 날짜면 > 시간 반환
--2. 조회 시각이 오늘과 다른 날짜면  > 날짜 반환
create or replace function fnRegdate (
    regdate date
) return varchar2
is
begin

    if to_char(sysdate, 'yyyy-mm-dd') = to_char(regdate, 'yyyy-mm-dd') then
        return to_char(regdate, 'hh24:mi:ss');
    else
        return to_char(regdate, 'yyyy-mm-dd');
    end if;

end fnRegdate;
/

--select to_char(regdate, 'hh24:mi:ss') from tblBoard;
select fnRegdate(regdate) from tblBoard order by seq desc;


--system으로 실행
alter user toy default tablespace users;



select * from tblBoard order by seq desc;
select * from tblUser order by id desc;

update tblBoard set regdate = regdate - 1 where seq = 5;
update tblBoard set regdate = regdate - 2.5 where seq = 2;
update tblBoard set regdate = regdate - 5 where seq = 1;


create or replace view vwBoard
as
select 
    tblBoard.*, fnRegdate(regdate) as regtime, 
    (select name from tblUser where id = tblBoard.id) as name,
    (sysdate - regdate) as isnew,
    (select count(*) from tblComment where bseq = tblBoard.seq) as commentCount
from tblBoard 
    order by thread desc;

select * from vwBoard;


-- 댓글 테이블
create table tblComment (
    seq number primary key,                             --번호(PK)
    content varchar2(2000) not null,                    --댓글
    regdate date default sysdate not null,              --날짜
    id varchar2(50) not null references tblUser(id),    --유저(FK)
    bseq number not null references tblBoard(seq)       --부모글(FK)
);

create sequence seqComment;

select * from tblComment;






select * from tblBoard order by seq desc;



drop table tblComment;
drop table tblBoard;

-- 게시판 테이블(+답변 > 계층형)
create table tblBoard (
    seq number primary key,                         --글번호(PK)
    subject varchar2(300) not null,                 --제목
    content varchar2(4000) not null,                --내용
    regdate date default sysdate not null,          --날짜
    readcount number default 0 not null,            --조회수
    id varchar2(50) not null references tblUser(id),--아이디(FK)
    thread number not null,                         --답변형(그룹+정렬)
    depth number not null,                          --답변형(들여쓰기)
    ing number(1) default 1 not null                --삭제유무
);



select * from tblBoard where thread < 현재글thread 
    and thread > (select nvl(max(thread), 이전새글의thread) from tblBoard 
              where thread < 현재글thread and depth = 현재글depth);

select * from tblBoard;





drop table tblComment;
drop table tblBoard;

-- 게시판 테이블(+첨부파일)
create table tblBoard (
    seq number primary key,                         --글번호(PK)
    subject varchar2(300) not null,                 --제목
    content varchar2(4000) not null,                --내용
    regdate date default sysdate not null,          --날짜
    readcount number default 0 not null,            --조회수
    id varchar2(50) not null references tblUser(id),--아이디(FK)
    thread number not null,                         --답변형(그룹+정렬)
    depth number not null,                          --답변형(들여쓰기)
    ing number(1) default 1 not null,               --삭제유무
    attach varchar2(300) null                       --첨부파일
);





-- 좋아요/싫어요 테이블
create table tblGoodBad (
    seq number primary key,                         --PK
    id varchar2(50) not null references tblUser(id),--아이디(FK)
    bseq number not null references tblBoard(seq),  --번호(FK)
    state number(1) not null                        --상태
);
create sequence seqGoodBad;

select * from tblGoodBad;

select * from tblcomment;

--drop table tblGoodBad;
--drop sequence seqGoodBad;

select state, count(*) as cnt from tblGoodBad where bseq = 285 group by state;