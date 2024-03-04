
--트리거 미사용
insert into board values(num_seq.nextval, ?, ?, ?, ?, ?, ?, ?)

INSERT INTO BOARD VALUES(NUM_SEQ.NEXTVAL, 111, 111, 111, 111, null, null, null)
select * from BOARD

--트리거 사용
insert into board values(                 ?, ?, ?, ?, ?, ?, ?)

select * from MEMBER