-- 순서 :    회원 / 비회원 / 상품 / 장바구니 / 구매 / 결제 / 배송 / 문의 / 공지 


-------------------------------------------------------------------------------- 회원 (member)

-- 회원(member) 의 시퀀스 생성
create SEQUENCE seq_members;
-- 회원(member) 테이블 생성
create table members(
    bno number(10) not null primary key,
    name varchar2(50),
    ID	VARCHAR2(50),
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


-------------------------------------------------------------------------------- 상품 (item)

-- 상품(item) 의  시퀀스 생성
create sequence seq_item;
-- 상품 테이블 생성
create table item (
    itemid number(10) not null primary key,     -- 상품 번호 (시퀀스 사용)
    category varchar(10) not null,              -- 상품 분류
    name varchar(30) not null,                  -- 상품 이름
    price number(10) not null,                  -- 상품 가격
    description varchar(1000) not null,         -- 상품 설명
    update_date date default sysdate            -- 수정일
);

-- 상품 이미지 의 시퀀스 생성
create sequence seq_file_item;
-- 상품 이미지 등록
create table tbl_file_item(
    fid varchar(50) not null primary key,       -- 이미지 번호 (시퀀스 사용)
    fileName varchar(50) not null,              -- 파일 이름
    image char(1) default 'I',                  -- 이미지 유무
    uuid varchar(50) not null,                  -- UUID
    uploadPath varchar(50) not null             -- 저장 경로
);

-- drop item
drop sequence seq_item;
drop table item;
-- drop file
drop sequence seq_file_item;
drop table tbl_file_item;


-------------------------------------------------------------------------------- 장바구니 (cart)

-- 장바구니(cart) 의 시퀀스 생성
create sequence seq_cart;
-- 장바구니(cart) 테이블 생성
create table cart (
    cart_id number(30) not null primary key,    -- 카트 번호 (시퀀스 사용)
    member_id number(30),                       -- 회원 번호
    item_id number(30),                         -- 상품 번호
    item_name varchar2(50),                     -- 상품 이름
    amount number(10),                          -- 상품 수량
    price number(10)                            -- 합산 가격
);

-- drop
drop sequence seq_cart;
drop table cart;

-- 커밋
commit;

-- 조회
select * from cart;


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


-------------------------------------------------------------------------------- 결제 (pay)






-------------------------------------------------------------------------------- 배송 (delivery)

-- 배송(delivery)의 시퀀스 생성
create sequence seq_delivery;
-- 배송(delivery) 테이블 생성
create table delivery(
    dno number(10) not null primary key,        -- 구분 번호
    delivery_no number not null,                -- 주문 번호 (조회 번호로 사용됨)
    member_id varchar2(30) not null,            -- 회원 번호
    item varchar(30) not null,                  -- 상품 이름
    delivery varchar(20),                       -- 주문 상태
    delivery_date date not null,                -- 주문 일자
    price number                                -- 결제 가격
);

-- 커밋
commit; 

-- 조회
select * from delivery;


-------------------------------------------------------------------------------- 문의 (inquiry)

-- 문의 의 시퀀스 생성
create sequence seq_inquiry;
-- 문의 테이블 생성
CREATE TABLE tbl_inquiry (
  qno NUMBER(10) NOT NULL PRIMARY KEY,          -- 번호 (시퀀스 사용)
  title VARCHAR2(100) NOT NULL,                 -- 제목
  content VARCHAR2(100) NOT NULL,               -- 내용
  wrtier VARCHAR2(100) NOT NULL,                -- 작성자
  register_date DATE NOT NULL,                  -- 등록일
  update_date DATE DEFAULT SYSDATE,             -- 수정일
  reply_cnt NUMBER(10)                          -- 댓글 수
);

-- 커밋
commit;

-- 조회
select * from tbl_inquiry;



-------------------------------------------------------------------------------- 공지 (notice)

-- 시퀀스 생성
create sequence seq_notice;
-- 테이블 생성
create table notice(
    bno number(10) not null primary key,
    title varchar2(150) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);

-- 커밋
commit;



