-- 사용방법 : Ctrl + A 눌러 전체 선택 후 Ctrl + Enter 실행
drop table reply;
drop sequence seq_user;
drop table tbl_user;
create sequence seq_user;
create table tbl_user (
    uno         number(10) not null primary key,
    user_id     varchar2(50) not null unique,
    user_name   varchar2(50) not null,
    pwd	        varchar2(50) not null,
    email	    varchar2(50) not null,
    phone	    varchar2(50) not null,
    post_code   varchar2(30),
    addr        varchar2(50),
    addr2       varchar2(50),
    reg_date    date default sysdate,
    auth        char(1) default 'm'
);

drop sequence seq_item;
drop table tbl_item;
drop sequence seq_file_item;
drop table tbl_file_item;
create sequence seq_item;
create table tbl_item (
    item_id     number(10) not null primary key,
    category    varchar2(10) not null,
    item_name   varchar2(30) not null,
    item_price  number(10) not null,
    description varchar2(1000) not null,
    item_stock  number(10) not null,
    item_sold   number(10),
    update_date date default sysdate,
    ratingAvg   number(2,1)
);
create sequence seq_file_item;
create table tbl_file_item(
    fid         varchar2(50) not null primary key,
    fileName    varchar2(50) not null,
    image       char(1) default 'I',
    uuid        varchar2(50) not null,
    uploadPath  varchar2(50) not null
);
drop sequence seq_cart;
drop table tbl_cart;
create sequence seq_cart;
create table tbl_cart (
    cart_id     number(30) not null primary key,
    user_id   varchar2(50),
    item_id     number(30),
    item_name   varchar2(50),
    amount      number(10),
    cart_price  number(10)
);

drop sequence seq_user_buy;
drop table tbl_user_buy;
drop sequence seq_guest_buy;
drop table tbl_guest_buy;
drop sequence seq_buy_list;
drop table tbl_buy_list;
create sequence seq_user_buy;
create table tbl_user_buy (
    bno         number(10) not null primary key,
    buy_no      varchar2(100) not null unique,
    user_id     varchar2(30) not null,
    buyer_name  varchar2(30) not null,
    phone       varchar2(30) not null,
    post_code   varchar2(10) not null,
    addr        varchar2(100) not null,
    addr2       varchar2(100) not null,
    buy_status  varchar2(20) default '구매완료',
    buy_date    date default sysdate,
    buy_note    varchar2(100)
);
create sequence seq_guest_buy;
create table tbl_guest_buy (
    gno         number(10) not null primary key,
    buy_no      varchar2(100) not null unique,
    pwd         varchar2(30) not null,
    buyer_name  varchar2(30) not null,
    phone       varchar2(30) not null,
    post_code   varchar2(10) not null,
    addr        varchar2(100) not null,
    addr2       varchar2(100) not null,
    buy_status  varchar2(20) default '결제 완료',
    buy_date    date default sysdate,
    buy_note    varchar2(100)
);
create sequence seq_buy_list;
create table tbl_buy_list (
    blist_no        number(10) not null primary key,
    buy_no          varchar2(100),
    item_id         number(10),
    item_name       varchar2(50),
    amount          number(10),
    buy_price       number(10),
    delivery_cost   number(10)
);

drop table tbl_question;
drop sequence seq_question;
create sequence seq_question;
create TABLE tbl_question(
	qno			NUMBER PRIMARY KEY,
	title		VARCHAR2(300)	NOT NULL,
	content		VARCHAR2(4000)	NOT NULL,
	writer		VARCHAR2(100)	NOT NULL,
	writedate	DATE DEFAULT SYSDATE,
	readcnt		NUMBER DEFAULT 0,
    updatedate  date default sysdate,
    password    VARCHAR2(100),
    reply       VARCHAR2(4000),
    category    VARCHAR2(500)
);

drop sequence seq_notice;
drop table notice;
create sequence seq_notice;
create table notice(
    bno number(10) not null primary key,
    title varchar2(150) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);

drop sequence seq_reply;
drop table reply;
create sequence seq_reply;
create table reply(
    reply_id number primary key,
    item_id number not null,
    user_id varchar2(50) not null,
    regDate date default sysdate,
    content varchar2(3500),
    rating number(2,1) not null,
    FOREIGN KEY (user_id)REFERENCES tbl_user(user_id) on delete cascade,
    FOREIGN KEY (item_id) REFERENCES tbl_item(item_id) on delete cascade,
    UNIQUE(item_id, user_id)
);


commit;


REM INSERTING into MEALKIT_DB.TBL_USER
SET DEFINE OFF;
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'admin','관리자','1234','admin@test.com','010-000-0000','12345','서울시','관악산쪽',to_date('23/05/28','RR/MM/DD'),'a');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'user','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/28','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/30','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid1','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/01','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid2','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/01','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid3','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/01','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid4','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/01','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid5','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/02','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid6','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/02','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid7','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/03','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid8','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/03','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid9','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/03','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid10','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/03','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid11','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/03','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid12','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/03','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid13','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/03','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid14','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/04','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid15','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/04','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid16','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/04','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid17','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/04','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid18','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/05','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid19','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/05','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid20','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/06','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid21','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/07','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid22','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/07','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid23','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/07','RR/MM/DD'),'m');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (SEQ_USER.NEXTVAL,'userid24','회원','1234','user@test.com','010-000-0000','12345','수원시','수원역인근',to_date('23/05/07','RR/MM/DD'),'m');


REM INSERTING into MEALKIT_DB.TBL_ITEM
SET DEFINE OFF;
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'한식','김치찌개',8000,'김치찌개',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'한식','닭갈비',15000,'닭갈비',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'한식','된장찌개',8000,'된장찌개',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'한식','떡만둣국',8500,'떡만둣국',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'한식','부대찌개',9000,'부대찌개',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'한식','순대볶음',10000,'순대볶음',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'한식','순두부찌개',7500,'순두부찌개',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'한식','쭈꾸미삼겹살',13000,'쭈꾸미삼겹살',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'양식','감바스',10000,'감바스',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'양식','그라탕',15000,'그라탕',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'양식','바질파스타',8500,'바질파스타',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'양식','버섯크림리조또',12000,'버섯크림리조또',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'양식','빠네파스타',21000,'빠네파스타',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'양식','알리오올리오',7000,'알리오올리오',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'양식','찹스테이크',17000,'찹스테이크',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'양식','토마토파스타',8500,'토마토파스타',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'중식','깐쇼새우',13000,'깐쇼새우',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'중식','누룽지탕',9000,'누룽지탕',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'중식','레몬크림새우',17000,'레몬크림새우',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'중식','마라샹궈',14000,'마라샹궈',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'중식','마라탕',15000,'마라탕',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'중식','마파두부',15000,'마파두부',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'중식','탕수육',14000,'탕수육',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'중식','팔보채',13000,'팔보채',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'야식','낙곱새',12000,'낙곱새',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'야식','냉채족발',15000,'냉채족발',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'야식','닭발',10000,'닭발',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'야식','불족발',15000,'불족발',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'야식','야채곱창',11000,'야채곱창',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'야식','오뎅탕',6500,'오뎅탕',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'야식','오돌뼈',12000,'오돌뼈',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'야식','치킨',18000,'치킨',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'분식','꼬마김밥',5500,'꼬마김밥',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'분식','납작만두',3000,'납작만두',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'분식','닭강정',15000,'닭강정',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'분식','떡볶이',3500,'떡볶이',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'분식','로제떡볶이',4000,'로제떡볶이',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'분식','모듬튀김',6000,'모듬튀김',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'분식','차돌우동',10000,'차돌우동',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'분식','핫도그',3500,'핫도그',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'기타','과일샐러드',6500,'과일샐러드',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'기타','닭가슴살샐러드',7500,'닭가슴살샐러드',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'기타','미고랭',8500,'미고랭',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'기타','밀푀유나베',19000,'밀푀유나베',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'기타','쌀국수',6500,'쌀국수',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'기타','장어덮밥',16000,'장어덮밥',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'기타','참치샐러드',5000,'참치샐러드',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (SEQ_ITEM.NEXTVAL,'기타','치킨샐러드',8000,'치킨샐러드',100,0,to_date('23/05/28','RR/MM/DD'));


REM INSERTING into MEALKIT_DB.TBL_FILE_ITEM
SET DEFINE OFF;
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'김치찌개.jpeg','1','1b6e8006-3c0d-464e-957c-8d45ca70f6c8','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'닭갈비.jpg','1','facc0d0b-43e6-445d-b646-5bc97c7bcd96','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'된장찌개.jpeg','1','ab52c4d6-b6a0-40f5-8045-6f91d123b0ae','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'떡만둣국.jpg','1','10ce26f4-bf93-4145-9724-3f7487a2f465','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'부대찌개.jpeg','1','b59ad6e1-536f-4ff9-8ec8-476e53bdb0e5','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'순대볶음.jpg','1','82cce59c-aa02-4a5f-8532-a8f893fbfebd','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'순두부찌개.jpeg','1','3bb2415e-441f-4ac8-898a-cfc9c3d06210','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'쭈꾸미삼겹살.jpg','1','9a7db586-df59-4527-a818-b2d2ad77b62e','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'감바스.jpg','1','220998ed-9f44-4816-9dfa-697784bb0c6b','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'그라탕.jpg','1','5c95eed8-a86c-4f09-ab7b-ede50c04c9bb','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'바질파스타.jpg','1','61274d78-0d86-461f-8162-c599632b1e79','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'버섯크림리조또.jpg','1','5326069a-8583-4865-a973-ef966e05fd99','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'빠네파스타.jpg','1','88ac9c22-8ce2-430b-8be2-58669a4ec0ab','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'알리오올리오.jpg','1','78c82152-5035-45fc-bc1a-73bb0963e0ae','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'찹스테이크.jpg','1','26866e65-1b30-4e5c-a18b-7872a1517d80','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'토마토파스타.jpg','1','fa344042-9bc8-4eea-b29d-6f38f57b817c','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'깐쇼새우.jpg','1','a0144371-167d-467f-b8e8-6f4730dfae8c','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'누룽지탕.jpg','1','8d1da9f3-05e4-4cc1-adbc-633fbdbab33e','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'레몬크림새우.jpg','1','800ea7dc-986b-4829-ab9b-fce49d3997db','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'마라샹궈.jpg','1','207287a7-1865-4d90-b522-a8553d36a033','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'마라탕.jpg','1','439b0b86-53da-4da8-a367-0299f13b724b','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'마파두부.jpg','1','0a37e6c3-6a86-44b4-b376-69c7b77b2d5b','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'탕수육.jpg','1','fa7abbe0-7655-4fa0-9510-cdb737d2034d','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'팔보채.jpg','1','4e5c8008-56e7-4db6-8c66-40d75e83097b','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'낙곱새.jpg','1','0526b22e-d0d0-4d4a-b0bc-4c2ec1fc00f8','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'냉채족발.png','1','600ab00d-51de-46a2-9ea0-4dcddeb23fe3','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'닭발.jpg','1','212d7017-7581-4cf0-a3bb-c63dbefaf7b1','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'불족발.jpg','1','923f497b-41a6-4794-8e3d-1f464fd4ad63','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'야채곱창.jpg','1','2c547e60-9e32-430d-a5c0-973e20cb79da','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'오뎅탕.jpg','1','f131110b-b6a9-45b5-9581-ba5401fd477b','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'오돌뼈.jpg','1','5918e3a8-d9fd-481a-814c-014c9d82fa68','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'치킨.jpg','1','8d1e98c1-bfb5-4f6d-ab33-6d0d0cf6aa27','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'꼬마김밥.jpg','1','9b07a216-b578-4f7f-9b0b-ed12c45361ed','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'납작만두.jpg','1','644071ac-ef29-4c57-a32a-3e36983c3e95','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'닭강정.jpg','1','0fd88474-07b6-48c0-b189-b9b96ecd3c8e','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'떡볶이.png','1','6a9aea15-3476-445a-8d21-cc3d8e784233','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'로제떡볶이.jpg','1','1afc405c-eff1-47be-b616-09e15b95a6d4','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'모듬튀김.jpg','1','1f1af772-0ec0-4a4c-9305-3e4a2df2ee2d','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'차돌우동.jpg','1','d830dcdc-232c-4f28-82f6-57db582740ac','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'핫도그.jpg','1','0091576c-0bfc-4e34-8cd7-670b9b387fea','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'과일샐러드.jpeg','1','173574ab-9c43-4977-b826-b59db688ac0f','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'닭가슴살샐러드.jpeg','1','ae1b4a92-af5f-403e-a084-582fd7b11fa6','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'미고랭.jpg','1','72312368-3181-410a-ba01-205f9a6f5e4e','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'밀푀유나베.jpg','1','38593eea-c9f7-4c74-b0f0-2104c7a86eb5','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'쌀국수.jpg','1','0ee23854-d405-46b5-a7b5-b7b88aa33da1','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'장어덮밥.jpg','1','2427f2af-abac-4bce-a91c-6bfed59da6da','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'참치샐러드.jpeg','1','fa57a75e-9c1c-4cb8-9a02-011845389c0e','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values (SEQ_FILE_ITEM.NEXTVAL,'치킨샐러드.jpeg','1','87391cf2-ddb0-4fe2-8415-cab93ef0cc31','2023\05\28');


commit;