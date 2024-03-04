DROP TABLE board;
CREATE TABLE board (
	num NUMBER NOT NULL, -- 게시글 순번
	id VARCHAR2(20) NOT NULL,          -- 회원 아이디
	name VARCHAR2(20) NOT NULL,        -- 회원 이름
	subject VARCHAR2(200) NOT NULL,    -- 게시글 제목
	content VARCHAR2(1000) NOT NULL,             -- 게시글 내용
	regist_day TIMESTAMP,              -- 게시글 등록 일자
	hit NUMBER(10),                    -- 게시글 조회 수
	ip VARCHAR2(40),                   -- 게시글 등록 시 IP
	PRIMARY KEY (num)                  -- 게시글 순번을 고유 키로 설정
);

SELECT * FROM BOARD;

-- 테이블 구조 조회
SELECT *
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = 'BOARD';

-- 시퀀스 생성
DROP SEQUENCE num_seq;
CREATE SEQUENCE num_seq START WITH 1 INCREMENT BY 1;

-- 시퀀스 조회
SELECT num_seq.NEXTVAL FROM dual;

-- 새로운 레코드를 삽입할 때 시퀀스의 NEXTVAL 값을 사용
INSERT INTO board (num, id, name, subject, content, regist_day, hit, ip)
VALUES (board_sequence.NEXTVAL, '사용자ID', '사용자이름', '제목', '내용', SYSTIMESTAMP, 0, 'IP주소');
