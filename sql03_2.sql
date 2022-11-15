
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

CREATE TABLE USER(id VARCHAR(30) PRIMARY key, pw VARCHAR(500) NOT null, name VARCHAR(50) NOT null, tel VARCHAR(30), email VARCHAR(50), addr VARCHAR(100), birth DATE, regdate DATETIME DEFAULT NOW(), pt INT DEFAULT 0, visited INT DEFAULT 0, grade VARCHAR(50) DEFAULT "F");

SELECT * FROM notice;

SELECT * FROM user;

COMMIT;

INSERT INTO user(id, pw, name, tel, email, addr, birth) VALUES("test", "1234", "테스트", "010-1111-2222", "test@naver.com", "경기도 고양시 일산서구 대화동 123-456", "1993-01-01");
INSERT INTO user(id, pw, name, tel, email, addr, birth) VALUES("admin", "1234", "관리자", "010-3333-2222", "admin@naver.com", "경기도 고양시 일산서구 장항동 678-987", "1993-12-12");

CREATE TABLE pic(no INT PRIMARY KEY AUTO_INCREMENT, tourno VARCHAR(20), picname VARCHAR(150), pos INT DEFAULT 1);
CREATE TABLE tour(no INT PRIMARY KEY AUTO_INCREMENT, tourno VARCHAR(20), cate VARCHAR(20), place VARCHAR(100), commet1 VARCHAR(1000), comment2 VARCHAR(1000));

SELECT * FROM pic;
SELECT * FROM tour;

COMMIT;
