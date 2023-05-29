-- »ç¿ë¹æ¹ý : Ctrl + A ´­·¯ ÀüÃ¼ ¼±ÅÃ ÈÄ Ctrl + Enter ½ÇÇà
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
    update_date date default sysdate
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
    buy_status  varchar2(20) default '±¸¸Å¿Ï·á',
    buy_date    date default sysdate
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
    buy_status  varchar2(20) default '±¸¸Å¿Ï·á',
    buy_date    date default sysdate
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
    FOREIGN KEY (user_id)REFERENCES tbl_user(user_id),
    FOREIGN KEY (item_id) REFERENCES tbl_item(item_id),
    UNIQUE(item_id, user_id)
);
commit;


REM INSERTING into MEALKIT_DB.TBL_USER
SET DEFINE OFF;
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (1,'admin','°ü¸®ÀÚ','1234','admin@test.com','010-000-0000','12345','¼­¿ï½Ã','°ü¾Ç»êÂÊ',to_date('23/05/28','RR/MM/DD'),'a');
Insert into MEALKIT_DB.TBL_USER (UNO,USER_ID,USER_NAME,PWD,EMAIL,PHONE,POST_CODE,ADDR,ADDR2,REG_DATE,AUTH) values (2,'user','È¸¿ø','1234','user@test.com','010-000-0000','12345','¼ö¿ø½Ã','¼ö¿ø¿ªÀÎ±Ù',to_date('23/05/28','RR/MM/DD'),'m');


REM INSERTING into MEALKIT_DB.TBL_ITEM
SET DEFINE OFF;
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (1,'ÇÑ½Ä','±èÄ¡Âî°³',8000,'±èÄ¡Âî°³',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (2,'ÇÑ½Ä','´ß°¥ºñ',15000,'´ß°¥ºñ',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (3,'ÇÑ½Ä','µÈÀåÂî°³',8000,'µÈÀåÂî°³',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (4,'ÇÑ½Ä','¶±¸¸µÔ±¹',8500,'¶±¸¸µÔ±¹',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (5,'ÇÑ½Ä','ºÎ´ëÂî°³',9000,'ºÎ´ëÂî°³',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (6,'ÇÑ½Ä','¼ø´ëººÀ½',10000,'¼ø´ëººÀ½',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (7,'ÇÑ½Ä','¼øµÎºÎÂî°³',7500,'¼øµÎºÎÂî°³',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (8,'ÇÑ½Ä','ÂÞ²Ù¹Ì»ï°ã»ì',13000,'ÂÞ²Ù¹Ì»ï°ã»ì',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (9,'¾ç½Ä','°¨¹Ù½º',10000,'°¨¹Ù½º',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (10,'¾ç½Ä','±×¶óÅÁ',15000,'±×¶óÅÁ',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (11,'¾ç½Ä','¹ÙÁúÆÄ½ºÅ¸',8500,'¹ÙÁúÆÄ½ºÅ¸',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (12,'¾ç½Ä','¹ö¼¸Å©¸²¸®Á¶¶Ç',12000,'¹ö¼¸Å©¸²¸®Á¶¶Ç',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (13,'¾ç½Ä','ºü³×ÆÄ½ºÅ¸',21000,'ºü³×ÆÄ½ºÅ¸',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (14,'¾ç½Ä','¾Ë¸®¿À¿Ã¸®¿À',7000,'¾Ë¸®¿À¿Ã¸®¿À',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (15,'¾ç½Ä','Âý½ºÅ×ÀÌÅ©',17000,'Âý½ºÅ×ÀÌÅ©',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (16,'¾ç½Ä','Åä¸¶ÅäÆÄ½ºÅ¸',8500,'Åä¸¶ÅäÆÄ½ºÅ¸',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (17,'Áß½Ä','±ñ¼î»õ¿ì',13000,'±ñ¼î»õ¿ì',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (18,'Áß½Ä','´©·îÁöÅÁ',9000,'´©·îÁöÅÁ',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (19,'Áß½Ä','·¹¸óÅ©¸²»õ¿ì',17000,'·¹¸óÅ©¸²»õ¿ì',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (20,'Áß½Ä','¸¶¶ó¼§±Å',14000,'¸¶¶ó¼§±Å',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (21,'Áß½Ä','¸¶¶óÅÁ',15000,'¸¶¶óÅÁ',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (22,'Áß½Ä','¸¶ÆÄµÎºÎ',15000,'¸¶ÆÄµÎºÎ',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (23,'Áß½Ä','ÅÁ¼öÀ°',14000,'ÅÁ¼öÀ°',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (24,'Áß½Ä','ÆÈº¸Ã¤',13000,'ÆÈº¸Ã¤',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (25,'¾ß½Ä','³«°ö»õ',12000,'³«°ö»õ',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (26,'¾ß½Ä','³ÃÃ¤Á·¹ß',15000,'³ÃÃ¤Á·¹ß',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (27,'¾ß½Ä','´ß¹ß',10000,'´ß¹ß',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (28,'¾ß½Ä','ºÒÁ·¹ß',15000,'ºÒÁ·¹ß',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (29,'¾ß½Ä','¾ßÃ¤°öÃ¢',11000,'¾ßÃ¤°öÃ¢',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (30,'¾ß½Ä','¿Àµ­ÅÁ',6500,'¿Àµ­ÅÁ',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (31,'¾ß½Ä','¿Àµ¹»À',12000,'¿Àµ¹»À',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (32,'¾ß½Ä','Ä¡Å²',18000,'Ä¡Å²',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (33,'ºÐ½Ä','²¿¸¶±è¹ä',5500,'²¿¸¶±è¹ä',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (34,'ºÐ½Ä','³³ÀÛ¸¸µÎ',3000,'³³ÀÛ¸¸µÎ',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (35,'ºÐ½Ä','´ß°­Á¤',15000,'´ß°­Á¤',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (36,'ºÐ½Ä','¶±ººÀÌ',3500,'¶±ººÀÌ',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (37,'ºÐ½Ä','·ÎÁ¦¶±ººÀÌ',4000,'·ÎÁ¦¶±ººÀÌ',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (38,'ºÐ½Ä','¸ðµëÆ¢±è',6000,'¸ðµëÆ¢±è',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (39,'ºÐ½Ä','Â÷µ¹¿ìµ¿',10000,'Â÷µ¹¿ìµ¿',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (40,'ºÐ½Ä','ÇÖµµ±×',3500,'ÇÖµµ±×',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (41,'±âÅ¸','°úÀÏ»ø·¯µå',6500,'°úÀÏ»ø·¯µå',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (42,'±âÅ¸','´ß°¡½¿»ì»ø·¯µå',7500,'´ß°¡½¿»ì»ø·¯µå',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (43,'±âÅ¸','¹Ì°í·©',8500,'¹Ì°í·©',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (44,'±âÅ¸','¹ÐÇ£À¯³ªº£',19000,'¹ÐÇ£À¯³ªº£',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (45,'±âÅ¸','½Ò±¹¼ö',6500,'½Ò±¹¼ö',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (46,'±âÅ¸','Àå¾îµ¤¹ä',16000,'Àå¾îµ¤¹ä',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (47,'±âÅ¸','ÂüÄ¡»ø·¯µå',5000,'ÂüÄ¡»ø·¯µå',100,0,to_date('23/05/28','RR/MM/DD'));
Insert into MEALKIT_DB.TBL_ITEM (ITEM_ID,CATEGORY,ITEM_NAME,ITEM_PRICE,DESCRIPTION,ITEM_STOCK,ITEM_SOLD,UPDATE_DATE) values (48,'±âÅ¸','Ä¡Å²»ø·¯µå',8000,'Ä¡Å²»ø·¯µå',100,0,to_date('23/05/28','RR/MM/DD'));


REM INSERTING into MEALKIT_DB.TBL_FILE_ITEM
SET DEFINE OFF;
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('1','±èÄ¡Âî°³.jpeg','1','1b6e8006-3c0d-464e-957c-8d45ca70f6c8','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('2','´ß°¥ºñ.jpg','1','facc0d0b-43e6-445d-b646-5bc97c7bcd96','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('3','µÈÀåÂî°³.jpeg','1','ab52c4d6-b6a0-40f5-8045-6f91d123b0ae','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('4','¶±¸¸µÔ±¹.jpg','1','10ce26f4-bf93-4145-9724-3f7487a2f465','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('5','ºÎ´ëÂî°³.jpeg','1','b59ad6e1-536f-4ff9-8ec8-476e53bdb0e5','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('6','¼ø´ëººÀ½.jpg','1','82cce59c-aa02-4a5f-8532-a8f893fbfebd','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('7','¼øµÎºÎÂî°³.jpeg','1','3bb2415e-441f-4ac8-898a-cfc9c3d06210','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('8','ÂÞ²Ù¹Ì»ï°ã»ì.jpg','1','9a7db586-df59-4527-a818-b2d2ad77b62e','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('9','°¨¹Ù½º.jpg','1','220998ed-9f44-4816-9dfa-697784bb0c6b','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('10','±×¶óÅÁ.jpg','1','5c95eed8-a86c-4f09-ab7b-ede50c04c9bb','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('11','¹ÙÁúÆÄ½ºÅ¸.jpg','1','61274d78-0d86-461f-8162-c599632b1e79','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('12','¹ö¼¸Å©¸²¸®Á¶¶Ç.jpg','1','5326069a-8583-4865-a973-ef966e05fd99','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('13','ºü³×ÆÄ½ºÅ¸.jpg','1','88ac9c22-8ce2-430b-8be2-58669a4ec0ab','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('14','¾Ë¸®¿À¿Ã¸®¿À.jpg','1','78c82152-5035-45fc-bc1a-73bb0963e0ae','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('15','Âý½ºÅ×ÀÌÅ©.jpg','1','26866e65-1b30-4e5c-a18b-7872a1517d80','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('16','Åä¸¶ÅäÆÄ½ºÅ¸.jpg','1','fa344042-9bc8-4eea-b29d-6f38f57b817c','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('17','±ñ¼î»õ¿ì.jpg','1','a0144371-167d-467f-b8e8-6f4730dfae8c','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('18','´©·îÁöÅÁ.jpg','1','8d1da9f3-05e4-4cc1-adbc-633fbdbab33e','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('19','·¹¸óÅ©¸²»õ¿ì.jpg','1','800ea7dc-986b-4829-ab9b-fce49d3997db','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('20','¸¶¶ó¼§±Å.jpg','1','207287a7-1865-4d90-b522-a8553d36a033','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('21','¸¶¶óÅÁ.jpg','1','439b0b86-53da-4da8-a367-0299f13b724b','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('22','¸¶ÆÄµÎºÎ.jpg','1','0a37e6c3-6a86-44b4-b376-69c7b77b2d5b','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('23','ÅÁ¼öÀ°.jpg','1','fa7abbe0-7655-4fa0-9510-cdb737d2034d','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('24','ÆÈº¸Ã¤.jpg','1','4e5c8008-56e7-4db6-8c66-40d75e83097b','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('25','³«°ö»õ.jpg','1','0526b22e-d0d0-4d4a-b0bc-4c2ec1fc00f8','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('26','³ÃÃ¤Á·¹ß.png','1','600ab00d-51de-46a2-9ea0-4dcddeb23fe3','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('27','´ß¹ß.jpg','1','212d7017-7581-4cf0-a3bb-c63dbefaf7b1','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('28','ºÒÁ·¹ß.jpg','1','923f497b-41a6-4794-8e3d-1f464fd4ad63','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('29','¾ßÃ¤°öÃ¢.jpg','1','2c547e60-9e32-430d-a5c0-973e20cb79da','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('30','¿Àµ­ÅÁ.jpg','1','f131110b-b6a9-45b5-9581-ba5401fd477b','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('31','¿Àµ¹»À.jpg','1','5918e3a8-d9fd-481a-814c-014c9d82fa68','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('32','Ä¡Å².jpg','1','8d1e98c1-bfb5-4f6d-ab33-6d0d0cf6aa27','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('33','²¿¸¶±è¹ä.jpg','1','9b07a216-b578-4f7f-9b0b-ed12c45361ed','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('34','³³ÀÛ¸¸µÎ.jpg','1','644071ac-ef29-4c57-a32a-3e36983c3e95','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('35','´ß°­Á¤.jpg','1','0fd88474-07b6-48c0-b189-b9b96ecd3c8e','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('36','¶±ººÀÌ.png','1','6a9aea15-3476-445a-8d21-cc3d8e784233','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('37','·ÎÁ¦¶±ººÀÌ.jpg','1','1afc405c-eff1-47be-b616-09e15b95a6d4','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('38','¸ðµëÆ¢±è.jpg','1','1f1af772-0ec0-4a4c-9305-3e4a2df2ee2d','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('39','Â÷µ¹¿ìµ¿.jpg','1','d830dcdc-232c-4f28-82f6-57db582740ac','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('40','ÇÖµµ±×.jpg','1','0091576c-0bfc-4e34-8cd7-670b9b387fea','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('41','°úÀÏ»ø·¯µå.jpeg','1','173574ab-9c43-4977-b826-b59db688ac0f','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('42','´ß°¡½¿»ì»ø·¯µå.jpeg','1','ae1b4a92-af5f-403e-a084-582fd7b11fa6','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('43','¹Ì°í·©.jpg','1','72312368-3181-410a-ba01-205f9a6f5e4e','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('44','¹ÐÇ£À¯³ªº£.jpg','1','38593eea-c9f7-4c74-b0f0-2104c7a86eb5','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('45','½Ò±¹¼ö.jpg','1','0ee23854-d405-46b5-a7b5-b7b88aa33da1','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('46','Àå¾îµ¤¹ä.jpg','1','2427f2af-abac-4bce-a91c-6bfed59da6da','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('47','ÂüÄ¡»ø·¯µå.jpeg','1','fa57a75e-9c1c-4cb8-9a02-011845389c0e','2023\05\28');
Insert into MEALKIT_DB.TBL_FILE_ITEM (FID,FILENAME,IMAGE,UUID,UPLOADPATH) values ('48','Ä¡Å²»ø·¯µå.jpeg','1','87391cf2-ddb0-4fe2-8415-cab93ef0cc31','2023\05\28');

commit;