-- Memo > script.sql

create table tblMemo (
    seq number primary key,                 --메모번호
    name varchar2(30) not null,             --작성자
    pw varchar2(30) not null,               --암호
    memo varchar2(30) not null,             --메모
    regdate date default sysdate not null   --작성일
);


create sequence seqMemo;

-- 테스트 & 업무 SQL
-- 메모쓰기
insert into tblMemo (seq, name, pw, memo, regdate)
    values (seqMemo.nextVal, '홍길동', '111', '메모입니다.', default);
    
-- 메모읽기 > 목록보기
select * from tblMemo order by seq desc;

-- 메모수정하기
update tblMemo set memo = '수정합니다.' where seq = 1;

-- 메모삭제하기
delete from tblMemo where seq = 23;

-- 수정/삭제 권한 확인하기
-- 1: 권한O
-- 0: 권한X
select count(*) from tblMemo where seq = 1 and pw = '사용자가 입력한 암호';

commit;
