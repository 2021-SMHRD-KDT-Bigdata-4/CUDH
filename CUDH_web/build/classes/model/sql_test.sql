select p_expertise from professor GROUP BY p_expertise order by p_expertise asc;
select * from professor where p_expertise="영양학";


select * from member;

alter table contract add con_about varchar(100)  not null;
alter table contract add con_date date   not null;
alter table contract add con_approval varchar(100)   not null;
alter table contract drop column c_aboutExpertise;
select * from contract;

insert into contract values(2,1,'2021-07-05','일단 신청할게요','n');--  순서) 멤버_idx,전문가_idx, 컨설팅 필요한 날짜, 컨설팅 요청한 이유, 승인여부
insert into contract values(5,4,'2021-07-01','내용은 수정할 수 있으니까','n');

select * from professor;

insert into contract(con_m_idx, con_p_idx, con_about, con_date, con_approval)
        values(1,1,'사과나무냉해','2021-06-24','n');

select * from contract;