
--m_idx ,m_id ,m_pw ,m_name ,m_farming , m_area,m_hoping_crop, m_board_counting   
insert into member values(1,'admin','admin','관리자','admin','admin','admin',0);
insert into member values(2,'cgj','12345','최강준','no','전남','사과',0);
insert into member values(3,'ghg','12345','고희경','no','전남','배',0);
insert into member values(4,'kse','12345','김성은','no','전남','포도',0);
insert into member values(5,'pyb','12345','박윤빈','yes','전남','비트',0);
insert into member values(6,'jgj','12345','장경진','yes','전남','벼','0');-- 숫자 2가지방식 다 들어감

--p_idx, p_name, p_expertise, p_career, p_consulting_price
insert into professor values('1','김사과','농업경영','서울대학교 농경제학과 \n - 경영학 석사','40만원');
insert into professor values('2','이귤귤','농업경영','스인개은행 상무이사 \n - 경영 지도사','35만원');
insert into professor values('3','박감감','농업경영','경진대학, 희경대학 교수 \n - 경영학 박사','40만원');
insert into professor values('4','장비트','농업기술','강준경영컨설팅그룹(주) 이사 \n - 기술 지도사','50만원');
insert into professor values('5','최벼벼','농업기술','빈건축사 사무소 대표 \n - 건축기술사','전화 컨택후 협상');
insert into professor values('6','고배추','농업기술','최강환경 이사 \n - 대기환경기사','25만원');
insert into professor values('7','정포도','농업회계','성은회계사 사무소 대표 \n - 공인회계사','50만원');
insert into professor values('8','김무우','농업회계','성우회계사 사무소 대표 \n - 세무사','40만원');
insert into professor values('9','신감자','농업회계','코언디흐 경영컨설팅 대표 \n - 경영지도사','전화 컨택후 협상');

insert into area values('1','전라남도','나주시');
insert into area values('2','전라남도','순천시');
insert into area values('3','전라남도','장흥시');
insert into area values('4','전라남도','여수시');

insert into board values('1','공지사항','전국','전지역','커뮤니티 전체 공지','도배 및 다툼금지','관리자','2',0 , 1);
insert into board values('2','공지사항','전국','전지역','커뮤니티 회원님들께 알립니다','도배 및 다툼금지','관리자','2',0 , 1);
insert into board values('3','공지사항','전국','전지역','컨설팅에 대해 알립니다.','컨설팅 주의사항','관리자','1',0 , 1);
insert into board values('4','공지사항','전국','전지역','의견사항에 대해 남기는법.','의견사항 제출시 주의법','관리자','1',0 , 1);
insert into board values('5','공지사항','전국','전지역','전문가 등록방법.','전문가 등록방법','관리자','1',0 , 1);

insert into crop values('1','전라남도','무안군','논벼','14','17.5','33.3','11','-7.5',	'25.1','17.2','21.2','13.9','11.1','141.4','79','23','47.19','204.8','3.5','9.8','5');
insert into crop values('2','전라남도','순천시','논벼','15.1','18.6','32.6','12.2','-7','26.5','18','21.3','15.2','12.5','139.4','76','27','51.21','222.2','3.4','12','5');
insert into crop values('3','전라남도','나주시','논벼','14.5','19.6','34.4','10.5','-8.9','30.1','18.8','24.4','14.2','	10.4','96.8','73','12','48.59','221.3','1.7','7.2','5');
insert into crop values('4','전라남도','무안군','포도','14','17.5','33.3','11','-7.5','19.3','7.4','11.6','3.7','-2.4','28.8','67','18','64.13','238.5','4.3','12.4','3');
insert into crop values('5','전라남도','순천시','포도','15.1','18.6','32.6','12.2','-7','19.4','9.9','14.1','5.9','0.3','52.3','60','17','67','249.1','4.2','16.7','3');
insert into crop values('6','전라남도','나주시','포도','14.5','19.6','34.4','10.5','-8.9','23.3','9','15.2','3.8','-2.2','43.5','58','1','65.07','242','1.7','7.9','3');
insert into crop values('7','전라남도','무안군','대파','14','17.5','33.3','11','-7.5','19.3','7.4','11.6','3.7','-2.4','28.8','67','18','64.13','238.5','4.3','12.4','3');
insert into crop values('8','전라남도','순천시','대파','15.1','18.6','32.6','12.2','-7','19.4','9.9','14.1','5.9','0.3','52.3','60','17','67','249.1','4.2','16.7','3');
insert into crop values('9','전라남도','나주시','대파','14.5','19.6','34.4','10.5','-8.9','23.3','9','15.2','3.8','-2.2','43.5','58','1','65.07','242','1.7','7.9','3');


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

select * from board;
delete from board where b_idx=9;