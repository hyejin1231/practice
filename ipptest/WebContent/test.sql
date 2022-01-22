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
   INSERT INTO DM_TBL VALUES(1, 'aaa', TO_DATE('20171201'), '�ȳ��ϼ���?', '10', '1', 'C1');
   INSERT INTO DM_TBL VALUES(2, 'bbb', TO_DATE('20171201'), '�ȳ��ϼ���?', '10', '2', 'C1');
   INSERT INTO DM_TBL VALUES(3, 'ccc', TO_DATE('20171201'), '�ȳ��ϼ���?', '10', '3', 'C1');
   INSERT INTO DM_TBL VALUES(4, 'ddd', TO_DATE('20171224'), '�ȳ��ϼ���?', '20', 'V', 'C2');
   INSERT INTO DM_TBL VALUES(5, 'eee', TO_DATE('20171224'), '�ȳ��ϼ���?', '20', 'W', 'C2');
   INSERT INTO DM_TBL VALUES(6, 'fff', TO_DATE('20171224'), '�ȳ��ϼ���?', '30', '1', 'C3');
   INSERT INTO DM_TBL VALUES(7, 'fff', TO_DATE('20171224'), '�ȳ��ϼ���?', '30', '1', 'C3');
     
   INSERT INTO bookinfo_tbl VALUES('aaa', '���', '�Ƿ�', '010-1111-1111', 'aaa@korea.com', '����');
   INSERT INTO bookinfo_tbl VALUES('bbb', '�̰�', '�Ƿ�', '010-1111-1112', 'bbb@korea.com', '����');
   INSERT INTO bookinfo_tbl VALUES('ccc', '�ڰ�', '�ķ�ǰ', '010-1111-1113', 'ccc@korea.com', '���');
   INSERT INTO bookinfo_tbl VALUES('ddd', 'ȫ��', '����ǰ', '010-1111-1114', 'ddd@korea.com', '����');
   INSERT INTO bookinfo_tbl VALUES('eee', '����', '��ǻ��', '010-1111-1115', 'eee@korea.com', '����');
   INSERT INTO bookinfo_tbl VALUES('fff', '���', '����', '010-1111-1116', 'fff@korea.com', '���');
   
   
   
   SELECT * FROM DM_TBL;
   
   SELECT * FROM bookinfo_tbl;
   
   
# 4) 
SELECT A.DMNO AS "�߼۹�ȣ", A.CUSTID AS "��ID", B.AUTHOR AS "����", TO_CHAR(A.MAILDATE,'YYYY-MM-DD') AS "�߼���", A.CONTENTS AS "����", A.CAMPAIN AS "ķ���α���" 
FROM DM_TBL A, BOOKINFO_TBL B
WHERE A.CUSTID = B.CUSTID;


# 6) COUNT(*) �� �ص� ��! 
SELECT COUNT(A.CONTENTS) AS "DM �߼� �Ǽ�", B.AREA AS "����"
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

INSERT INTO CUSTOM_01 VALUES('aaa', '1234', '��ȸ��', 'aaa@korea.com', '010-1111-1111');
INSERT INTO CUSTOM_01 VALUES('bbb', '1234', '��ȸ��', 'bbb@korea.com', '010-1111-1112');
INSERT INTO CUSTOM_01 VALUES('ccc', '1234', '��ȸ��', 'ccc@korea.com', '010-1111-1113');
INSERT INTO CUSTOM_01 VALUES('ddd', '1234', '��ȸ��', 'ddd@korea.com', '010-1111-1114');
INSERT INTO CUSTOM_01 VALUES('eee', '1234', '��ȸ��', 'eee@korea.com', '010-1111-1115');
INSERT INTO CUSTOM_01 VALUES('fff', '1234', '��ȸ��', 'fff@korea.com', '010-1111-1116');

SELECT * FROM CUSTOM_01;
























   
   
   
   