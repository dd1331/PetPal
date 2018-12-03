create table QNA(
	QNO NUMBER(5) primary key, --�ѹ�
	TITLE VARCHAR2(50), --���Ӹ�
	ID VARCHAR2(20), --�۾��̾��̵�
	SUBJECT VARCHAR2(100), --����
	WDATE DATE, --�� ��¥
	CONTENT VARCHAR2(1000), --����
	REFER NUMBER, --�׷�
	LEV NUMBER, --����
	SEQ NUMBER, --������
	FNAME VARCHAR2(200), --�����̸�
	FSIZE NUMBER --����ũ��
);

CREATE SEQUENCE QNA_QNO_SEQ START WITH 0 INCREMENT BY 1 MINVALUE 0 NOCACHE NOCYCLE;

ALTER TABLE QNA ADD (CONSTRAINT QNA_QNO_PK PRIMARY KEY (QNO));
ALTER TABLE QNA ADD (CONSTRAINT QNA_ID_FK FOREIGN KEY(ID) REFERENCES MEMBER);

INSERT INTO QNA VALUES (QNA_QNO_SEQ.NEXTVAL, 'ȸ��/��������', 'mj', 'ȸ�������� ��� �ϳ���?', 
	SYSDATE, 'ȸ�� ������ �ϰ� �ͽ��ϴ�. ������ ���, ��� �� �� �ֳ���?', QNA_QNO_SEQ.CURRVAL, 0, 0, NULL, 0);
INSERT INTO QNA VALUES (QNA_QNO_SEQ.NEXTVAL, '���� ����', 'mj', '�ݷ������� ��� �ñ� �� �ֳ���?', 
	SYSDATE, '�ݷ����� ����� ���񽺸� �̿��ϰ� �ͽ��ϴ�. ���񽺸� ��� �̿� �� �� �ֳ���?', QNA_QNO_SEQ.CURRVAL, 0, 0, NULL, 0);
INSERT INTO QNA VALUES (QNA_QNO_SEQ.NEXTVAL, '����� ����', 'mj', '����� ������ ��� �� �� �ֳ���??', 
	SYSDATE, '����͸� �ϰ� �ͽ��ϴ�. ������ ���, ��� �� �� �ֳ���?', QNA_QNO_SEQ.CURRVAL, 0, 0, NULL, 0);