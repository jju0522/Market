drop table board;
CREATE TABLE board (
       num number not null,
       id varchar2(20) not null,
       name varchar2(20) not null,
       subject varchar2(200) not null,
       content varchar2(1000) not null,
       regist_day varchar(50),
       hit number,
       ip varchar(50),
       PRIMARY KEY (num)
);

select * from BOARD;
