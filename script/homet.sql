-- users 
create table users (
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

alter table users add addr varchar(50) not null;
insert into users values (0,'admin','������','admin@naver.com','111111',99,'��',null,'�����');
-- ---------------------------------------------------
-- mealkit
create table mealkit(
	midx int auto_increment,
	name varchar(50) not null,
	price varchar(20) not null,
	image varchar(50) not null,
	category varchar(10) not null,
	primary key(midx)
);
-- ---------------------------------------------------
-- order
create table orders(
	oidx int auto_increment,
	nickname varchar(20) not null,
	order_list varchar(100) not null,
	order_date timestamp default current_timestamp,
	del_date timestamp not null,
	primary key(oidx),
	foreign key(nickname) references users(nickname)
);
-- ---------------------------------------------------
-- videos
create table videos(
	vidx int auto_increment,
	subject varchar(100) not null,
	category varchar(20) not null,
	url varchar(200) not null,
	content varchar(200),
	reg_date timestamp default current_timestamp,
	read_cnt int default 0,
	primary key(vidx)
); 
select * from videos;
-- ---------------------------------------------------
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
-- ---------------------------------------------------
-- videos ������ (ī�װ� : ȨƮ, ����Ʈ, �䰡, ��Ʈ��Ī)

-- ȨƮ
insert into videos(subject, category, url, content)
			values("[��Ÿ�ν�����] ���ſ ���̾�Ʈ/Į�θ����߿", "ȨƮ", "https://www.youtube.com/embed/PHdzU1S50AY", "[��Ÿ�ν�����] ���ſ ���̾�Ʈ/Į�θ����߿ �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�����κ�] Į���� �� ���ٸſ��", "ȨƮ", "https://www.youtube.com/embed/gMaB-fG4u4g", "[�����κ�] Į���� �� ���ٸſ�� �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�����κ�] ��� �Ʒ���� �ְ��� �", "ȨƮ", "https://www.youtube.com/embed/0L5gAT1fJaM", "[�����κ�] ��� �Ʒ���� �ְ��� � �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[������] ������ Ÿ��Ÿ �", "ȨƮ", "https://www.youtube.com/embed/4EKo44DUvjg", "[������] ������ Ÿ��Ÿ �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�򾾽�] NO �����ҿ� ���ο� �", "ȨƮ", "https://www.youtube.com/embed/myNjmnvI6x0", "[�򾾽�] NO �����ҿ� ���ο� � �����Դϴ�!");

-- ����Ʈ
insert into videos(subject, category, url, content)
			values("[������] ����Ʈ �ϴ� ���� 3���� ���", "����Ʈ", "https://www.youtube.com/embed/3l8GZ94YT9o", "[������] ����Ʈ �ϴ� ���� 3���� ��� �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�����ð�����] ���� � ��Ȳ", "����Ʈ", "https://www.youtube.com/embed/cgsqsVxd5xc", "[�����ð�����] ���� � ��Ȳ �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[������] ��ü", "����Ʈ", "https://www.youtube.com/embed/u5OgcZdNbMo", "[������] ��ü �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�ͺ�] �� ���ƾ", "����Ʈ", "https://www.youtube.com/embed/SmxvbUXT4_Q", "[�ͺ�] �� ���ƾ �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�ͺ�] �ｺ�� ��ü� ����", "����Ʈ", "https://www.youtube.com/embed/Dr2exaqERw4", "[�ͺ�] �ｺ�� ��ü� ���� �����Դϴ�!");

-- �䰡
insert into videos(subject, category, url, content)
			values("[�����䰡] ���ʿ䰡 �ʼ�����(��ver)", "�䰡", "https://www.youtube.com/embed/1W9gMxLoW6Q", "[�����䰡] ���ʿ䰡 �ʼ�����(��ver) �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[���ϸ�] �䰡 �Թ� ���ʺ��䰡", "�䰡", "https://www.youtube.com/embed/OBTl49bVk94", "[���ϸ�] �䰡 �Թ� ���ʺ��䰡 �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�����䰡] �Ϸ縦 �����ϰ�! 20�� ��ħ�䰡", "�䰡", "https://www.youtube.com/embed/CUWrrql-rOo", "[�����䰡] �Ϸ縦 �����ϰ�! 20�� ��ħ�䰡 �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�����䰡] ��ݼ�ȯ, ô��Ǯ��", "�䰡", "https://www.youtube.com/embed/OdGX6J29JVw", "[�����䰡] ��ݼ�ȯ, ô��Ǯ�� �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[���ϸ�] ������ �� �� �ִ� 15�� Ȩ�䰡", "�䰡", "https://www.youtube.com/embed/2RaErjnOzmU", "[���ϸ�] ������ �� �� �ִ� 15�� Ȩ�䰡 �����Դϴ�!");
		
-- ��Ʈ��Ī
insert into videos(subject, category, url, content)
			values("[�����ð�����] ������ ��, ��Ʈ��Ī", "��Ʈ��Ī", "https://www.youtube.com/embed/3zc1mGfA5kc", "�����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�ͺ�] �㸮���� �����ִ� ��ħ ��Ʈ��Ī 5����", "��Ʈ��Ī", "https://www.youtube.com/embed/L4zQU7C_hoA", "[�ͺ�] �㸮���� �����ִ� ��ħ ��Ʈ��Ī 5���� �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�����κ�] ���� ��Ʈ��Ī", "��Ʈ��Ī", "https://www.youtube.com/embed/nOGT4lXlSHw", "[�����κ�] ���� ��Ʈ��Ī �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�ٳ�Ƽ��] ��ħ�� �����ڸ��� �����ϴ� ��Ʈ��Ī", "��Ʈ��Ī", "https://www.youtube.com/embed/6_LYz_XxD-g", "[�ٳ�Ƽ��] ��ħ�� �����ڸ��� �����ϴ� ��Ʈ��Ī �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[������] � �� �ְ��� ��Ʈ��Ī", "��Ʈ��Ī", "https://www.youtube.com/embed/yyjOhsNEqtE", "[������] � �� �ְ��� ��Ʈ��Ī �����Դϴ�!");
		
insert into videos(subject, category, url, content)
			values("[�򾾽�] ���� Ÿ��Ÿ �", "ȨƮ", "https://www.youtube.com/embed/6q4gp1eB0cY", "[�򾾽�] ���� Ÿ��Ÿ � �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�������̻�յ���] ��ü ����Ʈ �.zip", "ȨƮ", "https://www.youtube.com/embed/iQHKnyU8ZVI", "[�������̻�յ���] ��ü ����Ʈ �.zip �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�������̻�յ���] 11�� ���ο", "ȨƮ", "https://www.youtube.com/embed/EojxzBZbo4o", "[�������̻�յ���] 11�� ���ο �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�������̻�յ���] 20�� ����Ÿ��Ÿ", "ȨƮ", "https://www.youtube.com/embed/BnmxF7Fw_hE", "[�������̻�յ���] 20�� ����Ÿ��Ÿ �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�����κ�] ������� �ٸ��� �ְ��� �", "ȨƮ", "https://www.youtube.com/embed/LK9e6mg4cmQ", "[�����κ�] ������� �ٸ��� �ְ��� � �����Դϴ�!");

insert into videos(subject, category, url, content)
			values("[������] �ｺ�� ��ü� ��ƾ", "����Ʈ", "https://www.youtube.com/embed/eBtLrAXkATo", "[������] �ｺ�� ��ü� ��ƾ �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�ͺ�] ���� ����� ��ƾ", "����Ʈ", "https://www.youtube.com/embed/d9m--yp_wyk", "[�ͺ�] ���� ����� ��ƾ �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[������] �ｺ�� ��ü� ��ƾ", "����Ʈ", "https://www.youtube.com/embed/Dw8PbebpF9w", "[������] �ｺ�� ��ü� ��ƾ �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�ͺ�] �︰�� ��ü� ��ƾ", "����Ʈ", "https://www.youtube.com/embed/Cb0yy0yHRUg", "[�ͺ�] �︰�� ��ü� ��ƾ �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�ͺ�] ��ƾ¥�� ��", "����Ʈ", "https://www.youtube.com/embed/YahXKYnc8K8", "[�ͺ�] ��ƾ¥�� �� �����Դϴ�!");

insert into videos(subject, category, url, content)
			values("[�䰡��] 30�� ���ſ䰡", "�䰡", "https://www.youtube.com/embed/XHTHwsbkWY0", "[�䰡��] 30�� ���ſ䰡 �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�䰡��] ������ �䰡, ���ϸ� ��Ʈ��Ī", "�䰡", "https://www.youtube.com/embed/0MNZuQtXpBA", "[�䰡��] ������ �䰡, ���ϸ� ��Ʈ��Ī �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[��Ű�ǰ�TV] Ȳ�ƿ��� ó�� ������ �䰡", "�䰡", "https://www.youtube.com/embed/RtB_nMpOe5Q", "[��Ű�ǰ�TV] Ȳ�ƿ��� ó�� ������ �䰡 �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�ƿ�Ȳ] Ȳ�ƿ� �䰡��ƾ ���ϸ� 15�� ��ü", "�䰡", "https://www.youtube.com/embed/zZ-0rFOxFrU", "[�ƿ�Ȳ] Ȳ�ƿ� �䰡��ƾ ���ϸ� 15�� ��ü �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�ƿ�Ȳ] ��ü���� ���� 10�� �̰� �ϳ��� �ذ�", "�䰡", "https://www.youtube.com/embed/4S4m9R-EFTE", "[�ƿ�Ȳ] ��ü���� ���� 10�� �̰� �ϳ��� �ذ� �����Դϴ�!");

insert into videos(subject, category, url, content)
			values("[��Ÿ�ν�����] ���� ��Ʈ��Ī", "��Ʈ��Ī", "https://www.youtube.com/embed/ECu-P8IqgHU", "[��Ÿ�ν�����] ���� ��Ʈ��Ī �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�ҹ���] 13�� ���ϸ� ���Ž�Ʈ��Ī", "��Ʈ��Ī", "https://www.youtube.com/embed/X2s3RZR8lPI", "[�ҹ���] 13�� ���ϸ� ���Ž�Ʈ��Ī �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[���Ｚ�𺴿�] ��Ʈ��Ī", "��Ʈ��Ī", "https://www.youtube.com/embed/G32r7kx-MTw", "[���Ｚ�𺴿�] ��Ʈ��Ī �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[���ϸ�] 10�� ħ�� ��Ʈ��Ī", "��Ʈ��Ī", "https://www.youtube.com/embed/YPFRGg7LD_w", "[���ϸ�] 10�� ħ�� ��Ʈ��Ī �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[����] 15�� ��� ��Ʈ��Ī", "��Ʈ��Ī", "https://www.youtube.com/embed/xCIid6LG354", "[����] 15�� ��� ��Ʈ��Ī �����Դϴ�!");
		
insert into videos(subject, category, url, content)
			values("[�˷��Ͻ��] 15�� ȨƮ", "ȨƮ", "https://www.youtube.com/embed/LaC1kwfhtyQ", "[�˷��Ͻ��] 15�� ȨƮ �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[������] ����ü�� ȨƮ 15�� ��ƾ", "ȨƮ", "https://www.youtube.com/embed/rSBOuArsz1k", "[������] ����ü�� ȨƮ 15�� ��ƾ �����Դϴ�!");
		
insert into videos(subject, category, url, content)
			values("[��Ÿ�ν�����] ü�߰��� 20���� ���۸���", "ȨƮ", "https://www.youtube.com/embed/9Vwp43YBTAs", "[��Ÿ�ν�����] ü�߰��� 20���� ���۸��� �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[��Ÿ�ν�����] ���� ����� Ÿ��Ÿ", "ȨƮ", "https://www.youtube.com/embed/sucNosF93w8", "[��Ÿ�ν�����] ���� ����� Ÿ��Ÿ �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�ҹ���] 2�� ���� ç����", "ȨƮ", "https://www.youtube.com/embed/p623pewgTc0", "[�ҹ���] 2�� ���� ç���� �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�򾾽�] 12�� �����ϴ� ���� �", "ȨƮ", "https://www.youtube.com/embed/sqQpL1wKW6M", "[�򾾽�] 12�� �����ϴ� ���� � �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[�򾾽�] ����Ʈ 10���� ����", "ȨƮ", "https://www.youtube.com/embed/DWYDL-WxF1U", "[�򾾽�] ����Ʈ 10���� ���� �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("[X-HIT] ���ϸ� ���Ϸ��� �ٸ��", "ȨƮ", "https://www.youtube.com/embed/xpzMr3nSOIE", "[X-HIT] ���ϸ� ���Ϸ��� �ٸ�� �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("", "ȨƮ", "", " �����Դϴ�!");
insert into videos(subject, category, url, content)
			values("", "ȨƮ", "", " �����Դϴ�!");
		
-- ---------------------------------------------------
-- mealkit ������

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
-- ---------------------------------------------------