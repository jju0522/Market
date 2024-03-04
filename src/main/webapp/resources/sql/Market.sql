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

INSERT INTO product VALUES('P1', '상품1', 10000, '미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을'
                                , 2, 'old', 'P1234.png');
INSERT INTO product VALUES('P2', '상품2', 20000, '이성은 투명하되 얼음과 같으며 지혜는 날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고',
                            1, 'new', 'P1235.png');
INSERT INTO product VALUES('P3', '상품3', 15000, '뿐이다 낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써',
                            3, 'new', 'P1236.png');
INSERT INTO product VALUES('P4', '상품4', 5000, '뿐이다 낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써',
                            5, 'old', 'P1236.png');