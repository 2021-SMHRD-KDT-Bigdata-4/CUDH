-- 이미 한번 생성해서 지우는 코드
drop table professor_area cascade;
drop table professor_crop cascade;
drop table contract cascade;
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
    b_state      varchar(100),
    b_city      varchar(100),
    b_title     varchar(100),
    b_writer    varchar(100),
    b_contents  varchar(10000),
    b_views     INTEGER,
    m_idx       INTEGER NOT NULL,
    primary key(b_idx)
);

CREATE TABLE contract (
    m_idx  INTEGER NOT NULL,
    p_idx  INTEGER NOT NULL
);

ALTER TABLE contract ADD CONSTRAINT relation_1_pk PRIMARY KEY ( p_idx, m_idx );

CREATE TABLE crop (
    c_idx      INTEGER NOT NULL auto_increment,
    c_mc_crop  varchar(100),
    c_sc_crop  varchar(100),
    c_info     varchar(2000),
    primary key(c_idx)
);

CREATE TABLE professor_area (
    p_idx  INTEGER NOT NULL,
    a_idx  INTEGER NOT NULL
);

ALTER TABLE professor_area ADD CONSTRAINT relation_2_pk PRIMARY KEY ( p_idx, a_idx );

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
    p_idx               INTEGER NOT NULL auto_increment,
    p_name              varchar(100),
    p_expertise			varchar(100),
    p_career            varchar(2000),
    p_consulting_price  varchar(100),
    primary key(p_idx)
);
CREATE TABLE professor_crop (
    p_idx  INTEGER NOT NULL,
    c_idx  INTEGER NOT NULL
);
ALTER TABLE professor_crop ADD CONSTRAINT relation_3_pk PRIMARY KEY ( p_idx, c_idx );

ALTER TABLE board
    ADD CONSTRAINT board_member_fk FOREIGN KEY ( m_idx )
        REFERENCES member ( m_idx );

ALTER TABLE contract
    ADD CONSTRAINT relation_1_member_fk FOREIGN KEY ( m_idx )
        REFERENCES member ( m_idx );

ALTER TABLE contract
    ADD CONSTRAINT relation_1_professor_fk FOREIGN KEY ( p_idx )
        REFERENCES professor ( p_idx );

ALTER TABLE professor_area
    ADD CONSTRAINT relation_2_area_fk FOREIGN KEY ( a_idx )
        REFERENCES area ( a_idx );

ALTER TABLE professor_area
    ADD CONSTRAINT relation_2_professor_fk FOREIGN KEY ( p_idx )
        REFERENCES professor ( p_idx );
        
ALTER TABLE professor_crop
    ADD CONSTRAINT relation_3_crop_fk FOREIGN KEY ( c_idx )
        REFERENCES crop ( c_idx );

ALTER TABLE professor_crop
    ADD CONSTRAINT relation_3_professor_fk FOREIGN KEY ( p_idx )
        REFERENCES professor ( p_idx );  