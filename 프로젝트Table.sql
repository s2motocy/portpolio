
-- 순서 :    회원 / 비회원 / 상품 / 장바구니 / 구매 / 문의 / 공지 


-------------------------------------------------------------------------------- 회원 (user)
drop table tbl_user;
-- 회원(user) 시퀀스 생성
create sequence seq_user;
-- 회원(user) 테이블 생성
create table tbl_user (
    uno         number(10) not null primary key,        -- 번호
    user_id     varchar2(50) not null unique,           -- 아이디
    user_name   varchar2(50) not null,                  -- 이름
    pwd	        varchar2(50) not null,                  -- 비밀번호
    email	    varchar2(50) not null,                  -- 이메일
    phone	    varchar2(50) not null,                  -- 연락처
    post_code   varchar2(30),                           -- 우편번호 (선택)
    addr        varchar2(50),                           -- 주소 (선택)
    addr2       varchar2(50),                           -- 상세주소 (선택)
    reg_date    date default sysdate,                   -- 가입일
    auth        char(1) default 'm'                     -- 권한
);

-- dummy
insert into tbl_user(uno,user_id, user_name, pwd, email, phone, post_code, addr, addr2, auth) values (seq_user.nextval,'admin','관리자','1234','admin@test.com','010-000-0000','12345','서울시','관악산쪽','a');
insert into tbl_user(uno,user_id, user_name, pwd, email, phone, post_code, addr, addr2) values (seq_user.nextval,'user','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근');

-- 커밋
commit;

-- 조회
select * from tbl_user;

-- drop
drop sequence seq_user;
drop table tbl_user;


-------------------------------------------------------------------------------- 상품 (item)

-- 상품(item) 시퀀스 생성
create sequence seq_item;
-- 상품(item) 테이블 생성
create table tbl_item (
    item_id     number(10) not null primary key,        -- 상품 번호 (시퀀스 사용)
    category    varchar2(10) not null,                  -- 상품 분류
    item_name   varchar2(30) not null,                  -- 상품 이름
    item_price  number(10) not null,                    -- 상품 가격
    description varchar2(1000) not null,                -- 상품 설명
    item_stock  number(10) not null,                    -- 상품 재고
    item_sold   number(10),                             -- 상품 판매량
    update_date date default sysdate                    -- 수정일
);

-- 상품 이미지(file_item) 시퀀스 생성
create sequence seq_file_item;
-- 상품 이미지(file_item) 테이블 생성
create table tbl_file_item(
    fid         varchar2(50) not null primary key,      -- 이미지 번호 (시퀀스 사용)
    fileName    varchar2(50) not null,                  -- 파일 이름
    image       char(1) default 'I',                    -- 이미지 유무
    uuid        varchar2(50) not null,                  -- UUID
    uploadPath  varchar2(50) not null                   -- 저장 경로
);

-- 커밋
commit;

-- 조회
select * from tbl_item;
select * from tbl_file_item;
select * from tbl_item order by update_date desc;
select *
				from (
				    select *
				    from tbl_item
				    order by item_sold desc
				)
				where rownum <= 6;
-- drop item
drop sequence seq_item;
drop table tbl_item;
-- drop file
drop sequence seq_file_item;
drop table tbl_file_item;


SELECT *
			FROM (
			  SELECT *,
		  	  CASE
		     	 WHEN update_date = 'n' THEN update_date
		     	 WHEN update_date = 'b' THEN item_sold
		     	 ELSE null
		   	 END AS sort_by
		 	 FROM tbl_item
		 	 ORDER BY sort_by DESC
		) 
		WHERE ROWNUM <= 6;

-------------------------------------------------------------------------------- 장바구니 (cart)

-- 장바구니(cart) 시퀀스 생성
create sequence seq_cart;
-- 장바구니(cart) 테이블 생성
create table tbl_cart (
    cart_id     number(30) not null primary key,    -- 카트 번호 (시퀀스 사용)
    user_id     varchar2(50),                       -- 카트 이름
    item_id     number(30),                         -- 상품 번호
    item_name   varchar2(50),                       -- 상품 이름
    amount      number(10),                         -- 상품 수량
    cart_price  number(10)                          -- 합산 가격
);

-- 커밋
commit;

-- 조회
select * from tbl_cart;

-- drop
drop sequence seq_cart;
drop table tbl_cart;


-------------------------------------------------------------------------------- 구매 (buy)

-- 회원구매(user_buy) 시퀀스 생성
create sequence seq_user_buy;
-- 회원구매(user_buy) 테이블 생성
create table tbl_user_buy (
    bno         number(10) not null primary key,        -- 시퀀스
    buy_no      varchar2(100) not null unique,          -- 주문번호
    user_id     varchar2(30) not null,                  -- 주문자아이디
    buyer_name  varchar2(30) not null,                  -- 배송받을 이름
    phone       varchar2(30) not null,                  -- 연락처
    post_code   varchar2(10) not null,                  -- 우편번호
    addr        varchar2(100) not null,                 -- 주소    
    addr2       varchar2(100) not null,                 -- 주소(상세)
    buy_note    varchar2(100),                          -- 배송시 요청사항
    buy_status  varchar2(20) default '구매완료',         -- 주문상태
    buy_date    date default sysdate                    -- 주문한 날짜
);
insert into tbl_user_buy values(seq_user_buy.nextval, 'u12337', 't2', '민선', '010111111','123123','12313132','12313','구매완료','2023/05/17');
-- 비회원구매(guest_buy) 시퀀스 생성
create sequence seq_guest_buy;
-- 비회원구매(guest_buy) 테이블 생성
create table tbl_guest_buy (
    gno         number(10) not null primary key,        -- 시퀀스
    buy_no      varchar2(100) not null unique,          -- 주문번호
    pwd         varchar2(30) not null,                  -- 비회원 비밀번호
    buyer_name  varchar2(30) not null,                  -- 배송받을 이름
    phone       varchar2(30) not null,                  -- 연락처
    post_code   varchar2(10) not null,                  -- 우편번호
    addr        varchar2(100) not null,                 -- 주소    
    addr2       varchar2(100) not null,                 -- 주소(상세)
    buy_note    varchar2(100),                          -- 배송시 요청사항
    buy_status  varchar2(20) default '구매완료',         -- 주문상태
    buy_date    date default sysdate                    -- 주문한 날짜
);

-- 구매 상품(buy_list) 시퀀스 생성
create sequence seq_buy_list;
-- 구매 상품(buy_list) 테이블 생성
create table tbl_buy_list (
    blist_no        number(10) not null primary key,    -- 주문목록 번호
    buy_no          varchar2(100),                      -- 조회 번호
    item_id         number(10),                         -- 상품 번호
    item_name       varchar2(50),                       -- 상품 이름
    amount          number(10),                         -- 수량
    buy_price       number(10),                         -- 가격
    delivery_cost   number(10)                          -- 배송비
);

-- 커밋
commit;

-- 조회
select * from tbl_user_buy;
select * from tbl_guest_buy;
select * from tbl_buy_list;

-- drop user_buy
drop sequence seq_user_buy;
drop table tbl_user_buy;
-- drop guest_buy
drop sequence seq_guest_buy;
drop table tbl_guest_buy;
-- drop buy_list
drop sequence seq_buy_list;
drop table tbl_buy_list;


-------------------------------------------------------------------------------- 문의 (inquiry)
--시퀀스 생성
create sequence seq_question;
--문의 테이블 생성
create TABLE tbl_question(
	qno			NUMBER PRIMARY KEY,                                             -- 게시글 번호
	title		VARCHAR2(300)	NOT NULL,                                       -- 게시글 제목
	content		VARCHAR2(4000)	NOT NULL,                                       -- 게시글 내용
	writer		VARCHAR2(100)	NOT NULL,                                       -- 게시글 작성자
	writedate	DATE DEFAULT SYSDATE,                                           -- 글 작성날짜
	readcnt		NUMBER DEFAULT 0,                                               -- 조회수
    updatedate  date default sysdate,                                           -- 글 수정날짜
    password    VARCHAR2(100),                                                  -- 글 비밀번호
    reply       VARCHAR2(4000),                                                 -- 답변
    category    VARCHAR2(500)                                                   -- 문의 종류
);

--조회
select * from tbl_question;
--커밋
commit;
-- 삭제
drop table tbl_question;
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
insert into notice values(seq_notice.nextval, '제목', '내요오오옹', '아무개', '2023/05/16', '2023/05/16');
select * from notice;
-- 커밋
commit;

update tbl_item set item_sold=100 where item_id=5;
select * from tbl_item order by item_sold desc;
