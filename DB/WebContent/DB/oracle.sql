CREATE TABLE usr(
  kind varchar2(10) DEFAULT NULL,
  id varchar2(32) NOT NULL,
  pw varchar2(32) NOT NULL,
  name varchar2(32) DEFAULT NULL,
  phone varchar2(128) DEFAULT NULL,
  email varchar2(32) DEFAULT NULL,
  major varchar2(32) DEFAULT NULL,
  score number(11) DEFAULT 0,
  PRIMARY KEY (id)
);

insert into usr values('admin','admin','admin','°ü¸®ÀÚ','000-0000-0000','0000@0000','admin',0);

CREATE TABLE board (
  NUM number(32) NOT NULL,
  SUBJECT varchar2(250) NOT NULL,
  WRITER varchar2(50) NOT NULL,
  CONTENTS varchar2(900),
  HIT number(32) DEFAULT NULL,
  IP varchar2(30) NOT NULL,
  REG_DATE DATE NOT NULL,
  MOD_DATE DATE,
  PRIMARY KEY(NUM)
);

CREATE SEQUENCE N_board START WITH 1 INCREMENT BY 1;


CREATE TABLE free_review (
  NUM number(11) NOT NULL,
  board_num number(11) NOT NULL,
  content varchar2(512) NOT NULL,
  id varchar2(32) NOT NULL,
  reg_date DATE DEFAULT NULL,
  PRIMARY KEY (NUM)
);

CREATE SEQUENCE N_freview START WITH 1 INCREMENT BY 1;


CREATE TABLE mboard (
  NUM number(11) NOT NULL,
  SUBJECT varchar2(250) NOT NULL,
  WRITER varchar2(50) NOT NULL,
  CONTENTS varchar2(900),
  HIT number(11) DEFAULT NULL,
  IP varchar2(30) NOT NULL,
  REG_DATE date DEFAULT NULL,
  MOD_DATE date DEFAULT NULL,
  major varchar2(32) DEFAULT NULL,
  PRIMARY KEY (NUM)
);

CREATE SEQUENCE N_mboard START WITH 1 INCREMENT BY 1;

CREATE TABLE mreview (
  NUM number(11) NOT NULL,
  board_num number(11) DEFAULT NULL,
  content varchar2(512) DEFAULT NULL,
  id varchar2(32) DEFAULT NULL,
  reg_date date DEFAULT NULL,
  PRIMARY KEY (NUM)
);

CREATE SEQUENCE N_mreview START WITH 1 INCREMENT BY 1;


CREATE TABLE chat (
  mid varchar2(32) DEFAULT NULL,
  usrid varchar2(32) DEFAULT NULL,
  contents varchar2(1024) DEFAULT NULL,
  reg_date date DEFAULT NULL,
  push number(11) DEFAULT NULL
);

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PROJECT" , "1234");