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
-- likes
create table likes(
   lidx int auto_increment,
   nickname varchar(30),
   fidx int,
   primary key(lidx),
   foreign key(nickname) references users(nickname),
   foreign key(fidx) references freeboard(fidx)
);
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