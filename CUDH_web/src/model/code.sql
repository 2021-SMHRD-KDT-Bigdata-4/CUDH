select * from member;
select * from board;
DELETE FROM board WHERE b_idx = 5;
 insert into board(b_category, b_state, b_city, b_title, b_contents, b_writer,b_views ,b_m_idx)
		values('admin','admin','admin','admin','admin','admin',0,1);