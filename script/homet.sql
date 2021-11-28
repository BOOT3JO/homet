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
drop table users ;
alter table users add addr varchar(50) not null;
insert into users values (0,'admin','관리자','admin@naver.com','111111',99,'남',null,'서울시');
insert into users values (0,'admin','관리자','admin@naver.com',sha2('1111111',256),99,'남',null,'서울시');
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
drop table orders ;
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
drop table freeboard ;
-- ---------------------------------------------------
-- likes
create table likes(
   lidx int auto_increment,
   nickname varchar(30),
   fidx int,
   primary key(lidx),
   foreign key(nickname) references users(nickname),
   foreign key(fidx) references freeboard(fidx)
);
drop table likes ;
-- ---------------------------------------------------
-- set_menu 
create table set_menu(
   setidx int auto_increment,
   name varchar(30) not null,
   content varchar(50),
   price varchar(6),
   idx_list varchar(50),   -- 11.18변경
   category varchar(20) not null,   -- 11.18 변경
   primary key(setidx)
);
-- ---------------------------------------------------
-- users 데이터
INSERT INTO homet.users (name,nickname,email,password,age,gender,kakao,addr) VALUES
	 ('선명진','사용자','aud0403@naver.com',sha2('1111111',256),30,'여',NULL,'서울 중랑구 동일로129길 35'),
	 ('양혜영','양형','ausouon@gmail.com',sha2('1111111',256),21,'여',NULL,'서울 도봉구 도봉로181길 8'),
	 ('김나영','김나영','psi5059@naver.com',sha2('1111111',256),30,'여',NULL,'경기 부천시 역곡로472번길 12'),
	 ('강규석','규석강','ka@naver.com',sha2('1111111',256),29,'남',NULL,'서울 강남구 강남대로 298'),
	 ('이현수','쑤우','dlqustn96@gmail.com',sha2('1111111',256),26,'여',NULL,'서울 관악구 낙성대로 2'),
	 ('이지환','환이','t@naver.com',sha2('1111111',256),26,'여',NULL,'경기 부천시 범안로 252');
-- ---------------------------------------------------
-- videos 데이터 (카테고리 : 홈트, 웨이트, 요가, 스트레칭)

-- 홈트
insert into videos(subject, category, url, content)
			values("[비타민신지니] 전신운동 다이어트/칼로리폭발운동", "홈트", "https://www.youtube.com/embed/PHdzU1S50AY", "[비타민신지니] 전신운동 다이어트/칼로리폭발운동 영상입니다!");
insert into videos(subject, category, url, content)
			values("[땅끄부부] 칼소폭 찐 핵핵매운맛", "홈트", "https://www.youtube.com/embed/gMaB-fG4u4g", "[땅끄부부] 칼소폭 찐 핵핵매운맛 영상입니다!");
insert into videos(subject, category, url, content)
			values("[땅끄부부] 뱃살 아랫뱃살 최고의 운동", "홈트", "https://www.youtube.com/embed/0L5gAT1fJaM", "[땅끄부부] 뱃살 아랫뱃살 최고의 운동 영상입니다!");
insert into videos(subject, category, url, content)
			values("[에이핏] 죽음의 타바타 운동", "홈트", "https://www.youtube.com/embed/4EKo44DUvjg", "[에이핏] 죽음의 타바타 영상입니다!");
insert into videos(subject, category, url, content)
			values("[빅씨스] NO 층간소움 올인원 운동", "홈트", "https://www.youtube.com/embed/myNjmnvI6x0", "[빅씨스] NO 층간소움 올인원 운동 영상입니다!");

-- 웨이트
insert into videos(subject, category, url, content)
			values("[정서라] 웨이트 하는 여자 3분할 운동법", "웨이트", "https://www.youtube.com/embed/3l8GZ94YT9o", "[정서라] 웨이트 하는 여자 3분할 운동법 영상입니다!");
insert into videos(subject, category, url, content)
			values("[피지컬갤러리] 김계란 운동 근황", "웨이트", "https://www.youtube.com/embed/cgsqsVxd5xc", "[피지컬갤러리] 김계란 운동 근황 영상입니다!");
insert into videos(subject, category, url, content)
			values("[김종국] 하체", "웨이트", "https://www.youtube.com/embed/u5OgcZdNbMo", "[김종국] 하체 영상입니다!");
insert into videos(subject, category, url, content)
			values("[핏블리] 등 운동루틴", "웨이트", "https://www.youtube.com/embed/SmxvbUXT4_Q", "[핏블리] 등 운동루틴 영상입니다!");
insert into videos(subject, category, url, content)
			values("[핏블리] 헬스장 하체운동 순서", "웨이트", "https://www.youtube.com/embed/Dr2exaqERw4", "[핏블리] 헬스장 하체운동 순서 영상입니다!");

-- 요가
insert into videos(subject, category, url, content)
			values("[서리요가] 기초요가 필수동작(구ver)", "요가", "https://www.youtube.com/embed/1W9gMxLoW6Q", "[서리요가] 기초요가 필수동작(구ver) 영상입니다!");
insert into videos(subject, category, url, content)
			values("[에일린] 요가 입문 왕초보요가", "요가", "https://www.youtube.com/embed/OBTl49bVk94", "[에일린] 요가 입문 왕초보요가 영상입니다!");
insert into videos(subject, category, url, content)
			values("[서리요가] 하루를 개운하게! 20분 아침요가", "요가", "https://www.youtube.com/embed/CUWrrql-rOo", "[서리요가] 하루를 개운하게! 20분 아침요가 영상입니다!");
insert into videos(subject, category, url, content)
			values("[서리요가] 골반순환, 척추풀기", "요가", "https://www.youtube.com/embed/OdGX6J29JVw", "[서리요가] 골반순환, 척추풀기 영상입니다!");
insert into videos(subject, category, url, content)
			values("[에일린] 누구나 할 수 있는 15분 홈요가", "요가", "https://www.youtube.com/embed/2RaErjnOzmU", "[에일린] 누구나 할 수 있는 15분 홈요가 영상입니다!");
		
-- 스트레칭
insert into videos(subject, category, url, content)
			values("[피지컬갤러리] 뻐근한 등, 스트레칭", "스트레칭", "https://www.youtube.com/embed/3zc1mGfA5kc", "영상입니다!");
insert into videos(subject, category, url, content)
			values("[핏블리] 허리통증 없애주는 아침 스트레칭 5가지", "스트레칭", "https://www.youtube.com/embed/L4zQU7C_hoA", "[핏블리] 허리통증 없애주는 아침 스트레칭 5가지 영상입니다!");
insert into videos(subject, category, url, content)
			values("[땅끄부부] 전신 스트레칭", "스트레칭", "https://www.youtube.com/embed/nOGT4lXlSHw", "[땅끄부부] 전신 스트레칭 영상입니다!");
insert into videos(subject, category, url, content)
			values("[다노티비] 아침에 눈뜨자마자 따라하는 스트레칭", "스트레칭", "https://www.youtube.com/embed/6_LYz_XxD-g", "[다노티비] 아침에 눈뜨자마자 따라하는 스트레칭 영상입니다!");
insert into videos(subject, category, url, content)
			values("[힙으뜸] 운동 전 최고의 스트레칭", "스트레칭", "https://www.youtube.com/embed/yyjOhsNEqtE", "[힙으뜸] 운동 전 최고의 스트레칭 영상입니다!");
		
insert into videos(subject, category, url, content)
			values("[빅씨스] 전신 타바타 운동", "홈트", "https://www.youtube.com/embed/6q4gp1eB0cY", "[빅씨스] 전신 타바타 운동 영상입니다!");
insert into videos(subject, category, url, content)
			values("[제이제이살롱드핏] 하체 베스트 운동.zip", "홈트", "https://www.youtube.com/embed/iQHKnyU8ZVI", "[제이제이살롱드핏] 하체 베스트 운동.zip 영상입니다!");
insert into videos(subject, category, url, content)
			values("[제이제이살롱드핏] 11분 복부운동", "홈트", "https://www.youtube.com/embed/EojxzBZbo4o", "[제이제이살롱드핏] 11분 복부운동 영상입니다!");
insert into videos(subject, category, url, content)
			values("[제이제이살롱드핏] 20분 전신타바타", "홈트", "https://www.youtube.com/embed/BnmxF7Fw_hE", "[제이제이살롱드핏] 20분 전신타바타 영상입니다!");
insert into videos(subject, category, url, content)
			values("[땅끄부부] 허벅지살 다리살 최고의 운동", "홈트", "https://www.youtube.com/embed/LK9e6mg4cmQ", "[땅끄부부] 허벅지살 다리살 최고의 운동 영상입니다!");

insert into videos(subject, category, url, content)
			values("[힙으뜸] 헬스장 하체운동 루틴", "웨이트", "https://www.youtube.com/embed/eBtLrAXkATo", "[힙으뜸] 헬스장 하체운동 루틴 영상입니다!");
insert into videos(subject, category, url, content)
			values("[핏블리] 여자 가슴운동 루틴", "웨이트", "https://www.youtube.com/embed/d9m--yp_wyk", "[핏블리] 여자 가슴운동 루틴 영상입니다!");
insert into videos(subject, category, url, content)
			values("[힙으뜸] 헬스장 상체운동 루틴", "웨이트", "https://www.youtube.com/embed/Dw8PbebpF9w", "[힙으뜸] 헬스장 상체운동 루틴 영상입니다!");
insert into videos(subject, category, url, content)
			values("[핏블리] 헬린이 상체운동 루틴", "웨이트", "https://www.youtube.com/embed/Cb0yy0yHRUg", "[핏블리] 헬린이 상체운동 루틴 영상입니다!");
insert into videos(subject, category, url, content)
			values("[핏블리] 루틴짜는 법", "웨이트", "https://www.youtube.com/embed/YahXKYnc8K8", "[핏블리] 루틴짜는 법 영상입니다!");

insert into videos(subject, category, url, content)
			values("[요가은] 30분 전신요가", "요가", "https://www.youtube.com/embed/XHTHwsbkWY0", "[요가은] 30분 전신요가 영상입니다!");
insert into videos(subject, category, url, content)
			values("[요가은] 차분한 요가, 데일리 스트레칭", "요가", "https://www.youtube.com/embed/0MNZuQtXpBA", "[요가은] 차분한 요가, 데일리 스트레칭 영상입니다!");
insert into videos(subject, category, url, content)
			values("[쿠키건강TV] 황아영의 처음 만나는 요가", "요가", "https://www.youtube.com/embed/RtB_nMpOe5Q", "[쿠키건강TV] 황아영의 처음 만나는 요가 영상입니다!");
insert into videos(subject, category, url, content)
			values("[아영황] 황아영 요가루틴 데일리 15분 상체", "요가", "https://www.youtube.com/embed/zZ-0rFOxFrU", "[아영황] 황아영 요가루틴 데일리 15분 상체 영상입니다!");
insert into videos(subject, category, url, content)
			values("[아영황] 하체부종 매일 10분 이거 하나로 해결", "요가", "https://www.youtube.com/embed/4S4m9R-EFTE", "[아영황] 하체부종 매일 10분 이거 하나로 해결 영상입니다!");

insert into videos(subject, category, url, content)
			values("[비타민신지니] 전신 스트레칭", "스트레칭", "https://www.youtube.com/embed/ECu-P8IqgHU", "[비타민신지니] 전신 스트레칭 영상입니다!");
insert into videos(subject, category, url, content)
			values("[소미핏] 13분 데일리 전신스트레칭", "스트레칭", "https://www.youtube.com/embed/X2s3RZR8lPI", "[소미핏] 13분 데일리 전신스트레칭 영상입니다!");
insert into videos(subject, category, url, content)
			values("[서울성모병원] 목스트레칭", "스트레칭", "https://www.youtube.com/embed/G32r7kx-MTw", "[서울성모병원] 목스트레칭 영상입니다!");
insert into videos(subject, category, url, content)
			values("[에일린] 10분 침대 스트레칭", "스트레칭", "https://www.youtube.com/embed/YPFRGg7LD_w", "[에일린] 10분 침대 스트레칭 영상입니다!");
insert into videos(subject, category, url, content)
			values("[빵느] 15분 기상 스트레칭", "스트레칭", "https://www.youtube.com/embed/xCIid6LG354", "[빵느] 15분 기상 스트레칭 영상입니다!");
		
insert into videos(subject, category, url, content)
			values("[알로하써니] 15분 홈트", "홈트", "https://www.youtube.com/embed/LaC1kwfhtyQ", "[알로하써니] 15분 홈트 영상입니다!");
insert into videos(subject, category, url, content)
			values("[힙으뜸] 기초체력 홈트 15분 루틴", "홈트", "https://www.youtube.com/embed/rSBOuArsz1k", "[힙으뜸] 기초체력 홈트 15분 루틴 영상입니다!");
		
insert into videos(subject, category, url, content)
			values("[비타민신지니] 체중감량 20가지 동작모음", "홈트", "https://www.youtube.com/embed/9Vwp43YBTAs", "[비타민신지니] 체중감량 20가지 동작모음 영상입니다!");
insert into videos(subject, category, url, content)
			values("[비타민신지니] 전신 유산소 타바타", "홈트", "https://www.youtube.com/embed/sucNosF93w8", "[비타민신지니] 전신 유산소 타바타 영상입니다!");
insert into videos(subject, category, url, content)
			values("[소미핏] 2주 복근 챌린지", "홈트", "https://www.youtube.com/embed/p623pewgTc0", "[소미핏] 2주 복근 챌린지 영상입니다!");
insert into videos(subject, category, url, content)
			values("[빅씨스] 12분 서서하는 복근 운동", "홈트", "https://www.youtube.com/embed/sqQpL1wKW6M", "[빅씨스] 12분 서서하는 복근 운동 영상입니다!");
insert into videos(subject, category, url, content)
			values("[빅씨스] 스쿼트 10가지 동작", "홈트", "https://www.youtube.com/embed/DWYDL-WxF1U", "[빅씨스] 스쿼트 10가지 동작 영상입니다!");
insert into videos(subject, category, url, content)
			values("[X-HIT] 마일리 사일러스 다리운동", "홈트", "https://www.youtube.com/embed/xpzMr3nSOIE", "[X-HIT] 마일리 사일러스 다리운동 영상입니다!");
		
-- ---------------------------------------------------
-- mealkit 데이터

insert into mealkit(name,price,image,category) values('닭가슴살 스테이크 오리지널 100g',   '1500',   '닭가슴살 스테이크 오리지널.jpg',   'meat');
insert into mealkit(name,price,image,category) values('닭가슴살 스테이크 갈릭맛 100g',   '1500',   '닭가슴살 스테이크 갈릭맛.jpg',   'meat');
insert into mealkit(name,price,image,category) values('닭가슴살 스테이크 고추맛 100g',   '1500',   '닭가슴살 스테이크 고추맛.jpg',   'meat');
insert into mealkit(name,price,image,category) values('소프트 닭가슴살 마늘맛 100g',   '1500',   '소프트 닭가슴살 마늘맛.jpg',   'meat');
insert into mealkit(name,price,image,category) values('소프트 닭가슴살 탄두리맛 100g',   '1500',   '소프트 닭가슴살 탄두리맛.jpg',   'meat');
insert into mealkit(name,price,image,category) values('소프트 닭가슴살 고추맛 100g',   '1500',   '소프트 닭가슴살 고추맛.jpg',   'meat');
insert into mealkit(name,price,image,category) values('소고기볼 오리지널 100g',   '2500',   '소고기볼 오리지널.jpg',   'meat');
insert into mealkit(name,price,image,category) values('소고기볼 청양고추 100g',   '2500',   '소고기볼 청양고추.jpg',   'meat');
insert into mealkit(name,price,image,category) values('소고기볼 혼합 100g',   '2500',   '소고기볼 혼합맛.jpg',   'meat');
insert into mealkit(name,price,image,category) values('훈제연어 슬라이스 80g',   '4000',   '훈제연어 슬라이스.jpg',   'meat');
insert into mealkit(name,price,image,category) values('연어 스테이크 80g',   '4000',   '연어 스테이크.jpg',   'meat');
insert into mealkit(name,price,image,category) values('자연미덕 오리훈제 바비큐 200g',   '3500',   '오리훈제 바비큐.jpg',   'meat');
insert into mealkit(name,price,image,category) values('돼지안심 수비드 플레인 150g',   '5000',   '돼지안심 수비드 플레인.jpg',   'meat');
insert into mealkit(name,price,image,category) values('돼지안심 수비드 양념 150g',   '5000',   '돼지안심 수비드 양념.jpg',   'meat');
insert into mealkit(name,price,image,category) values('친환경 양상추 20g',   '500',   '양상추.png',   'salad');
insert into mealkit(name,price,image,category) values('친환경 양배추 20g',   '500',   '양배추.jpg',   'salad');
insert into mealkit(name,price,image,category) values('친환경 적양배추 20g',   '500',   '적양배추.jpg',   'salad');
insert into mealkit(name,price,image,category) values('방울토마토 (5알) ',   '500',   '방울토마토.jpg',   'salad');
insert into mealkit(name,price,image,category) values('아보카도 80g',   '1000',   '아보카도.jpg',   'salad');
insert into mealkit(name,price,image,category) values('치커리 20g',   '500',   '치커리.jpg',   'salad');
insert into mealkit(name,price,image,category) values('라디치오 20g',   '500',   '라디치오.jpg',   'salad');
insert into mealkit(name,price,image,category) values('로메인 20g',   '500',   '로메인.jpg',   'salad');
insert into mealkit(name,price,image,category) values('블루베리 (5알)',   '500',   '블루베리.jpg',   'topping');
insert into mealkit(name,price,image,category) values('아몬드 10g',   '500',   '아몬드.jpg',   'topping');
insert into mealkit(name,price,image,category) values('고구마말랭이 10g',   '500',   '고구마말랭이.jpg',   'topping');
insert into mealkit(name,price,image,category) values('리코타 치즈 50g ',   '1000',   '리코타치즈.jpg',   'topping');
insert into mealkit(name,price,image,category) values('페타 치즈 50g',   '1000',   '페타치즈.jpg',   'topping');
insert into mealkit(name,price,image,category) values('건바나나 10g',   '300',   '건바나나.jpg',   'topping');
insert into mealkit(name,price,image,category) values('건포도 10g',   '300',   '건포도.jpg',   'topping');
insert into mealkit(name,price,image,category) values('반숙계란 1알',   '500',   '반숙계란.jpg',   'topping');
insert into mealkit(name,price,image,category) values('훈제계란 1알',   '500',   '훈제계란.jpg',   'topping');
insert into mealkit(name,price,image,category) values('캐슈넛 드레싱',   '300',   '캐슈넛 드레싱.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('오리엔탈 드레싱',   '300',   '오리엔탈 드레싱.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('발사믹 드레싱',   '300',   '발사믹 드레싱.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('참깨오곡 드레싱',   '300',   '참깨오곡 드레싱.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('오이피클 머스터드 드레싱',   '300',   '오이피클 머스터드 드레싱.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('레몬라임 드레싱',   '300',   '레몬라임 드레싱.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('시저 드레싱',   '300',   '시저 드레싱.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('요거트 드레싱',   '300',   '요거트 드레싱.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('붉닭 소스',   '300',   '불닭소스.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('바비큐 소스',   '300',   '바베큐소스.jpg',   'sauce');
insert into mealkit(name,price,image,category) values('스테이크 소스',   '300',   '스테이크 소스.png',   'sauce');
insert into mealkit(name,price,image,category) values('칠리갈릭 소스',   '300',   '칠리갈릭 소스.png',   'sauce');
insert into mealkit(name,price,image,category) values('스리라차 소스',   '300',   '스리라차 소스.png',   'sauce');
insert into mealkit(name,price,image,category) values('스위트 칠리 소스',   '300',   '스위트칠리 소스.png',   'sauce');
insert into mealkit(name,price,image,category) values('피넛 소스',   '300',   '피넛 소스.png',   'sauce');
insert into mealkit(name,price,image,category) values('블랙갈릭 소스',   '300',   '블랙갈릭 소스.png',   'sauce');
-- ---------------------------------------------------
-- set_menu 데이터
nsert into set_menu (name,content,category)   -- balance
values('몸짱 set','밸런스있는 식단을 챙기는 set!!','set');
insert into set_menu (name,price,idx_list,category)
values('평소식단 set1','6000','3/17/15/30/31/24/32','balance');
insert into set_menu (name,price,idx_list,category)
values('평소식단 set2','6500','11/2/18/16/22/23/26/43/35','balance');
insert into set_menu (name,price,idx_list,category)
values('평소식단 set3','7500','13/15/20/21/24/31/34/42','balance');
insert into set_menu (name,price,idx_list,category)
values('평소식단 set4','7000','5/9/18/19/15/27/28/39/40','balance');


insert into set_menu (name,content,category)   -- bodyprofile bdpf
values('Body Profile set','바디프로필러에게 필요한 set!!','set');
insert into set_menu (name,price,idx_list,category)
values('바디프로필용 set1','5500','1/15/16/26/31/34/45','bodyprofile');
insert into set_menu (name,price,idx_list,category)
values('바디프로필용 set2','5500','4/17/18/20/30/29/39/41','bodyprofile');
insert into set_menu (name,price,idx_list,category)
values('바디프로필용 set3','6000','7/22/16/21/24/27/35/40','bodyprofile');
insert into set_menu (name,price,idx_list,category)
values('바디프로필용 set4','4500','10/16/19/21/26/23/37/47','bodyprofile');



insert into set_menu (name,content,category)   -- diet
values('다이어트 set','다이어트가 고픈 자가 픽한 set!!','set');
insert into set_menu (name,price,idx_list,category)
values('다이어트 식단 set1','4000','1/18/18/30/30/30/44','diet');
insert into set_menu (name,price,idx_list,category)
values('다이어트 식단 set2','3500','7/15/20/23/25','diet');
insert into set_menu (name,price,idx_list,category)
values('다이어트 식단 set3','4500','4/16/18/31/31/31/25/46','diet');


insert into set_menu (name,content,category)   -- vegetable vgtb
values('vegetable set','채식위주를 원하는 자에게 필요한 set!!','set');
insert into set_menu (name,price,idx_list,category)
values('샐러드위주 set1','3500','11/15/19/20/26/30/34','salad');
insert into set_menu (name,price,idx_list,category)
values('샐러드위주 set2','3500','5/15/23/24/26/31/33','salad');
insert into set_menu (name,price,idx_list,category)
values('샐러드위주 set3','4000','12/15/17/21/23/25/35/47','salad');
-- ---------------------------------------------------
-- freeboard 데이터
INSERT INTO homet.freeboard (subject,nickname,hashtag,content,fimage,reg_date,like_cnt) VALUES
	 ('[공지]   AVOCADO에 오신 것을 환영합니다.','관리자','','여러분의 건강한 몸과 멘탈을 위한 공간입니다.','KakaoTalk_20211123_104012080.png','2021-11-27 18:52:25',0),
	 ('[공지] 사용시 주의사항','관리자','',' 광고성, 특정인의 명예 훼손, 동일내용의 글을 반복하여 게시하는 경우, 게시판 성격에 맞지 않는 글, 음란성, 욕설, 비속어, 비방성, 음해성, 기타 불건전한 내용을 담고 있을 경우에는 사전통보 없이 삭제될 수 있으니 양해바랍니다.

잠깐 ! 귀하가 게재한 내용은 타인이 열람할 수 있으며, 타인의 개인정보 등 인권침해하는 경우 명예 훼손 등으로 고소당할 수도 있습니다.

 게시판에 글쓰기를 하는 경우, 본문 또는 첨부파일내에 개인정보 성명, 주소 등)가 포함되어 게시되지 않도록 유의하시기 바랍니다.

 개인정보를 포함하여 게시하는 경우에는 불특정 다수에게 개인정보가 노출되어 악용될 수 있으며, 특히 타인의 개인정보가 노출되는 경우에는 개인정보보호법에 따라 처벌을 받을 수 있음을 알려드립니다.','','2021-11-27 20:38:14',0),
	 ('[잡담]역삼동 헬스장 추천좀요 ㅠㅠ','규석강','역삼동','헬스를 처음 시작하려는데!! 
가격좋구 기구많고,, 트레이너좋은곳 알려주세요...',NULL,'2021-11-27 21:45:40',0),
	 ('[잡담]다들운동몇시간하시나요?','쑤우','헬스','다들 운동 몇시간 하십니까!! 궁금해서 여쭤봐요',NULL,'2021-11-27 21:46:29',0),
	 ('[잡담]다들 식단조절 하시나요?','양형','식단','다들 헬스장 다니면서 많은 분들이 식단조절을 하시는지 궁금합니다.!!',NULL,'2021-11-27 21:48:25',0),
	 ('[잡담]강남인근 헬스장 pt권 양도합니다.','쑤우','PT','사정상 PT를 못받게 되어 양도를 내놓게 되었습니다 ㅠㅠ 싸게 드립니다,, 가져가실분 구해요,',NULL,'2021-11-27 21:56:14',0),
	 ('[잡담]오늘가입했어용!!','환이','헬린이','안녕하세요 !! 잘부탁드립니다.
운동을 시작해보고 식단을 관리하고자 가입했습니다.!',NULL,'2021-11-28 14:01:43',0),
	 ('[식단] 오늘의 식단은..','규석강','식단','고구마 한개 바나나한개 댤걀2개 방울토마토 6개 먹었어요!!',NULL,'2021-11-28 14:05:31',0),
	 ('[홈트] 홈트레이닝도 도움이 많이 되는거 같네요!!','양형','홈트','집에서 영상보고 홈트 시작한지두 1달째!! 
홈트도 괜찮은거 같아요!!',NULL,'2021-11-28 14:06:41',0),
	 ('[잡담] 오늘 등산가기 좋은날씨네요..','규석강','등산','오늘 햇빛도 쨍쨍하고 미세먼지두 없고 등산가기 딱 좋은 날씨 같아요 !!',NULL,'2021-11-28 14:07:16',0);
INSERT INTO homet.freeboard (subject,nickname,hashtag,content,fimage,reg_date,like_cnt) VALUES
	 ('[잡담] 헬스 후 샐러드 먹기 좋은곳있을려나..','환이','헬스','ㅠㅠ 헬스장 끝나구 샐러드 사먹구싶은데 집주위에 없네요옹,,',NULL,'2021-11-28 14:11:10',0),
	 ('[잡담] 오늘 상체를,,','쑤우','헬스','상체를 빡시게 하고왔어요,,
만족,,,',NULL,'2021-11-28 14:14:31',0),
	 ('[잡담] 미역국 먹고싶당,,','환이','','냠냠',NULL,'2021-11-28 14:19:42',0),
	 ('[잡담] 단백질보충제 추천하는거 있나요옹?~','양형','보충제','보총제 한번 먹어보고싶어요오',NULL,'2021-11-28 14:21:35',0),
	 ('[잡담] 몸이 좋아지고이써,,','규석강','','크흐흐흐',NULL,'2021-11-28 14:39:49',0),
	 ('[잡담] 닭가슴살 사먹을꺼에여!!','환이','','호호',NULL,'2021-11-28 14:40:14',0),
	 ('[잡담] 행복 별거없숩니다,,헬스하세요','양형','','히히',NULL,'2021-11-28 14:40:36',0),
	 ('[잡담] 오늘은 하체를 합니덩,,','쑤우','헬스','어젠 상체 오늘 하체..',NULL,'2021-11-28 14:41:02',0),
	 ('[잡담] 운동하면서 무슨노래를 들을까용?..','규석강','','~!~!',NULL,'2021-11-28 14:41:24',0),
	 ('[잡담] 우리 트레이너쌤 너무 잘가르치는듯,,!!','환이','헬스','너무 잘가르쳐주는거 같아요 ',NULL,'2021-11-28 14:41:50',0);
INSERT INTO homet.freeboard (subject,nickname,hashtag,content,fimage,reg_date,like_cnt) VALUES
	 ('[잡담] 배고파요 ㅠㅠ','양형','','뭐먹징 >...?',NULL,'2021-11-28 14:42:22',0),
	 ('[잡담] 같이 헬스가실분,,','쑤우','헬스','같이하면 뭔가 더 잘될거같아서요!',NULL,'2021-11-28 14:42:56',0),
	 ('[잡담] 자세가 이상한가..','규석강','','몸이 아픈거같아요 ㅠㅠ',NULL,'2021-11-28 14:43:12',0),
	 ('[잡담] 런닝머신하면서 드라마 볼거 추천좀 ㅎㅎ','환이','헬스','드라마 보면서 뛰는게 좋아유~',NULL,'2021-11-28 14:43:45',0),
	 ('[잡담] 몸 만들고 스키장가야지..','규석강','','헤헤',NULL,'2021-11-28 14:44:10',0),
	 ('[잡담] 대회 나가보신분 있나요?','쑤우','헬스','열심히 해서 한번 도전하는것도 좋은거 같아요',NULL,'2021-11-28 14:44:36',0),
	 ('[잡담] 트레이닝복 사야겠당,,','양형','헬스','추천해주세요~!',NULL,'2021-11-28 14:45:03',0),
	 ('[출첵] 오늘부터 1일','사용자','#몸짱','오늘부터 운동한다 
','9b45e723-bc0f-4bb3-bb5f-f304d72a1d70몸짱.PNG','2021-11-27 20:44:14',0),
	 ('[출첵]형 헬스 등록한다.','양형','#헬스 #등록 #두근두근','이제 헬스 등록했다 ','316823e7-a090-4737-aba8-a5cff933970a아령.PNG','2021-11-27 21:02:32',0),
	 ('[식단] 식단 시작해요','김나영','#식단 #샐러드 #오늘부터 1일','식단 1일차 
샐러드를 만들었어요','cfa53fbe-386b-4f6c-b9c7-e923f96a9da3샐러드.PNG','2021-11-27 21:04:19',0);
INSERT INTO homet.freeboard (subject,nickname,hashtag,content,fimage,reg_date,like_cnt) VALUES
	 ('[질문] PT 1회 5만원인데 싼건가?','양형','#몸짱 #PT','헬스장에서 피티 추천 하는데 
싼건지 모르겠어요','95725296-663f-47ed-8405-7020439208fd아령.PNG','2021-11-27 21:07:27',0),
	 ('[잡담] 그냥 좋은 몸 살수 없나??','사용자','#몸짱 #구매 #작심삼일','이런거 사서 입고 다닐까?? 
ㅠㅜ','d00549e6-8c90-40c4-9274-a4407a5b7732구매.PNG','2021-11-27 21:09:21',0),
	 ('[추천] 심으뜸 유튜브 유익해요','김나영','#유튜브 #심으뜸 #홈트','유뷰트 보면서 운동하니깐 
홈트로 좋은거 같아요','3005968a-5b1e-46a0-854b-3438b32774b9TLA.PNG','2021-11-27 21:11:32',0),
	 ('[잡담] 최고 몸무게 찍었다','사용자','#시작부터요요 #몸무게','운동을 하는데 왜 
살이 찌냐??','62df37b0-a2ef-487d-a783-3c702b3873eeHELP.PNG','2021-11-27 21:15:51',0),
	 ('[잡담] 헬스장 환불 어떻게 받나요 ㅠㅜ','양형','#헬스 #환불','등록하고 한달에 2번 갔는데 
환불 어떻게 받나요 ','6334a890-99e5-4c2d-b381-9679a38b3fdeHELP.PNG','2021-11-27 21:18:31',0),
	 ('[잡담] 내 몸 어떰??','사용자','#몸짱 #헬린이','이제 막 1개월했는데 
이정도면 괜춘?','feec3a8a-6dcb-4439-b9bb-60f5a401c150나.PNG','2021-11-27 21:27:43',0),
	 ('[잡담] 헬스 환불 했..','양형','#헬스 #환불','할인할때 등록해서 
생각보다 많이 까이고 받음
손해본거 같다',NULL,'2021-11-27 21:34:55',0),
	 ('[식단] 오늘은 치팅데이','김나영','#식단 #치팅','나에게 주는 선물
','eb5abbdb-4cd4-4c83-91eb-cca67d4088ca치킨.PNG','2021-11-27 21:37:42',0),
	 ('[잡담] 이건 벌크업용이야','사용자','#벌크업 #떡볶이','벌그업엔 떡볶이지','9e1b3883-35af-4da3-9360-f3431da9eb4a떡.PNG','2021-11-27 21:44:23',0),
	 ('[필라테스] 필라테스 시작햇어요','김나영','#필라테스','혹시 좋은 필라테스 잇으면 추천해주세요',NULL,'2021-11-27 22:11:43',0);
INSERT INTO homet.freeboard (subject,nickname,hashtag,content,fimage,reg_date,like_cnt) VALUES
	 ('[등산] 등산!!!','양형','#등산','이제 주말마다 등산갑시다
피톤치드',NULL,'2021-11-27 22:13:10',0),
	 ('[홈트] 홈트 기구 어디서 사지?','사용자','#홈트','홈트 기구 세트로 살라면 어느정도 하지??
많이 비싼가??',NULL,'2021-11-27 22:14:57',0),
	 ('[잡담]역삼동 헬스장 추천좀요 ㅠㅠ','사용자','역삼동','헬스를 처음 시작하려는데!! 
가격좋구 기구많고,, 트레이너좋은곳 알려주세요...',NULL,'2021-11-27 21:45:40',0);
-- ---------------------------------------------------