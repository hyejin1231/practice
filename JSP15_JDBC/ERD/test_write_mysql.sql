create  table test_write
(
	wr_uid int not null auto_increment,
	wr_subject varchar(20) not null,
	wr_content text,
	wr_name varchar(20) not null,
	wr_viewcnt int default 0,
	wr_regdate datetime default now(),
	primary key (wr_uid)
	
);


INSERT INTO test_write
	(wr_subject, wr_content, wr_name)
VALUES 
	('첫번째글: 안녕하세요' , '안녕', '박혜진'),
	('두번째글: 하이하이', '하이', '하이'),
	('세번째글: 라일락', '라일락', '라일락'),
	('네번째글: ...' , '...', '아아아'),
	('다섯번째글: 연습', '연습', '혜진')
	;  
	
