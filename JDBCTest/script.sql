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