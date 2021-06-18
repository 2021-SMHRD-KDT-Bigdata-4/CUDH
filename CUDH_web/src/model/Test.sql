show databases;
show tables;
select * from member;
insert into member values('1','admin','admin','관리자','a','a','a','a','a','a');
insert into member values('2','jgj','12345','장경진','a','a','a','a','a','a');
insert into member values('3','user','12345','사용자','a','a','a','a','a','a');
delete from member where member_num='1';
delete from member where member_num='2';
delete from member where member_num='3';
select * from member where member_id= '' and member_pw=#{member_pw}