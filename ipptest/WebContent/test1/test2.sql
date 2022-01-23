
# 1)
CREATE TABLE student (
	studno VARCHAR2(10) NOT NULL PRIMARY KEY,
	name VARCHAR2(10), 
	dept VARCHAR2(10),
	tel VARCHAR2(13),
	email VARCHAR2(20)
);

drop table sungjuk;
# 2)
CREATE TABLE sungjuk (
	studno VARCHAR2(10),
	subject VARCHAR2(20),
	scoredate DATE, 
	score VARCHAR2(10),
	grade VARCHAR2(10),
	division CHAR(1)
);

# 3) 
INSERT INTO student VALUES('201701', '��浿', '�İ�', '010-1111-1111', 'aaa@korea.com');
INSERT INTO student VALUES('201702', '�̱浿', '�濵', '010-1111-1112', 'bbb@korea.com');
INSERT INTO student VALUES('201703', '�ڱ浿', '��ȣ', '010-1111-1113', 'ccc@korea.com');
INSERT INTO student VALUES('201704', 'ȫ�浿', '�İ�', '010-1111-1114', 'ddd@korea.com');
INSERT INTO student VALUES('201705', '���浿', '����', '010-1111-1115', 'eee@korea.com');
INSERT INTO student VALUES('201706', '��浿', '�濵', '010-1111-1116', 'fff@korea.com');

INSERT INTO sungjuk VALUES('201701', '�İ�����', TO_DATE('20171220'), '90', 'A0', 'R');
INSERT INTO sungjuk VALUES('201703', 'Java', TO_DATE('20171220'), '95', 'A+', 'R');
INSERT INTO sungjuk VALUES('201705', '�İ�����', TO_DATE('20170625'), '85', 'B0', 'O');
INSERT INTO sungjuk VALUES('201701', 'Java', TO_DATE('20170625'), '96', 'A+', 'R');
INSERT INTO sungjuk VALUES('201701', '�����α׷���', TO_DATE('20151220'), '87', 'B+', 'O');
INSERT INTO sungjuk VALUES('201703', '��ȣ�а���', TO_DATE('20170625'), '84', 'B0', 'R');
INSERT INTO sungjuk VALUES('201705', '�����α׷���', TO_DATE('20170625'), '85', 'B+', 'O');

SELECT * FROM STUDENT;

SELECT * FROM SUNGJUK;


# 4)
SELECT A.STUDNO AS "�й�", A.NAME AS "����", B.SUBJECT AS "�����", 
B.SCORE AS "����", B.GRADE AS "���", TO_CHAR(B.SCOREDATE, 'YYYY/MM/DD') AS "������"
FROM STUDENT A, SUNGJUK B 
WHERE A.STUDNO = B.STUDNO;


# 5) 
INSERT INTO studnet VALUES (?,?,?,?,?);

# 6)
SELECT A.NAME AS "�̸�", SUM(B.SCORE) AS "����", AVG(B.SCORE) AS "���"
FROM STUDENT A, SUNGJUK B
WHERE A.STUDNO = B.STUDNO
GROUP BY A.NAME;



















