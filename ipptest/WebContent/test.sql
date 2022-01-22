# 1)
drop table DM_tBL;

CREATE TABLE DM_TBL (
   dmno NUMBER(8) NOT NULL PRIMARY KEY,
   custid VARCHAR2(10),
   maildate DATE,
   contents VARCHAR2(13),
   dept CHAR(2),
   grade CHAR(1),
   campain CHAR(2));

# 2)   
   CREATE TABLE bookinfo_tbl (
   custid VARCHAR2(10) NOT NULL PRIMARY KEY,
   author VARCHAR2(20),
   goods VARCHAR2(10),
   phone VARCHAR2(13),
   email VARCHAR2(20),
   area VARCHAR2(20));
   
# 3)    
   INSERT INTO DM_TBL VALUES(1, 'aaa', TO_DATE('20171201'), '안녕하세요?', '10', '1', 'C1');
   INSERT INTO DM_TBL VALUES(2, 'bbb', TO_DATE('20171201'), '안녕하세요?', '10', '2', 'C1');
   INSERT INTO DM_TBL VALUES(3, 'ccc', TO_DATE('20171201'), '안녕하세요?', '10', '3', 'C1');
   INSERT INTO DM_TBL VALUES(4, 'ddd', TO_DATE('20171224'), '안녕하세요?', '20', 'V', 'C2');
   INSERT INTO DM_TBL VALUES(5, 'eee', TO_DATE('20171224'), '안녕하세요?', '20', 'W', 'C2');
   INSERT INTO DM_TBL VALUES(6, 'fff', TO_DATE('20171224'), '안녕하세요?', '30', '1', 'C3');
   INSERT INTO DM_TBL VALUES(7, 'fff', TO_DATE('20171224'), '안녕하세요?', '30', '1', 'C3');
     
   INSERT INTO bookinfo_tbl VALUES('aaa', '김고객', '의류', '010-1111-1111', 'aaa@korea.com', '서울');
   INSERT INTO bookinfo_tbl VALUES('bbb', '이고객', '의류', '010-1111-1112', 'bbb@korea.com', '서울');
   INSERT INTO bookinfo_tbl VALUES('ccc', '박고객', '식료품', '010-1111-1113', 'ccc@korea.com', '경기');
   INSERT INTO bookinfo_tbl VALUES('ddd', '홍고객', '공산품', '010-1111-1114', 'ddd@korea.com', '대전');
   INSERT INTO bookinfo_tbl VALUES('eee', '조고객', '컴퓨터', '010-1111-1115', 'eee@korea.com', '대전');
   INSERT INTO bookinfo_tbl VALUES('fff', '백고객', '관광', '010-1111-1116', 'fff@korea.com', '울산');
   
   
   
   SELECT * FROM DM_TBL;
   
   SELECT * FROM bookinfo_tbl;
   
   
# 4) 
SELECT A.DMNO AS "발송번호", A.CUSTID AS "고객ID", B.AUTHOR AS "고객명", TO_CHAR(A.MAILDATE,'YYYY-MM-DD') AS "발송일", A.CONTENTS AS "내용", A.CAMPAIN AS "캠페인구분" 
FROM DM_TBL A, BOOKINFO_TBL B
WHERE A.CUSTID = B.CUSTID;


# 6) COUNT(*) 로 해도 됨! 
SELECT COUNT(A.CONTENTS) AS "DM 발송 건수", B.AREA AS "지역"
   FROM DM_TBL A, BOOKINFO_TBL B
   WHERE A.CUSTID = B.CUSTID
   GROUP BY B.AREA
   ORDER BY B.AREA ASC;



   
CREATE TABLE CUSTOM_01 (
	p_id VARCHAR2(10) NOT NULL PRIMARY KEY,
	p_pw VARCHAR2(10),
	c_name VARCHAR2(20),
	c_email VARCHAR2(20), 
	c_tel VARCHAR2(14)
);

INSERT INTO CUSTOM_01 VALUES('aaa', '1234', '김회원', 'aaa@korea.com', '010-1111-1111');
INSERT INTO CUSTOM_01 VALUES('bbb', '1234', '이회원', 'bbb@korea.com', '010-1111-1112');
INSERT INTO CUSTOM_01 VALUES('ccc', '1234', '박회원', 'ccc@korea.com', '010-1111-1113');
INSERT INTO CUSTOM_01 VALUES('ddd', '1234', '오회원', 'ddd@korea.com', '010-1111-1114');
INSERT INTO CUSTOM_01 VALUES('eee', '1234', '최회원', 'eee@korea.com', '010-1111-1115');
INSERT INTO CUSTOM_01 VALUES('fff', '1234', '조회원', 'fff@korea.com', '010-1111-1116');

SELECT * FROM CUSTOM_01;
























   
   
   
   