CREATE TABLE `book` (
	`booknumber`	int	NOT NULL,
	`bookname`	varchar(100)	NULL,
	`authos`	varchar(50)	NULL,
	`bookStats`	int	NULL,
	`classname`	varchar(50)	NULL
);

CREATE TABLE `cheakoutStatus` (
	`id`	int	NOT NULL,
	`booknumber`	int	NOT NULL,
	`userid`	varchar(20)	NOT NULL,
	`rentedat`	DATETIME	NULL,
	`returnat`	DATETIME	NULL
);

CREATE TABLE `user` (
	`userid`	varchar(20)	NOT NULL,
	`id`	varchar(20)	NOT NULL,
	`email`	varchar(50)	NOT NULL,
	`password`	varchar(20)	NOT NULL,
	`phonenumber`	varchar(20)	NOT NULL
);

ALTER TABLE `book` ADD CONSTRAINT `PK_BOOK` PRIMARY KEY (
	`booknumber`
);

ALTER TABLE `cheakoutStatus` ADD CONSTRAINT `PK_CHEAKOUTSTATUS` PRIMARY KEY (
	`id`,
	`booknumber`,
	`userid`
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`userid`
);

ALTER TABLE `cheakoutStatus` ADD CONSTRAINT `FK_book_TO_cheakoutStatus_1` FOREIGN KEY (
	`booknumber`
)
REFERENCES `book` (
	`booknumber`
);

ALTER TABLE `cheakoutStatus` ADD CONSTRAINT `FK_user_TO_cheakoutStatus_1` FOREIGN KEY (
	`userid`
)
REFERENCES `user` (
	`userid`
);

