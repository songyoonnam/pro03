
INSERT INTO test VALUES("김기태",100);
INSERT INTO test VALUES("김도연",80);

SELECT * FROM test;



CREATE TABLE notice(
	no INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200),
	content VARCHAR(1000),
	regdate DATETIME DEFAULT NOW(),
	visited INT DEFAULT 0
);

DESC notice;

INSERT INTO notice(title, content);

CREATE TABLE USER(id VARCHAR(30) PRIMARY key, pw VARCHAR(500) NOT null, name VARCHAR(50) NOT null, tel VARCHAR(30), addr VARCHAR (100), regdate DATETIME DEFAULT NOW(), pt INT DEFAULT 0, visited INT DEFAULT 0);

SELECT * FROM notice;

SELECT * FROM user;

COMMIT;

INSERT INTO user(id, pw, name, tel, addr) VALUES("test1", "1234", "테스트", "010-1111-2222", "경기도 고양시 일산서구 대화동 123-456");
INSERT INTO user(id, pw, name, tel, addr) VALUES("admin", "1234", "관리자", "010-3333-2222", "경기도 고양시 일산서구 장항동 678-987");

