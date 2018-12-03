create table QNA(
	QNO NUMBER(5) primary key, --넘버
	TITLE VARCHAR2(50), --말머리
	ID VARCHAR2(20), --글쓴이아이디
	SUBJECT VARCHAR2(100), --제목
	WDATE DATE, --쓴 날짜
	CONTENT VARCHAR2(1000), --내용
	REFER NUMBER, --그룹
	LEV NUMBER, --레벨
	SEQ NUMBER, --시퀀스
	FNAME VARCHAR2(200), --파일이름
	FSIZE NUMBER --파일크기
);

CREATE SEQUENCE QNA_QNO_SEQ START WITH 0 INCREMENT BY 1 MINVALUE 0 NOCACHE NOCYCLE;

ALTER TABLE QNA ADD (CONSTRAINT QNA_QNO_PK PRIMARY KEY (QNO));
ALTER TABLE QNA ADD (CONSTRAINT QNA_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER);

INSERT INTO QNA VALUES (QNA_QNO_SEQ.NEXTVAL, '회원/정보관리', 'mj', '회원가입은 어떻게 하나요?', 
	SYSDATE, '회원 가입을 하고 싶습니다. 가입은 어디서, 어떻게 할 수 있나요?', QNA_QNO_SEQ.CURRVAL, 0, 0, NULL, 0);
INSERT INTO QNA VALUES (QNA_QNO_SEQ.NEXTVAL, '서비스 설명', 'mj', '반려동물을 어떻게 맡길 수 있나요?', 
	SYSDATE, '반려동물 펫시터 서비스를 이용하고 싶습니다. 서비스를 어떻게 이용 할 수 있나요?', QNA_QNO_SEQ.CURRVAL, 0, 0, NULL, 0);
INSERT INTO QNA VALUES (QNA_QNO_SEQ.NEXTVAL, '펫시터 지원', 'mj', '펫시터 지원은 어떻게 할 수 있나요??', 
	SYSDATE, '펫시터를 하고 싶습니다. 지원은 어디서, 어떻게 할 수 있나요?', QNA_QNO_SEQ.CURRVAL, 0, 0, NULL, 0);