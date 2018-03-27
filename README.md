# 파이널 프로젝트
- **분대장** : 김종민(회원[가입,수정,탈퇴],로그인)
- **상등병** : 서   진()
- **일등병** : 김승태()
- **이등병** : 김태규()
- **무등병** : 김재겸()

- **jsp**  : 템플릿 참고
- **css**  : 자기이름.css 생성한 것에 파트마다 주석 잘달면서 작성
- **JS**   : 해당파트명.js 생성해서 작성(reservation.js)
- **JAVA** : 아파치 톰캣 8.0
- JAVA 소스 경로명(패키지명)
com.army.이니셜+해당파트.상세업무명 => 클래스명

com.army.jmNoticeBoard.controller => BoardListController

- **리퀘스트매핑** : jmNoticeBoard.do
- **DATABASE**
- 게시글 번호는 시퀀스로 만들기
- 디비칼럼명 통일 => 글번호는 _NO로 통일(RENTAL_BOARD_NO), 외래키 ID는 ID
- 게시판 => 서비스_BOARD_칼럼 (RENTAL_BOARD_TITLE)
- 개발   => 서비스_칼럼       (MOVIE_TITLE) : VO의 변수명은 디비 칼럼명이랑 동일!! => 스네이크 케이싱으로 만들기(MOVIE_TITLE)
- mapper xml : 업무명-mapper.xml (**단 흔한 업무일 경우 이니셜도 붙일것** : st-board-mapper.xml)


- **이미지 파일 네이밍**(경로 : resources/images/폴더명 )
- '3글자_' 로 통일 (정렬 잘되고 업무별로 이미지 구분이 쉽게 하기 위함)
- 임시 이미지: tmp_  아이콘 : ico_ 스몰 : sml_ 미들 : mdl_ 라지 : lrg_

- **※poster폴더에 포스터 이미지파일 올릴때 주의**
- ex) 마이페이지에서만 사용하는 포스터 이미지 파일이라면
- mypage_thor.jpg( 업무명_파일명 )
