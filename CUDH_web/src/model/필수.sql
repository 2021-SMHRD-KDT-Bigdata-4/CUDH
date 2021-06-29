-- 이미 한번 생성해서 지우는 코드
drop table professor_area cascade;
drop table professor_crop cascade;
drop table contract cascade;
drop table likelist cascade;
drop table board cascade;
drop table crop cascade;
drop table area cascade;
drop table professor cascade;
drop table member cascade;

-- 디비 생성 및 테이블 생성
create database bestcrop;
drop database bestcrop;
show databases;
show tables;

-- 테이블 생성
CREATE TABLE area (
    a_idx    INTEGER NOT NULL auto_increment,
    a_state  varchar(100),
    a_city   varchar(100),
    primary key(a_idx)
);

CREATE TABLE board (
    b_idx       INTEGER NOT NULL auto_increment,
    b_category  varchar(100),
    b_state     varchar(100),
    b_city      varchar(100),
    b_title     varchar(100),
    b_contents  varchar(10000),
    b_writer    varchar(100),
    b_views     INTEGER,
    b_likes     INTEGER,
    b_m_idx     INTEGER NOT NULL,
    primary key(b_idx)
);

-- ------------------------------통합시 참고!! 여기 수정했어요!!!
CREATE TABLE contract (
	con_idx    INTEGER NOT NULL auto_increment,
    con_m_idx  INTEGER NOT NULL,
    con_p_idx  INTEGER NOT NULL,
    con_date   date,
    con_about  varchar(10000),
    con_approval	varchar(100),
    primary key(con_idx, con_m_idx, con_p_idx)
);
-- ------------------------------통합시 참고!! 여기 수정했어요!!!


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


CREATE TABLE member (
    m_idx             INTEGER NOT NULL auto_increment,
    m_id              varchar(100) NOT NULL,
    m_pw              varchar(100) NOT NULL,
    m_name            varchar(100),
    m_farming         varchar(100),
    m_area            varchar(100),
    m_hoping_crop     varchar(100),
    m_board_counting  INTEGER,
    primary key(m_idx)
);

CREATE TABLE professor (
    p_idx	               INTEGER NOT NULL auto_increment,
    p_name              varchar(100),
    p_expertise			varchar(100),
    p_career            varchar(2000),
    p_consulting_price  varchar(100),
    primary key(p_idx)
);

CREATE TABLE professor_area (
    pa_p_idx  INTEGER NOT NULL,
    pa_a_idx  INTEGER NOT NULL
);
ALTER TABLE professor_area ADD CONSTRAINT relation_2_pk PRIMARY KEY ( pa_p_idx, pa_a_idx );

CREATE TABLE professor_crop (
    pc_p_idx  INTEGER NOT NULL,
    pc_c_idx  INTEGER NOT NULL
);
ALTER TABLE professor_crop ADD CONSTRAINT relation_3_pk PRIMARY KEY ( pc_p_idx, pc_c_idx );

CREATE TABLE likelist  (
    l_b_idx               INTEGER NOT NULL,
    l_m_idx				  INTEGER NOT NULL
);
ALTER TABLE likelist ADD CONSTRAINT like_pk PRIMARY KEY ( l_b_idx, l_m_idx );

ALTER TABLE board
    ADD CONSTRAINT board_member_fk FOREIGN KEY ( b_m_idx )
        REFERENCES member ( m_idx );

ALTER TABLE contract
    ADD CONSTRAINT relation_1_member_fk FOREIGN KEY ( con_m_idx )
        REFERENCES member ( m_idx );

ALTER TABLE contract
    ADD CONSTRAINT relation_1_professor_fk FOREIGN KEY ( con_p_idx )
        REFERENCES professor ( p_idx );

ALTER TABLE professor_area
    ADD CONSTRAINT relation_2_area_fk FOREIGN KEY ( pa_a_idx )
        REFERENCES area ( a_idx );

ALTER TABLE professor_area
    ADD CONSTRAINT relation_2_professor_fk FOREIGN KEY ( pa_p_idx )
        REFERENCES professor ( p_idx );
        
ALTER TABLE professor_crop
    ADD CONSTRAINT relation_3_crop_fk FOREIGN KEY ( pc_c_idx )
        REFERENCES crop ( c_idx );

ALTER TABLE professor_crop
    ADD CONSTRAINT relation_3_professor_fk FOREIGN KEY ( pc_p_idx )
        REFERENCES professor ( p_idx );  