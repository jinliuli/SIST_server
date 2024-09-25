-- JDBCTest/script.sql
show user;
create user server identified by java1234;
grant connect, resource, dba to server;

-- 주소록테이블
create table tblAddress (
    seq number,
    name varchar2(30) not null,
    age number(3) not null,
    gender char(1) not null,
    tel varchar2(15) not null,
    address varchar2(300) not null,
    regdate date default sysdate not null
);

alter table tblAddress
    add constraint address_seq_pk primary key(seq);
    
alter table tblAddress
    add constraint address_age_ck check (age between 0 and 150);
        
alter table tblAddress
    add constraint address_gender_ck check (gender in ('m', 'f'));
        
create sequence seqAddress;

-- CRUD
insert into tblAddress (seq, name, age, gender, tel, address, regdate) values (seqAddress.nextVal, '강아지', 20, 'm', '010-1234-5678', '서울시 강남구 역삼동', default);

select * from tblAddress;

update tblAddress set age = age + 1 where seq = 1;

delete from tblAddress where seq = 3;

commit;

create table tblJava (
    seq number primary key,
    data varchar2(100) not null
);

select * from tblJava;


-- hr-----------------------------------------------------
select * from tblInsa;
select * from tblBonus;
select * from tblAddress;

-- 제약 조건 확인하기
SELECT A.UNIQUENESS, B.* FROM ALL_INDEXES A, ALL_IND_COLUMNS B WHERE A.INDEX_NAME = B.INDEX_NAME AND A.TABLE_NAME='TBLBONUS';
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'TBLBONUS';






-- server-----------------------------------------------------
-- Ex06_CallableStatement.java
-- m1. 인자값X 반환값X
create or replace procedure procM1
is
begin
    insert into tblAddress (seq, name, age, gender, tel, address, regdate) values (seqAddress.nextVal, '타조', 20, 'm', '010-1234-5678', '서울시 강남구 역삼동', default);
end procM1;
/

-- m2. 인자값O, 반환값X
create or replace procedure procM2(
     pname varchar2,
     page varchar2,
     pgender varchar2,
     ptel varchar2,
     paddress varchar2
)
is
begin
    insert into tblAddress (seq, name, age, gender, tel, address, regdate) values (seqAddress.nextVal, pname, page, pgender, ptel, paddress, default);
end procM2;
/

-- m3. 인자값X, 반환값O
create or replace procedure procM3 (
    pcnt out number
)
is
begin
    select count(*) into pcnt from tblAddress;
end procM3;
/


-- hr----------------------------------------------
-- m4. 인자값O, 반환값O
-- 직원번호 > 이름, 부서, 직위
create or replace procedure procM4 (
    pnum in number,
    pname out varchar2,
    pbuseo out varchar2,
    pjikwi out varchar2
)
is
begin
    select name, buseo, jikwi into pname, pbuseo, pjikwi from tblInsa where num = pnum;
end procM4;
/


-- m5. 커서 반환
create or replace procedure procM5 (
   pbuseo in varchar2,
   pcursor out sys_refcursor
)
is
begin
    open pcursor
    for
    select * from tblInsa where buseo = pbuseo;
end procM5;
/