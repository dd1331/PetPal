< Visual SVN Setting > 

1. Server ����
	(1) �ٿ�ε� 
		http://www.visualsvn.com/server/
		https://www.visualsvn.com/server/download/

	(2) ��ġ 
	    Standard Edition -> Next -> .. -> Start VisualSVN Server Manager üũ -> Finish
		cf) http://luyin.tistory.com/302
		
    (3) User���� 
	    <1> khs/123456789
		<2> ljm/123456789
		<3> jjh/123456789
		<4> kms/123456789

    (4) Group���� 
	    KhsGroup -> User Add.. 

    (5) Create New Repository
	    Regular FSFS repository ���� 
		-> "KhsRepo" 
		-> Empty repository 
		-> Customize permissions (Custom..��ư)
		-> EveryOne (No Access) 
		-> KhsGroup ( Read/Write )

		=> Repository URL 
		   - https://KHS-PC/svn/KhsRepo
		   

	(6) Server ���� Ȯ�� 	                
	    <1> VisualSVN Server (Local) -> ��Ŭ�� -> Start Ȯ�� 
        <2> Web Browser -> https://KHS-PC/svn/KhsRepo -> �α��� 



	Tip) Properties ����( ex: IP �Ǵ� Port���� )
	    <1> Port����
	     	VisualSVN Server (Local) -> ��Ŭ�� -> Properties -> Network ��

		<2> ���� ����� 
		    VisualSVN Server (Local) -> ��Ŭ�� -> Stop -> Start
		

2. Client ( Eclipse ) ����
	(1) �÷����� ��ġ 
	    Help -> Eclipse Marketplace -> Subclipse�� �˻�/��ġ

	(2) SVN ����� ���-��
	    Open Perspective -> SVN Repository Exploring -> Add SVN Repository
	        - URL : https://KHS-PC/svn/KhsRepo
			  ( �������� Accept Permanently ��ư -> ���� �α��� : ex) kms/123456789 )
	        - ���̵�: khs
	        - ��  ��: 123456789 

    

3. SVN ��� 
    (1) �ʼ� 
		<1> Initial import ( ������ ���� 1ȸ�� )
			Project Explorer -> ������Ʈ("OurPj") ��Ŭ�� -> Team -> Share Project 

		<2> Check Out ( ���常 ) 
			SVN Repository Exploring -> �ش� 'URL'�� ��Ŭ�� -> Check Out
			-> "Check out as a project in the workspace" ���� 
			-> ��) Project Name: "KhsRepo" 

			cf) Project Explorer -> "KhsRepo" Project ����Ȯ�� 

	    <3> Check Out ( �� ������ ) 
			SVN Repository Exploring -> �ش� '������Ʈ'(KhsRepo) ��Ŭ�� -> Check Out
			-> "Check out as a project in the workspace" ���� 
			-> ��) Project Name: "OurPj"
			
			cf) Project Explorer -> "OurPj[KhsRepo]" Project ����Ȯ��
			    -> Tomcat Server -> Add Project ( "OurPj[KhsRepo]" )
				-> server.xml ( "DBCP �߰�" )

	    <4> �۾� 
		    1> ����(��� �����)�� "OurPj"���� �۾�
			2> ������ ������ ������ ������������ �׽��� �� Commit!
			3> �ٸ� ����� "Update to HEAD"
		
    (2) �ֿ� 
		<1> Update to HEAD ( ������ ���� - Simple )
		<2> Update to Version  (������ Ư�� �������� ���� - Complex )

		<3> Commit 
			1> Update to HEAD -> Commit (�Ϲ����� ���)
			2> Revert -> ���� -> Commit (�߾ȵɶ�)

			cf) ? , * 

			(Ŀ�Կ����ذ�) http://iamadeveloper.tistory.com/7
	  
	(3) �ΰ� 
		<1> Synchronize with Repository ( ��ȭ�� ���� Ȯ�� )

		<2> Revert ( ������ ���� �ҽ��� �ٲ� )

		<3> Show History 

		<4> Disconnect ( ������ ���� ���� )
		     



    (����) ��α�
		<1> ���� ����   
		http://luyin.tistory.com/302

		<2> Ŭ���̾�Ʈ ���� 
		http://bonoken.tistory.com/389


    (����) ���÷� � ����� �� ��!
