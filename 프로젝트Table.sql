-- 순서 :    상품 / 회원 / 문의 / 공지 / 배송 / 장바구니 / 관리자


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

