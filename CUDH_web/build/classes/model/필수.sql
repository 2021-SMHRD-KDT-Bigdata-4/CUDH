drop table board cascade;
drop table crop cascade;
drop table professor cascade;
drop table member cascade;
drop database best_crop;

show databases;
show tables;
create database bestcrop;
CREATE TABLE board (
    board_num      INTEGER NOT NULL,
    board_title    varchar(30) NOT NULL,
    board_content  varchar(500) NOT NULL,
    board_grade    varchar(30) NOT NULL,
    member_num     INTEGER NOT NULL
);

ALTER TABLE board ADD CONSTRAINT board_pk PRIMARY KEY ( board_num );

CREATE TABLE crop (
    crop_num          INTEGER NOT NULL,
    crop_name         varchar(30) NOT NULL,
    crop_temperature  INTEGER,
    crop_info         varchar(50)
);

ALTER TABLE crop ADD CONSTRAINT crop_pk PRIMARY KEY ( crop_num );

CREATE TABLE member (
    member_num   INTEGER NOT NULL,
    member_id    varchar(30) NOT NULL,
    member_pw    varchar(30) NOT NULL,
    member_name  varchar(30) NOT NULL,
    farmer       varchar(30) NOT NULL,
    location     varchar(30) NOT NULL,
    telephone    varchar(30) NOT NULL,
    crob         varchar(30) NOT NULL,
    counselling  varchar(30) NOT NULL,
    premium      varchar(30) NOT NULL
);

ALTER TABLE member ADD CONSTRAINT user_pk PRIMARY KEY ( member_num );

CREATE TABLE professor (
    professor_num    INTEGER NOT NULL,
    professor_sub    varchar(30) NOT NULL,
    professor_name   varchar(30) NOT NULL,
    professor_price  varchar(30) NOT NULL,
    member_num       INTEGER NOT NULL
);

ALTER TABLE professor ADD CONSTRAINT professor_pk PRIMARY KEY ( professor_num );

ALTER TABLE board
    ADD CONSTRAINT board_user_fk FOREIGN KEY ( member_num )
        REFERENCES member ( member_num );

ALTER TABLE professor
    ADD CONSTRAINT professor_user_fk FOREIGN KEY ( member_num )
        REFERENCES member ( member_num );
        
        
        
        