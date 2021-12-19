create table users(
	uidx int auto_increment,
	name varchar(20) not null,
	nickname varchar(30) unique,
	email varchar(50) not null,
	password varchar(64) not null,
	age int,
	gender varchar(5) not null,
	kakao long,
	primary key (uidx)
);
 ALTER TABLE users ADD (addr varchar(50) not null);
insert into users values (0,'admin','관리자','admin@naver.com',sha2('1111111',256),99,'남',null,'서울시');

drop table users;

create table mealkit(
 midx int auto_increment,
 name varchar(50) not null,
 price varchar(20) not null,
 image varchar(50) not null,
 category varchar(10) not null,
 primary key (midx)
);
create table orders(
 oidx int auto_increment,
 nickname varchar(20) not null,
 order_list varchar(100) not null,
 order_date timestamp default current_timestamp,
 del_date timestamp not null,
 primary key (oidx),
 foreign key (nickname) references users(nickname)
);

create table videos(
	vidx int auto_increment,
	subject varchar(100) not null,
	category varchar(20) not null,
	url varchar(200) not null,
	content varchar (200),
	reg_date timestamp default current_timestamp,
	read_cnt int default 0,
	primary key(vidx)
);

create table freeboard(
	fidx int auto_increment,
	subject varchar(30) not null,
	nickname varchar(30) not null,
	hashtag varchar(20),
	content varchar(1500),
	fimage varchar(60),
	reg_date timestamp default current_timestamp,
	like_cnt int default 0,
	primary key (fidx),
	foreign key (nickname) references users(nickname)
);
-- likes
create table likes(
   lidx int auto_increment,
   nickname varchar(30),
   fidx int,
   primary key(lidx),
   foreign key(nickname) references users(nickname),
   foreign key(fidx) references freeboard(fidx)
);
alter table likes add primary key(lidx);
drop table likes ;
drop table freeboard;

INSERT INTO homet.users (name,nickname,email,password,age,gender,kakao,addr) VALUES
	 ('강규석','규석강','ka@naver.com','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2',29,'남',NULL,'서울 강남구 강남대로 298'),
	 ('이현수','쑤우','dlqustn96@gmail.com','bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a',26,'여',NULL,'서울 관악구 낙성대로 2'),
	 ('이지환','환이','t@naver.com','bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a',26,'여',NULL,'경기 부천시 범안로 252');
