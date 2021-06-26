.
--m_idx ,m_id ,m_pw ,m_name ,m_farming , m_area,m_hoping_crop, m_board_counting   
insert into member values(1,'admin','admin','관리자','admin','admin','admin',0);
insert into member values(2,'cgj','12345','최강준','no','전남','사과',0);
insert into member values(3,'ghg','12345','고희경','no','전남','배',0);
insert into member values(4,'kse','12345','김성은','no','전남','포도',0);
insert into member values(5,'pyb','12345','박윤빈','yes','전남','비트',0);
insert into member values(6,'jgj','12345','장경진','yes','전남','벼','0');-- 숫자 2가지방식 다 들어감

--p_idx, p_name, p_expertise, p_career, p_consulting_price
insert into professor values('1','김사과','영양학','사과학 박사','40');
insert into professor values('2','이귤귤','영양학','겨울 귤 예측학 저자','35');
insert into professor values('3','박감감','질병학','닭토란 고정 패널','40');
insert into professor values('4','장비트','질병학','비트수확의 혁신 드랍 더 비트 저자','50');
insert into professor values('5','최벼벼','영양학','전남 벼 관련 특허 보유','전화 컨택후 협상');
insert into professor values('6','고배추','육종학','김장용 배추 연구','25');
insert into professor values('7','정포도','육종학','국내 와인용 포도 일인자','50');
insert into professor values('8','김무우','질병학','무름병 예방 연구','40');
insert into professor values('9','신감자','영양학','얘 봄감자가 맛있단다 저자','전화 컨택후 협상');

insert into area values('1','전라남도','나주시');
insert into area values('2','전라남도','순천시');
insert into area values('3','전라남도','장흥시');
insert into area values('4','전라남도','여수시');

insert into board values('1','공지사항','전국','전국','커뮤니티 전체 공지','도배 및 다툼금지','관리자','2',0 , 1);
insert into board values('2','공지사항','전국','전국','커뮤니티 전체 공지2','게시판 주의사항','관리자','1',0 , 1);

insert into crop values('1','사과','과일','사과는 사과사과');
insert into crop values('2','귤','과일','귤은 귤귤');
insert into crop values('3','감','과일','감은 감감');
insert into crop values('4','배','과일','배는 배배');
insert into crop values('5','포도','과일','포도는 포도포도');


-- ------------------------------통합시 참고!! 여기 수정했어요!!!
insert into contract values(1,2,1,'2021-07-05','일단 신청할게요','n');--  순서) 멤버_idx,전문가_idx, 컨설팅 필요한 날짜, 컨설팅 요청한 이유, 승인여부
insert into contract values(2,5,4,'2021-07-01','내용은 수정할 수 있으니까','n');
insert into contract values(3,4,3,'2021-07-08','아무내용','n');
-- ------------------------------통합시 참고!! 여기 수정했어요!!!


insert into professor_area values(1,1); --전문가_idx, 지역_idx
insert into professor_area values(1,2);
insert into professor_area values(1,3);

insert into professor_crop values(1,1); --전문가_idx, 작물_idx
insert into professor_crop values(1,2);
insert into professor_crop values(1,3);

insert into likelist values(1,1);
insert into likelist values(1,2);