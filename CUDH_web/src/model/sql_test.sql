select p_expertise from professor GROUP BY p_expertise order by p_expertise asc;
select * from professor where p_expertise="영양학";


select * from member;

alter table contract add con_about varchar(100) not null;
alter table contract add con_date date   not null;
alter table contract add con_approval varchar(100)   not null;
alter table contract drop column c_aboutExpertise;

select * from contract;
insert into contract values(1,2,1,'2021-07-05','일단 신청할게요','n');--  순서) 멤버_idx,전문가_idx, 컨설팅 필요한 날짜, 컨설팅 요청한 이유, 승인여부
insert into contract values(2,5,4,'2021-07-01','내용은 수정할 수 있으니까','n');
insert into contract values(3,4,3,'2021-07-08','아무내용','n');

select * from professor;

insert into contract(con_m_idx, con_p_idx, con_date, con_about, con_approval)
        values(1,1,'2021-06-24','사과나무냉해','n');

select con_m_idx, con_p_idx, con_date, con_about, con_approval from contract;

delete from contract where con_m_idx=5 and con_p_idx=4;

update contract set con_approval='y' where con_idx=1;