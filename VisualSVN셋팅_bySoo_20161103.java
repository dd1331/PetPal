< Visual SVN Setting > 

1. Server 셋팅
	(1) 다운로드 
		http://www.visualsvn.com/server/
		https://www.visualsvn.com/server/download/

	(2) 설치 
	    Standard Edition -> Next -> .. -> Start VisualSVN Server Manager 체크 -> Finish
		cf) http://luyin.tistory.com/302
		
    (3) User생성 
	    <1> khs/123456789
		<2> ljm/123456789
		<3> jjh/123456789
		<4> kms/123456789

    (4) Group생성 
	    KhsGroup -> User Add.. 

    (5) Create New Repository
	    Regular FSFS repository 선택 
		-> "KhsRepo" 
		-> Empty repository 
		-> Customize permissions (Custom..버튼)
		-> EveryOne (No Access) 
		-> KhsGroup ( Read/Write )

		=> Repository URL 
		   - https://KHS-PC/svn/KhsRepo
		   

	(6) Server 동작 확인 	                
	    <1> VisualSVN Server (Local) -> 우클릭 -> Start 확인 
        <2> Web Browser -> https://KHS-PC/svn/KhsRepo -> 로그인 



	Tip) Properties 변경( ex: IP 또는 Port변경 )
	    <1> Port변경
	     	VisualSVN Server (Local) -> 우클릭 -> Properties -> Network 탭

		<2> 서버 재시작 
		    VisualSVN Server (Local) -> 우클릭 -> Stop -> Start
		

2. Client ( Eclipse ) 셋팅
	(1) 플러그인 설치 
	    Help -> Eclipse Marketplace -> Subclipse로 검색/설치

	(2) SVN 저장소 등록-예
	    Open Perspective -> SVN Repository Exploring -> Add SVN Repository
	        - URL : https://KHS-PC/svn/KhsRepo
			  ( 팀원들은 Accept Permanently 버튼 -> 각자 로그인 : ex) kms/123456789 )
	        - 아이디: khs
	        - 비  번: 123456789 

    

3. SVN 기능 
    (1) 필수 
		<1> Initial import ( 팀장이 최초 1회만 )
			Project Explorer -> 프로젝트("OurPj") 우클릭 -> Team -> Share Project 

		<2> Check Out ( 팀장만 ) 
			SVN Repository Exploring -> 해당 'URL'에 우클릭 -> Check Out
			-> "Check out as a project in the workspace" 선택 
			-> 예) Project Name: "KhsRepo" 

			cf) Project Explorer -> "KhsRepo" Project 생성확인 

	    <3> Check Out ( 각 팀원들 ) 
			SVN Repository Exploring -> 해당 '프로젝트'(KhsRepo) 우클릭 -> Check Out
			-> "Check out as a project in the workspace" 선택 
			-> 예) Project Name: "OurPj"
			
			cf) Project Explorer -> "OurPj[KhsRepo]" Project 생성확인
			    -> Tomcat Server -> Add Project ( "OurPj[KhsRepo]" )
				-> server.xml ( "DBCP 추가" )

	    <4> 작업 
		    1> 각자(모든 멤버들)의 "OurPj"에서 작업
			2> 각자의 서버와 각자의 웹브라우져에서 테스팅 후 Commit!
			3> 다른 멤버들 "Update to HEAD"
		
    (2) 주요 
		<1> Update to HEAD ( 서버로 부터 - Simple )
		<2> Update to Version  (서버의 특정 시점으로 부터 - Complex )

		<3> Commit 
			1> Update to HEAD -> Commit (일반적인 방법)
			2> Revert -> 수정 -> Commit (잘안될때)

			cf) ? , * 

			(커밋에러해결) http://iamadeveloper.tistory.com/7
	  
	(3) 부가 
		<1> Synchronize with Repository ( 변화된 내용 확인 )

		<2> Revert ( 현재의 서버 소스로 바꿈 )

		<3> Show History 

		<4> Disconnect ( 삭제시 연결 해제 )
		     



    (참고) 블로그
		<1> 서버 셋팅   
		http://luyin.tistory.com/302

		<2> 클라이언트 셋팅 
		http://bonoken.tistory.com/389


    (주의) 수시로 쏘스 백업해 둘 것!
