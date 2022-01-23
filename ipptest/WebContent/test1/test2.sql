
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
INSERT INTO student VALUES('201701', '김길동', '컴공', '010-1111-1111', 'aaa@korea.com');
INSERT INTO student VALUES('201702', '이길동', '경영', '010-1111-1112', 'bbb@korea.com');
INSERT INTO student VALUES('201703', '박길동', '간호', '010-1111-1113', 'ccc@korea.com');
INSERT INTO student VALUES('201704', '홍길동', '컴공', '010-1111-1114', 'ddd@korea.com');
INSERT INTO student VALUES('201705', '조길동', '전자', '010-1111-1115', 'eee@korea.com');
INSERT INTO student VALUES('201706', '백길동', '경영', '010-1111-1116', 'fff@korea.com');

INSERT INTO sungjuk VALUES('201701', '컴공개론', TO_DATE('20171220'), '90', 'A0', 'R');
INSERT INTO sungjuk VALUES('201703', 'Java', TO_DATE('20171220'), '95', 'A+', 'R');
INSERT INTO sungjuk VALUES('201705', '컴공개론', TO_DATE('20170625'), '85', 'B0', 'O');
INSERT INTO sungjuk VALUES('201701', 'Java', TO_DATE('20170625'), '96', 'A+', 'R');
INSERT INTO sungjuk VALUES('201701', '웹프로그래밍', TO_DATE('20151220'), '87', 'B+', 'O');
INSERT INTO sungjuk VALUES('201703', '간호학개론', TO_DATE('20170625'), '84', 'B0', 'R');
INSERT INTO sungjuk VALUES('201705', '웹프로그래밍', TO_DATE('20170625'), '85', 'B+', 'O');

SELECT * FROM STUDENT;

SELECT * FROM SUNGJUK;


# 4)
SELECT A.STUDNO AS "학번", A.NAME AS "성명", B.SUBJECT AS "과목명", 
B.SCORE AS "점수", B.GRADE AS "등급", TO_CHAR(B.SCOREDATE, 'YYYY/MM/DD') AS "산정일"
FROM STUDENT A, SUNGJUK B 
WHERE A.STUDNO = B.STUDNO;


# 5) 
INSERT INTO studnet VALUES (?,?,?,?,?);

# 6)
SELECT A.NAME AS "이름", SUM(B.SCORE) AS "총점", AVG(B.SCORE) AS "평균"
FROM STUDENT A, SUNGJUK B
WHERE A.STUDNO = B.STUDNO
GROUP BY A.NAME;



















