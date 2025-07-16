-- 안녕하세요! 새로운 DDL(SQL) 파일입니다.
-- 여기에 테이블, 인덱스, 뷰 등 DDL 구문을 작성하세요.

-- 예시: 테이블 생성
-- CREATE TABLE example_table (
--     id INT PRIMARY KEY,
--     name VARCHAR(100) NOT NULL
-- );



DROP TABLE IF EXISTS `files`;

CREATE TABLE `files` (
	`file_no`	INT	NOT NULL	DEFAULT AUTO_INCREMENT	COMMENT '파일번호',
	`parent_no`	INT	NOT NULL	COMMENT '부모테이블번호',
	`parent_table`	VARCHAR(100)	NOT NULL	COMMENT '부모테이블명',
	`file_name`	VARCHAR(100)	NOT NULL	COMMENT '파일명',
	`file_path`	VARCHAR(100)	NOT NULL	COMMENT '파일경로',
	`file_size`	LONG	NULL	COMMENT '파일사이즈',
	`file_code`	VARCHAR(50)	NULL	COMMENT '파일코드',
	`file_reg_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`file_upd_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '수정일자'
);

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
	`product_id`	VARCHAR(255)	NOT NULL	DEFAULT AUTO_INCREMENT	COMMENT '상품아이디',
	`product_name`	VARCHAR(255)	NOT NULL	COMMENT '상품명',
	`description`	VARCHAR(255)	NULL	COMMENT '상품설명',
	`product_price`	VARCHAR(255)	NOT NULL	COMMENT '상품가격',
	`stock_quantity`	VARCHAR(255)	NOT NULL	COMMENT '상품 재고',
	`product_created`	VARCHAR(255)	NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '상품등록일자',
	`product_updated`	VARCHAR(255)	NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '상품수정일자'
);

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
	`order_no`	VARCHAR(255)	NOT NULL	DEFAULT AUTO_INCREMENT	COMMENT '주문번호',
	`user_no`	VARCHAR(255)	NOT NULL	COMMENT '회원번호',
	`user_id`	VARCHAR(255)	NOT NULL	COMMENT '회원아이디',
	`order_quantity`	VARCHAR(255)	NOT NULL	COMMENT '주문수량',
	`t_price`	VARCHAR(255)	NOT NULL	COMMENT '주문 총 금액',
	`Field`	VARCHAR(255)	NULL
);

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
	`no`	INT	NOT NULL	DEFAULT AUTO_INCREMENT	COMMENT '게시글 번호',
	`title`	VARCHAR(255)	NOT NULL	COMMENT '게시글 제목',
	`writer`	VARCHAR(100)	NOT NULL	COMMENT '게시글 작성자',
	`content`	VARCHAR(1000)	NOT NULL	COMMENT '게시글 내용',
	`board_type`	VARCHAR(20)	NOT NULL	COMMENT '게시판 타입(notice, board)',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '게시글 등록알저',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '게시글 수정일자'
);

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
	`user_no`	VARCHAR(255)	NOT NULL	COMMENT '회원번호',
	`user_id`	VARCHAR(255)	NOT NULL	COMMENT '회원아이디',
	`password`	VARCHAR(255)	NOT NULL	COMMENT '비밀번호',
	`user_name`	VARCHAR(255)	NOT NULL	COMMENT '회원명',
	`user_email`	VARCHAR(255)	NULL	COMMENT '회원이메일',
	`user_created`	VARCHAR(255)	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '회원등록일자',
	`user_updated`	VARCHAR(255)	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '회원수정일자'
);

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
	`product_id`	VARCHAR(255)	NOT NULL	DEFAULT AUTO_INCREMENT	COMMENT '상품아이디',
	`product_name`	VARCHAR(255)	NOT NULL	COMMENT '상품명',
	`amount`	VARCHAR(255)	NOT NULL	COMMENT '수량',
	`price_all`	VARCHAR(255)	NOT NULL	COMMENT '상품의 총 구매금액'
);

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
	`order_no`	VARCHAR(255)	NOT NULL	DEFAULT AUTO_INCREMENT	COMMENT '주문번호',
	`user_no`	VARCHAR(255)	NOT NULL	COMMENT '회원번호',
	`user_id`	VARCHAR(255)	NOT NULL	COMMENT '회원아이디',
	`order_date`	VARCHAR(255)	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '주문일',
	`order_status`	VARCHAR(255)	NOT NULL	COMMENT '주문상태'
);

ALTER TABLE `files` ADD CONSTRAINT `PK_FILES` PRIMARY KEY (
	`file_no`
);

ALTER TABLE `product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`product_id`
);

ALTER TABLE `orderitem` ADD CONSTRAINT `PK_ORDERITEM` PRIMARY KEY (
	`order_no`,
	`user_no`,
	`user_id`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`no`
);

ALTER TABLE `users` ADD CONSTRAINT `PK_USERS` PRIMARY KEY (
	`user_no`,
	`user_id`
);

ALTER TABLE `carts` ADD CONSTRAINT `PK_CARTS` PRIMARY KEY (
	`product_id`
);

ALTER TABLE `order` ADD CONSTRAINT `PK_ORDER` PRIMARY KEY (
	`order_no`,
	`user_no`,
	`user_id`
);

ALTER TABLE `orderitem` ADD CONSTRAINT `FK_order_TO_orderitem_1` FOREIGN KEY (
	`order_no`
)
REFERENCES `order` (
	`order_no`
);

ALTER TABLE `orderitem` ADD CONSTRAINT `FK_order_TO_orderitem_2` FOREIGN KEY (
	`user_no`
)
REFERENCES `order` (
	`user_no`
);

ALTER TABLE `orderitem` ADD CONSTRAINT `FK_order_TO_orderitem_3` FOREIGN KEY (
	`user_id`
)
REFERENCES `order` (
	`user_id`
);

ALTER TABLE `carts` ADD CONSTRAINT `FK_product_TO_carts_1` FOREIGN KEY (
	`product_id`
)
REFERENCES `product` (
	`product_id`
);

ALTER TABLE `order` ADD CONSTRAINT `FK_users_TO_order_1` FOREIGN KEY (
	`user_no`
)
REFERENCES `users` (
	`user_no`
);

ALTER TABLE `order` ADD CONSTRAINT `FK_users_TO_order_2` FOREIGN KEY (
	`user_id`
)
REFERENCES `users` (
	`user_id`
);

