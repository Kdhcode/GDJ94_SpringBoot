use user01;
show TABLE STATUS;

CREATE TABLE notice (
  board_num BIGINT AUTO_INCREMENT,
  board_writer VARCHAR(255) NOT NULL,
  board_title VARCHAR(255) NOT NULL,
  board_contents LONGTEXT NOT NULL,
  board_date DATE NOT NULL,
  board_hit BIGINT DEFAULT 0,
  PRIMARY KEY (board_num)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE qna (
  board_num BIGINT AUTO_INCREMENT,
  board_writer VARCHAR(255) NOT NULL,
  board_title VARCHAR(255) NOT NULL,
  board_contents LONGTEXT NOT NULL,
  board_date DATE NOT NULL,
  board_hit BIGINT DEFAULT 0,
  board_ref BIGINT DEFAULT 0,
  board_step BIGINT DEFAULT 0,
  board_depth BIGINT DEFAULT 0,
  PRIMARY KEY (board_num)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE notice_files (
  file_num BIGINT NOT NULL AUTO_INCREMENT,
  file_name VARCHAR(255) NOT NULL,
  file_origin VARCHAR(255) NOT NULL,
  board_num BIGINT NULL,
  PRIMARY KEY (file_num),
  INDEX board_num_idx (board_num ASC) VISIBLE,
  CONSTRAINT board_num
    FOREIGN KEY (board_num)
    REFERENCES notice (board_num)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
CREATE TABLE qna_files (
  file_num BIGINT NOT NULL AUTO_INCREMENT,
  file_name VARCHAR(255) NOT NULL,
  file_origin VARCHAR(255) NOT NULL,
  board_num BIGINT NULL,
  PRIMARY KEY (file_num),
  INDEX board_num_idx (board_num ASC) VISIBLE,
    FOREIGN KEY (board_num)
    REFERENCES qna (board_num)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

Create Table users(
	username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(255),
    birth VARCHAR(255),
    PRIMARY KEY (username));

CREATE TABLE profile (
    file_num BIGINT NOT NULL AUTO_INCREMENT,
    file_name VARCHAR(255),
    file_origin VARCHAR(255),
    username VARCHAR(255) NOT NULL,
    PRIMARY KEY (file_num),
    FOREIGN KEY (username)
        REFERENCES users(username)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE products (
  product_num      BIGINT NOT NULL AUTO_INCREMENT,
  product_name     VARCHAR(255) NOT NULL,
  product_contents LONGTEXT NOT NULL,
  product_category VARCHAR(255) NOT NULL,
  product_rate     DECIMAL(4,2) NOT NULL DEFAULT 0.00,
  product_sale     TINYINT(1) NOT NULL DEFAULT 0,
  created_at       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (product_num)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE comment (
board_num BIGINT NOT NULL AUTO_INCREMENT,
board_contents VARCHAR(255),
board_date DATE NOT NULL,
product_num BIGINT,
username VARCHAR(255) NOT NULL,
PRIMARY KEY (board_num),
FOREIGN KEY (username)
        REFERENCES users(username)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
FOREIGN KEY (product_num)
        REFERENCES products(product_num)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

commit;

SELECT * from notice;
SELECT * from qna;
SELECT * from notice_files;
SELECT * from qna_files;
SELECT * from users;
SELECT * from profile;
SELECT * from products;
SELECT * from comment;

DESC comment;

DELETE FROM users where username = "qwe";
INSERT INTO users VALUES
	("test", "test", "test", "test123@asd.kr", "010-1234-1234","2002-02-02");
SELECT *
FROM users u
LEFT JOIN profile p ON p.username = u.username
WHERE u.username = 'test';

INSERT INTO notice VALUES
	(NULL, "user01", "title01", "contents01", CURDATE(), 0),
	(NULL, "user02", "title02", "contents02", CURDATE(), 0);

UPDATE notice set
	board_title = "user03", board_contents = "title03"
    where board_num = 1;

INSERT INTO qna VALUES
	(NULL, "user01", "title01", "contents01", CURDATE(), 0, 0, 0, 0),
	(NULL, "user02", "title02", "contents02", CURDATE(), 0, 0, 0, 0);

INSERT into qna_files 
VALUES(null, "abc", "abc", 13);

INSERT INTO comment VALUES
	(NULL, "contents01", CURDATE(), 1,"test"),
	(NULL, "contents02", CURDATE(), 1,"test");

SELECT * 
from notice n
LEFT JOIN notice_files nf on nf.board_num = n.board_num
WHERE n.board_num = 136;

SELECT * 
from notice n
LEFT JOIN notice_files nf 
USING(board_num)
WHERE n.board_num = 136;

SELECT * 
from notice n
NATURAL JOIN notice_files nf
WHERE n.board_num = 141;
DESC profile;

SELECT * 
from users u
LEFT JOIN profile p ON p.username = u.username
where u.username = "test";

INSERT INTO profile VALUE(null, "test","test","test");