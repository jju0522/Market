DROP TABLE PRODUCT;
CREATE TABLE PRODUCT (
    p_id VARCHAR2(10) NOT NULL,
    p_name VARCHAR(50),
    p_unitPrice INTEGER,
    p_description CLOB,
    p_unitsInStock NUMBER,
    p_condition VARCHAR(20),
    p_fileName VARCHAR(20),
    PRIMARY KEY (p_id)
);

SELECT * FROM product;

DROP TABLE member;
CREATE TABLE member (
	id VARCHAR(10) NOT NULL,		-- 회원 아이디
    password VARCHAR(10) NOT NULL,	-- 비밀번호
    name VARCHAR(10) NOT NULL,		-- 이름
    nickname VARCHAR(10) NOT NULL,	-- 닉네임
    mail VARCHAR(30) NOT NULL,		-- 메일
    phone VARCHAR(20) NOT NULL,		-- 전화번호
    regist_day VARCHAR(50),        -- 가입 일자
    
    PRIMARY KEY (id)               -- 회원 아이디를 고유 키로 설정
);

SELECT * FROM member;
