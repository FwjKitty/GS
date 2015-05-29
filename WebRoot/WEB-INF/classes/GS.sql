/*������ݿ�MS*/
create database GS;

/*������ݱ�USER*/
CREATE TABLE `user` (
`un` varchar(30) PRIMARY KEY,
`pw` varchar(308) NOT NULL,
`head` varchar(255) NULL,
`name` varchar(25) NULL,
`contact` varchar(11) NULL,
`education` varchar(50) NULL,
`sex` varchar(2) NULL,
`introduction` text NULL,
`time` datetime NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*������ݱ�admin*/
CREATE TABLE `admin` (
`un` varchar(30) PRIMARY KEY,
`pw` varchar(30) NOT NULL,
`value` varchar(2) NOT NULL,
`time` datetime NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*������ݱ�DESCRIPTION*/
create table `description`(
`id` int(11) NOT NULL AUTO_INCREMENT Primary key,
`name` varchar(50) NOT NULL UNIQUE,
`info` text NOT NULL,
`image` varchar(255) NOT NULL,
`introduce` varchar(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*������ݱ�COURSE*/
create table `course`(
`id` int(11) NOT NULL AUTO_INCREMENT Primary key,
`name` varchar(100) NOT NULL,
`title` varchar(100) NOT NULL,
`image` varchar(255) NOT NULL,
`introduce` varchar(255) NOT NULL,
CONSTRAINT `fk_course_3` FOREIGN KEY (`name`) REFERENCES `description` (`name`) ON DELETE CASCADE ON UPDATE CASCADE 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*������ݱ�mysql_course*/
create table `mysql_course`(
`id` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
`title` varchar(100) NOT NULL,
`introduction` text NOT NULL,
`fileName` varchar(100) NOT NULL,
`un` varchar(30) NOT NULL,
`time` datetime NOT NULL,
`course_id` int(11) NOT NULL,
CONSTRAINT `fk_mysql_course_6` FOREIGN KEY (`un`) REFERENCES `admin` (`un`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_mysql_course_8` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*������ݱ�mysql_source*/
create table `mysql_source`(
`id` int(11) Primary Key AUTO_INCREMENT,
`fileName` varchar(100) NOT NULL,
`un` varchar(30) NOT NULL,
`time` datetime NOT NULL,
`course_id` int(11) NULL,
`title` varchar(100) NOT NULL,
CONSTRAINT `fk_mysql_source_3` FOREIGN KEY (`un`) REFERENCES `user` (`un`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_mysql_source_32` FOREIGN KEY (`un`) REFERENCES `admin` (`un`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_mysql_source_5` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*������ݱ�sqlserver_course*/
create table `sqlserver_course`(
`id` int(11) PRIMARY KEY AUTO_INCREMENT,
`title` varchar(100) NOT NULL,
`introduction` text NOT NULL,
`fileName` varchar(100) NOT NULL,
`un` varchar(30) NOT NULL,
`time` datetime NOT NULL,
`course_id` int(11) NOT NULL,
CONSTRAINT `fk_sqlserver_course_6` FOREIGN KEY (`un`) REFERENCES `admin` (`un`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_sqlserver_course_8` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*������ݱ�sqlserver_source*/
create table `sqlserver_source`(
`id` int(11) Primary Key AUTO_INCREMENT,
`fileName` varchar(100) NOT NULL,
`un` varchar(30) NOT NULL,
`time` datetime NOT NULL,
`course_id` int(11) NULL,
`title` varchar(100) NOT NULL,
CONSTRAINT `fk_sqlserver_source_3` FOREIGN KEY (`un`) REFERENCES `user` (`un`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_sqlserver_source_32` FOREIGN KEY (`un`) REFERENCES `admin` (`un`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_sqlserver_source_5` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*������ݱ�oracle_course*/
create table `oracle_course`(
`id` int(11) PRIMARY KEY AUTO_INCREMENT,
`title` varchar(100) NOT NULL,
`introduction` text NOT NULL,
`fileName` varchar(100) NOT NULL,
`un` varchar(30) NOT NULL,
`time` datetime NOT NULL,
`course_id` int(11) NOT NULL,
CONSTRAINT `fk_oracle_course_6` FOREIGN KEY (`un`) REFERENCES `admin` (`un`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_oracle_course_8` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*������ݱ�oracle_source*/
create table `oracle_source`(
`id` int(11) Primary Key AUTO_INCREMENT,
`fileName` varchar(100) NOT NULL,
`un` varchar(30) NOT NULL,
`time` datetime NOT NULL,
`course_id` int(11) NULL,
`title` varchar(100) NOT NULL,
CONSTRAINT `fk_oracle_source_3` FOREIGN KEY (`un`) REFERENCES `user` (`un`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_oracle_source_32` FOREIGN KEY (`un`) REFERENCES `admin` (`un`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_oracle_source_5` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*������ݱ�NOTICE*/
create table `notice`(
`id` int(11) Primary Key AUTO_INCREMENT,
`title` varchar(50) NOT NULL,
`content` text NOT NULL,
`un` varchar(30) NOT NULL,
`time` datetime NOT NULL,
CONSTRAINT `fk_notice_4` FOREIGN KEY (`un`) REFERENCES `admin` (`un`) ON DELETE CASCADE ON UPDATE CASCADE 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*������ݱ�QUESTION*/
create table `question`(
`id` int(11) NOT NULL AUTO_INCREMENT Primary key,
`question` text NOT NULL,
`answer` text,
`un` varchar(30) NOT NULL,
`admin` varchar(30),
`time` datetime DEFAULT NULL,
CONSTRAINT `fk_question_4` FOREIGN KEY (`un`) REFERENCES `user` (`un`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_question_5` FOREIGN KEY (`admin`) REFERENCES `admin` (`un`) ON DELETE CASCADE ON UPDATE CASCADE 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*������ݱ�COMMENTS*/
create table `comments`(
`id` int(11) NOT NULL AUTO_INCREMENT Primary key,
`answer` text NOT NULL,
`un` varchar(30) NOT NULL,
`comment_id` varchar(11),
`question_id` int(11) NOT NULL,
`value` int(2) NOT NULL,
`time` datetime NOT NULL,
CONSTRAINT `fk_comments_3` FOREIGN KEY (`un`) REFERENCES `user` (`un`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_comments_5` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;