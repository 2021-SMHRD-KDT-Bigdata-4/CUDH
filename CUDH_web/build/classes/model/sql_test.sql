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

select * from crop;

insert into contract(con_m_idx, con_p_idx, con_date, con_about, con_approval)
        values(1,1,'2021-06-24','사과나무냉해','n');

select con_m_idx, con_p_idx, con_date, con_about, con_approval from contract;

delete from contract where con_m_idx=5 and con_p_idx=4;

update contract set con_approval='y' where con_idx=1;


insert into crop values('1','전라남도','무안군','벼','14','17.5','33.3','11','-7.5',	'25.1','17.2','21.2','13.9','11.1','141.4','79','23','47.19','204.8','3.5','9.8','5');
CREATE TABLE crop (
    c_idx      INTEGER NOT NULL auto_increment,
    c_state  	varchar(100),
    c_city  	varchar(100),
    c_name     	varchar(100),
    
    a_tem  	varchar(100),
    ah_tem  	varchar(100),
    h_tem 	 	varchar(100),
    al_tem  	varchar(100),
    l_tem  		varchar(100),
    s_h_tem  	varchar(100),
    s_a_tem  	varchar(100),
    s_ah_tem  	varchar(100),
    s_al_tem  	varchar(100),
    s_l_tem  	varchar(100),
    
    precipitation  	varchar(100),
    a_humidity  	varchar(100),
    l_humidity  	varchar(100),
    insolation  	varchar(100),
    insolation_add  	varchar(100),
    a_wind_spd  	varchar(100),
    h_wind_spd  	varchar(100),
    sow_month  	varchar(100),   
    primary key(c_idx)
);

select a_tem, ah_tem, al_tem,precipitation, a_humidity,insolation,a_wind_spd , h_wind_spd from crop where c_name=#{c_name}


select a_tem, ah_tem, al_tem, precipitation, a_humidity, insolation, a_wind_spd, h_wind_spd from crop where c_name='논벼' and c_city='무안군';

;select a_tem, ah_tem, al_tem,precipitation, a_humidity,insolation,a_wind_spd , h_wind_spd from crop where c_name='벼' ;