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
   foreign key(nickname) references users(nickname),
   foreign key(fidx) references freeboard(fidx)
);
alter table likes add primary key(lidx);
drop table likes ;
