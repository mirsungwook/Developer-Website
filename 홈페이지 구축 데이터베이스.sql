CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `project` ;

-- -----------------------------------------------------
-- Table `project`.`college`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`college` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `department` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`member` (
  `id` VARCHAR(15) NOT NULL,
  `passwords` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(10) NOT NULL,
  `department` VARCHAR(255) NULL DEFAULT NULL,
  `major` VARCHAR(40) NOT NULL,
  `phone` VARCHAR(30) NOT NULL,
  `member_pk` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`member_pk`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `member_pk_UNIQUE` (`member_pk` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`product` (
  `product_name` VARCHAR(50) NOT NULL,
  `cost` INT NOT NULL,
  `product_code` VARCHAR(50) NOT NULL,
  `summary` TEXT NULL DEFAULT NULL,
  `product_pk` INT NOT NULL AUTO_INCREMENT,
  `product_image` LONGBLOB NULL DEFAULT NULL,
  `product_text` TEXT NULL DEFAULT NULL,
  `seller` varchar(15) NOT NULL,
  PRIMARY KEY (`product_pk`),
  UNIQUE INDEX `product_pk_UNIQUE` (`product_pk` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`comment` (
  `comment_pk` INT NOT NULL AUTO_INCREMENT,
  `comments` TEXT NOT NULL,
  `reg_date` TIMESTAMP NOT NULL,
  `product_product_pk` INT NOT NULL,
  `member_member_pk` INT NOT NULL,
  PRIMARY KEY (`comment_pk`),
  UNIQUE INDEX `comment_pk_UNIQUE` (`comment_pk` ASC) VISIBLE,
  INDEX `fk_comment_product1_idx` (`product_product_pk` ASC) VISIBLE,
  INDEX `fk_comment_member1_idx` (`member_member_pk` ASC) VISIBLE,
  CONSTRAINT `fk_comment_member1`
    FOREIGN KEY (`member_member_pk`)
    REFERENCES `project`.`member` (`member_pk`),
  CONSTRAINT `fk_comment_product1`
    FOREIGN KEY (`product_product_pk`)
    REFERENCES `project`.`product` (`product_pk`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`major`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`major` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `major` VARCHAR(255) NOT NULL,
  `college_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `college_id` (`college_id` ASC) VISIBLE,
  CONSTRAINT `major_ibfk_1`
    FOREIGN KEY (`college_id`)
    REFERENCES `project`.`college` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 262
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



-- -----------------------------------------------------
-- Table `project`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`room` (
  `room_pk` INT NOT NULL AUTO_INCREMENT,
  `room_name` VARCHAR(255) NOT NULL,
  `room_site` VARCHAR(255) NULL DEFAULT NULL,
  `room_cost` INT NOT NULL,
  `room_image` LONGBLOB NULL DEFAULT NULL,
  `room_text` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`room_pk`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`share`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`share` (
  `share_pk` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(255) NULL DEFAULT NULL,
  `product_code` VARCHAR(255) NOT NULL,
  `product_image` LONGBLOB NULL DEFAULT NULL,
  `product_text` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`share_pk`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;








use project;

INSERT INTO college (department) VALUES 
('디자인대학'),
('인문사회융합대학'), 
('과학기술대학'),
('의료생명대학'),
('의과대학');

select * from college;


UPDATE college 
SET id = 1
WHERE id = 66;

UPDATE college 
SET id = 2
WHERE id = 67;

UPDATE college 

SET id = 3
WHERE id = 68;

UPDATE college 

SET id = 4
WHERE id = 69;

UPDATE college 

SET id = 5
WHERE id = 70;
-- id에 번호 초기화 ?

INSERT INTO major (major, college_id) VALUES 
('산업디자인학과', 1), 
('실내디자인학과', 1), 
('패션디자인학과', 1), 
('시각영상디자인학과', 1),
('미디어콘텐츠학과', 1),
('조형예술학과', 1),
('경영학과', 2), 
('경제통상학과', 2), 
('경찰학과', 2),
('소방방재융합학과', 2),
('문헌정보학과', 2),
('유아교육과', 2),
('사회복지학과', 2),
('신문방송학과', 2),
('동화_한국어문화학과', 2),
('영어문화학과', 2),
('메카트로닉스공학과', 3),
('컴퓨터공학과', 3),
('바이오메디컬공학과', 3),
('녹색기술융합학과', 3),
('에너지신소재공학과', 3),
('간호학과', 4),
('바이오의약학과', 4),
('생명공학과', 4),
('식품영양학과', 4),
('뷰티화장품학과', 4),
('스포츠건강학과', 4),
('골프산업학과', 4),
('의예과', 5);

select * from major;

use project;

CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender VARCHAR(50),
    receiver VARCHAR(50),
    message TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



select * from product;
DELETE FROM member;




