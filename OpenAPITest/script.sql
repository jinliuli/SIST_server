--OpenAPITest > script.sql

--좌표(마커) 테이블
create table tblMarker (
    seq number primary key,
    lat number not null,
    lng number not null
);

create sequence seqMarker;

--한독빌딩 : 37.499330, 127.033181
--역삼역 : 37.500089, 127.035399
--롯데리아 : 37.498556, 127.030443
--국민은행 : 37.499707, 127.032141
--신한은행 : 37.499944, 127.035494
--파리바게뜨 : 37.499378, 127.034302
--뚜레쥬르 : 37.499097, 127.034532
--세븐일레븐 : 37.499028, 127.033160
--CU : 37.498798, 127.033485
--세븐스프링스 : 37.498982, 127.032267


insert into tblMarker values (seqMarker.nextVal, 37.499330, 127.033181);
insert into tblMarker values (seqMarker.nextVal, 37.500089, 127.035399);
insert into tblMarker values (seqMarker.nextVal, 37.498556, 127.030443);
insert into tblMarker values (seqMarker.nextVal, 37.499707, 127.032141);
insert into tblMarker values (seqMarker.nextVal, 37.499944, 127.035494);
insert into tblMarker values (seqMarker.nextVal, 37.499378, 127.034302);
insert into tblMarker values (seqMarker.nextVal, 37.499097, 127.034532);
insert into tblMarker values (seqMarker.nextVal, 37.499028, 127.033160);
insert into tblMarker values (seqMarker.nextVal, 37.498798, 127.033485);
insert into tblMarker values (seqMarker.nextVal, 37.498982, 127.032267);

select * from tblMarker;
commit;

--Food
create table tblCategory (
    seq number primary key,         --PK
    name varchar2(100) not null,    --카테고리명(한식,중식,카페 등)
    img varchar2(100) not null      --카테고리별 마커 이미지
);

insert into tblCategory values (1, '한식', 'heart.png');
insert into tblCategory values (2, '양식', 'harbor.png');
insert into tblCategory values (3, '중식', 'library.png');
insert into tblCategory values (4, '일식', 'favorite.png');
insert into tblCategory values (5, '분식', 'theater.png');
insert into tblCategory values (6, '패스트푸드', 'restaurant.png');
insert into tblCategory values (7, '음료', 'town-hall.png');
insert into tblCategory values (8, '편의점/마트', 'hospital.png');
insert into tblCategory values (9, '기타', 'forest.png');

drop table tblFood;
drop sequence seqFood;

create table tblFood (
    seq number primary key,     --PK
    name varchar2(300) not null,--장소명
    lat number not null,        --위도
    lng number not null,        --경도
    category number not null references tblCategory(seq), --카테고리(FK)
    address varchar2(500) null, --주소
    star number(1) not null,    --별점
    menu varchar2(100) null     --추천메뉴
);
create sequence seqFood;



commit;

select * from tblCategory;
select * from tblFood;

