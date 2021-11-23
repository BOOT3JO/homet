-- create ��
drop table users;
drop table mealkit;
-- users
create table users(
	uidx int auto_increment,
	name varchar(20) not null,
	nickname varchar(30) not null unique,
	email varchar(50) not null,
	password varchar(64) not null,
	age int,
	gender varchar(5) not null,
	kakao long,
	primary key(uidx)	
); 

-- mealkit
create table mealkit(
	midx int auto_increment,
	name varchar(50) not null,
	price varchar(20) not null,
	image varchar(50) not null,
	category varchar(10) not null,
	primary key(midx)
);

select * from mealkit;

-- order
create table orders(
	oidx int auto_increment,
	nickname varchar(20) not null,
	order_list varchar(100) not null,
	order_date timestamp default current_timestamp,
	del_data timestamp not null,
	primary key(oidx),
	foreign key(nickname) references users(nickname)
);

-- videos
create table videos(
	vidx int auto_increment,
	subject varchar(100) not null,
	category varchar(10) not null,
	url varchar(200) not null,
	content varchar(200),
	reg_date timestamp default current_timestamp,
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
	primary key(fidx),
	foreign key(nickname) references users(nickname)
);


alter table users add addr varchar(50) not null;

select * from freeboard f ;


-- users insert
insert into users values (0,'admin','������','admin@naver.com',sha2('1111111',256),99,'��',null,'�����');

-- mealkit insert 
insert into mealkit(name,price,image,category) values('�߰����� ������ũ �������� 100g',   '1500',   '�߰����� ������ũ ��������.jpg',   'meat');
insert into mealkit(name,price,image,category) values('�߰����� ������ũ ������ 100g',   '1500',   '�߰����� ������ũ ������.jpg',   'meat');
insert into mealkit(name,price,image,category) values('�߰����� ������ũ ���߸� 100g',   '1500',   '�߰����� ������ũ ���߸�.jpg',   'meat');
insert into mealkit(name,price,image,category) values('����Ʈ �߰����� ���ø� 100g',   '1500',   '����Ʈ �߰����� ���ø�.jpg',   'meat');
insert into mealkit(name,price,image,category) values('����Ʈ �߰����� ź�θ��� 100g',   '1500',   '����Ʈ �߰����� ź�θ���.jpg',   'meat');
insert into mealkit(name,price,image,category) values('����Ʈ �߰����� ���߸� 100g',   '1500',   '����Ʈ �߰����� ���߸�.jpg',   'meat');
insert into mealkit(name,price,image,category) values('�Ұ�⺼ �������� 100g',   '2500',   '�Ұ�⺼ ��������.jpg',   'meat');
insert into mealkit(name,price,image,category) values('�Ұ�⺼ û����� 100g',   '2500',   '�Ұ�⺼ û�����.jpg',   'meat');
insert into mealkit(name,price,image,category) values('�Ұ�⺼ ȥ�� 100g',   '2500',   '�Ұ�⺼ ȥ�ո�.jpg',   'meat');
insert into mealkit(name,price,image,category) values('�������� �����̽� 80g',   '4000',   '�������� �����̽�.jpg',   'meat');
insert into mealkit(name,price,image,category) values('���� ������ũ 80g',   '4000',   '���� ������ũ.jpg',   'meat');
insert into mealkit(name,price,image,category) values('�ڿ��̴� �������� �ٺ�ť 200g',   '3500',   '�������� �ٺ�ť.jpg',   'meat');
insert into mealkit(name,price,image,category) values('�����Ƚ� ����� �÷��� 150g',   '5000',   '�����Ƚ� ����� �÷���.jpg',   'meat');
insert into mealkit(name,price,image,category) values('�����Ƚ� ����� ��� 150g',   '5000',   '�����Ƚ� ����� ���.jpg',   'meat');
insert into mealkit(name,price,image,category) values('ģȯ�� ����� 20g',   '500',   '�����.png',   'salad');
insert into mealkit(name,price,image,category) values('ģȯ�� ����� 20g',   '500',   '�����.jpg',   'salad');
insert into mealkit(name,price,image,category) values('ģȯ�� ������� 20g',   '500',   '�������.jpg',   'salad');
insert into mealkit(name,price,image,category) values('����丶�� (5��) ',   '500',   '����丶��.jpg',   'salad');
insert into mealkit(name,price,image,category) values('�ƺ�ī�� 80g',   '1000',   '�ƺ�ī��.jpg',   'salad');
insert into mealkit(name,price,image,category) values('ġĿ�� 20g',   '500',   'ġĿ��.jpg',   'salad');
insert into mealkit(name,price,image,category) values('���ġ�� 20g',   '500',   '���ġ��.jpg',   'salad');
insert into mealkit(name,price,image,category) values('�θ��� 20g',   '500',   '�θ���.jpg',   'salad');
insert into mealkit(name,price,image,category) values('��纣�� (5��)',   '500',   '��纣��.jpg',   'topping');
insert into mealkit(name,price,image,category) values('�Ƹ�� 10g',   '500',   '�Ƹ��.jpg',   'topping');
insert into mealkit(name,price,image,category) values('���������� 10g',   '500',   '����������.jpg',   'topping');
insert into mealkit(name,price,image,category) values('����Ÿ ġ�� 50g ',   '1000',   '����Ÿġ��.jpg',   'topping');
insert into mealkit(name,price,image,category) values('��Ÿ ġ�� 50g',   '1000',   '��Ÿġ��.jpg',   'topping');
insert into mealkit(name,price,image,category) values('�ǹٳ��� 10g',   '300',   '�ǹٳ���.jpg',   'topping');
insert into mealkit(name,price,image,category) values('������ 10g',   '300',   '������.jpg',   'topping');
insert into mealkit(name,price,image,category) values('�ݼ���� 1��',   '500',   '�ݼ����.jpg',   'topping');
insert into mealkit(name,price,image,category) values('������� 1��',   '500',   '�������.jpg',   'topping');
insert into mealkit(name,price,image,category) values('ĳ���� �巹��',   '300',   'ĳ���� �巹��.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('������Ż �巹��',   '300',   '������Ż �巹��.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('�߻�� �巹��',   '300',   '�߻�� �巹��.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('�������� �巹��',   '300',   '�������� �巹��.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('������Ŭ �ӽ��͵� �巹��',   '300',   '������Ŭ �ӽ��͵� �巹��.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('������� �巹��',   '300',   '������� �巹��.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('���� �巹��',   '300',   '���� �巹��.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('���Ʈ �巹��',   '300',   '���Ʈ �巹��.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('�Ӵ� �ҽ�',   '300',   '�Ҵ߼ҽ�.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('�ٺ�ť �ҽ�',   '300',   '�ٺ�ť�ҽ�.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('������ũ �ҽ�',   '300',   '������ũ �ҽ�.png',   'sauce');
insert into mealkit(name,price,image,category) values('ĥ������ �ҽ�',   '300',   'ĥ������ �ҽ�.png',   'sauce');
insert into mealkit(name,price,image,category) values('�������� �ҽ�',   '300',   '�������� �ҽ�.png',   'sauce');
insert into mealkit(name,price,image,category) values('����Ʈ ĥ�� �ҽ�',   '300',   '����Ʈĥ�� �ҽ�.png',   'sauce');
insert into mealkit(name,price,image,category) values('�ǳ� �ҽ�',   '300',   '�ǳ� �ҽ�.png',   'sauce');
insert into mealkit(name,price,image,category) values('������ �ҽ�',   '300',   '������ �ҽ�.png',   'sauce');


insert into freeboard(subject,nickname,hashtag,content) values('�����Խ��� test','������','#test','test ��..');

