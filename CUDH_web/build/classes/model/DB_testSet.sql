
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

insert into crop values('1','전라남도','목포시','벼','14','17.5','33.3','11','-7.5',	'25.1','17.2','21.2','13.9','11.1','141.4','79','23','47.19','204.8','3.5','9.8','5');
insert into crop values('2','전라남도','여수시','벼','15.1','18.6','32.6','12.2','-7','26.5','18','21.3','15.2','12.5','139.4','76','27','51.21','222.2','3.4','12','5');
insert into crop values('3','전라남도','광주시','벼','14.5','19.6','34.4','10.5','-8.9','30.1','18.8','24.4','14.2','	10.4','96.8','73','12','48.59','221.3','1.7','7.2','5');
insert into crop values('4','전라남도','목포시','포도','14','17.5','33.3','11','-7.5','19.3','7.4','11.6','3.7','-2.4','28.8','67','18','64.13','238.5','4.3','12.4','3');
insert into crop values('5','전라남도','여수시','포도','15.1','18.6','32.6','12.2','-7','19.4','9.9','14.1','5.9','0.3','52.3','60','17','67','249.1','4.2','16.7','3');
insert into crop values('6','전라남도','광주시','포도','14.5','19.6','34.4','10.5','-8.9','23.3','9','15.2','3.8','-2.2','43.5','58','1','65.07','242','1.7','7.9','3');
insert into crop values('7','전라남도','목포시','대파','14','17.5','33.3','11','-7.5','19.3','7.4','11.6','3.7','-2.4','28.8','67','18','64.13','238.5','4.3','12.4','3');
insert into crop values('8','전라남도','여수시','대파','15.1','18.6','32.6','12.2','-7','19.4','9.9','14.1','5.9','0.3','52.3','60','17','67','249.1','4.2','16.7','3');
insert into crop values('9','전라남도','광주시','대파','14.5','19.6','34.4','10.5','-8.9','23.3','9','15.2','3.8','-2.2','43.5','58','1','65.07','242','1.7','7.9','3');


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