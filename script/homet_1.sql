-- create 문들

drop table users;
-- users
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

alter table users add addr varchar(50) not null;

-- mealkit
create table mealkit(
	midx int auto_increment,
	name varchar(50) not null,
	price varchar(20) not null,
	image varchar(50) not null,
	category varchar(10) not null,
	primary key (midx)
);

-- order
create table orders(
	oidx int auto_increment,
	nickname varchar(30) not null,
	order_list varchar(100) not null,
	order_date timestamp default current_timestamp,
	del_date timestamp default current_timestamp,
	primary key (oidx),
	foreign key (nickname) references users(nickname)
);
drop table orders;
alter table orders alter column del_date set default date_add(current_timestamp, interval 1 day);

-- videos
create table videos(
	vidx int auto_increment,
	subject varchar(100) not null,
	category varchar(20) not null,
	url varchar(200) not null,
	content varchar(200),
	reg_date timestamp default curdate()+1,
	read_cnt int default 0,
	primary key (vidx)
);

-- freeboard
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

insert into users (name, nickname, email, password, age, gender, addr)
	values ('이현수', 'soo', 'dlgustn96@naver.com', '1234', 26, '남', '서울시 관악구 봉천동');

insert into orders (nickname, order_list, del_date)
	values ('soo', '5/4/11/24/7/13', '2021-11-17');

select * from orders where nickname='soo'
and DATE(del_date) > DATE(NOW())-1;

 -- 트리거
create trigger orders_update
before insert on orders
for each row
begin 
	set new.del_date= new.order_date+1;
end;


create table set_menu(
	setidx int auto_increment,
	name varchar(20) not null,
	content varchar(50),
	price varchar(6),
	idx_list varchar(30),
	category varchar(10) not null,
	primary key (setidx)
);











