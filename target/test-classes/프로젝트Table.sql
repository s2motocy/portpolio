-- ���� :    ��ǰ / ȸ�� / ���� / ���� / ��� / ��ٱ��� / ������


-------------------------------------------------------------------------------- ��ǰ (item)

-- ��ǰ(item) ��  ������ ����
create sequence seq_item;
-- ��ǰ ���̺� ����
create table item (
    itemid number(10) not null primary key,     -- ��ȣ
    category varchar(10) not null,              -- �з�
    name varchar(30) not null,                  -- ��ǰ �̸�
    price number(10) not null,                  -- ��ǰ ����
    description varchar(1000) not null,         -- ��ǰ ����
    update_date date default sysdate            -- ������
);

-- ��ǰ �̹��� �� ������ ����
create sequence seq_file_item;
-- ��ǰ �̹��� ���
create table tbl_file_item(
fid varchar(50) not null primary key,           -- ��ȣ
fileName varchar(50) not null,                  -- ���� �̸�
image char(1) default 'I',                      -- �̹��� ����
uuid varchar(50) not null,                      -- UUID
uploadPath varchar(50) not null                 -- ���� ���
);

-- drop item
drop sequence seq_item;
drop table item;
-- drop file
drop sequence seq_file_item;
drop table tbl_file_item;

-- Ŀ��
commit;

-- ��ȸ
select * from item;
select * from tbl_file_item;


-------------------------------------------------------------------------------- ȸ�� (member)

-- ȸ��(member) �� ������ ����
create SEQUENCE seq_members;
-- ȸ��(member) ���̺� ����
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

-- Ŀ��
commit;

-- ��ȸ
select * from members;


-------------------------------------------------------------------------------- ���� (inquiry)

-- ���� �� ������ ����
create sequence seq_inquiry;
-- ���� ���̺� ����
CREATE TABLE tbl_inquiry (
  qno NUMBER(10) NOT NULL PRIMARY KEY,
  title VARCHAR2(100) NOT NULL,
  content VARCHAR2(100) NOT NULL,
  wrtier VARCHAR2(100) NOT NULL,
  register_date DATE NOT NULL,
  update_date DATE DEFAULT SYSDATE,
  reply_cnt NUMBER(10)
);

-- Ŀ��
commit;

-- ��ȸ
select * from tbl_inquiry;

-------------------------------------------------------------------------------- ��� (delivery)

-- ���(delivery)�� ������ ����
create sequence seq_delivery;
-- ���(delivery) ���̺� ����
create table delivery(
dno number(10) not null primary key,  -- ������
delivery_no number not null,  --�ֹ���ȣ
member_id varchar2(30) not null,  -- �ֹ��ھ��̵�
item varchar(30) not null,  -- �ֹ���ǰ
delivery varchar(20),  -- �ֹ�����
delivery_date date not null, -- �ֹ��� ��¥
price number,
member_no number(10) not null
);

-- Ŀ��
commit;

-- ��ȸ
select * from delivery;


-------------------------------------------------------------------------------- ��ٱ��� (cart)

-- ��ٱ���(cart) �� ������ ����
create sequence seq_cart;
-- ��ٱ���(cart) ���̺� ����
create table cart (
    cart_id number(30) not null primary key,
    member_id number(30),
    item_id number(30),
    item_name varchar2(50),
    amount number(10),
    price number(10),
    item_img varchar2(100)
);

-- Ŀ��
commit;

-- ��ȸ
select * from cart;

