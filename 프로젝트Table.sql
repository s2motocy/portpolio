-- 순서 :    상품 / 회원 / 비회원 / 문의 / 공지 / 구매 / 장바구니 / 관리자

-------------------------------------------------------------------------------- 상품 (item)

-- 상품(item) 의  시퀀스 생성
create sequence seq_item;
-- 상품 테이블 생성
create table item (
    itemid number(10) not null primary key,     -- 번호
    category varchar(10) not null,              -- 분류
    name varchar(30) not null,                  -- 상품 이름
    price number(10) not null,                  -- 상품 가격
    description varchar(1000) not null,         -- 상품 설명
    update_date date default sysdate            -- 수정일
);

-- 상품 이미지 의 시퀀스 생성
create sequence seq_file_item;
-- 상품 이미지 등록
create table tbl_file_item(
fid varchar(50) not null primary key,           -- 번호
fileName varchar(50) not null,                  -- 파일 이름
image char(1) default 'I',                      -- 이미지 유무
uuid varchar(50) not null,                      -- UUID
uploadPath varchar(50) not null                 -- 저장 경로
);

-- drop item
drop sequence seq_item;
drop table item;
-- drop file
drop sequence seq_file_item;
drop table tbl_file_item;

-- 커밋
commit;

-- 조회
select * from item;
select * from tbl_file_item;
commit;

-------------------------------------------------------------------------------- 회원 (member)

-- 회원(member) 의 시퀀스 생성
create SEQUENCE seq_members;
-- 회원(member) 테이블 생성
create table members(
    member_id number(10) not null primary key,
    name varchar2(50),
    ID VARCHAR2(50),
    PWD	VARCHAR2(50),
    PWD2	VARCHAR2(50),
    EMAIL	VARCHAR2(50),
    PNUM	VARCHAR2(50),
    HNUM	VARCHAR2(50),
    ADDRESS	VARCHAR2(50),
    DEADDRESS VARCHAR2(50)
);

-- 커밋
commit;

-- 조회
select * from members;

drop sequence seq_members;
drop table members;
-------------------------------------------------------------------------------- 비회원 (guest)

-- 비회원(guest) 의 시퀀스 생성
create sequence seq_guest;
-- 비회원(guest) 의 테이블 생성
create table guest(
    gid number not null primary key,
    name varchar2(20),
    pnum varchar2(30),
    pwd varchar2(30),
    address	VARCHAR2(50),
    deaddress VARCHAR2(50),
    itemid number,
    envoice_no varchar2(100) not null unique
);

-- 커밋
commit;

-- 조회
select * from guest;
drop sequence seq_guest;
drop table guest;

-------------------------------------------------------------------------------- 문의 (Qna)

-- 문의 의 시퀀스 생성
create sequence seq_Qna;
-- 문의 테이블 생성
create table Qna(
    id NUMBER CONSTRAINT Qna_id PRIMARY KEY,
    title  VARCHAR2(100) NOT NULL,
    content VARCHAR2(100) NOT NULL,
    writer VARCHAR2(100) NOT NULL,
    writedate DATE DEFAULT SYSDATE,
    readcnt NUMBER DEFAULT 0,
    root NUMBER,
    step NUMBER DEFAULT 0,
    indent NUMBER DEFAULT 0
);
insert into Qna (id, title, content, writer)
values (1,'테스트1','잘들어옴?','김희수');
-- 커밋
commit;

-- 조회
select * from Qna;

-------------------------------------------------------------------------------- 구매 (buy)

-- 구매(buy)의 시퀀스 생성
create sequence seq_buy;
-- 구매(buy) 테이블 생성
create table buy(
    bno number(10) not null primary key,  -- 시퀀스
    buy_no varchar2(100) not null unique,  --주문번호
    member_id varchar2(30) not null,  -- 주문자아이디
    cart_id varchar(30) not null,  -- 주문상품
    buy varchar(20),  -- 주문상태
    buy_date date not null, -- 주문한 날짜
    price number  -- 주문 금액
);

-- 커밋
commit;

-- 조회
select * from buy;

drop table buy;
drop SEQUENCe seq_buy;

-------------------------------------------------------------------------------- 장바구니 (cart)

-- 장바구니(cart) 의 시퀀스 생성
create sequence seq_cart;
-- 장바구니(cart) 테이블 생성
create table cart (
    cart_id number(30) not null primary key,
    member_id number(30),
    item_id number(30),
    item_name varchar2(50),
    amount number(10),
    price number(10),
    item_img varchar2(100)
);

-- 커밋
commit;

-- 조회
select * from cart;

-------------------------------------------------------------------------------- 장바구니 (cart)