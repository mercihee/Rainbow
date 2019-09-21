# Rainbow

# 환경설정
언어 : JAVA 8

프레임워크 : Spring 4.3.11

서버 : Apache Tomcat 8.5

데이터베이스 : Oracle 11g

기타기술 : JavaScript

운영체제 : MacOS

# 구현기능
- 회원가입 / 로그인
- 카테고리별 상품 목록
- 키워드 검색
- 상품 상세 페이지
- 장바구니
- 주문하기 / 주문 목록
- 상품 후기 / 댓글
- 상품 등록
- 회원 목록

# 프로젝트 규모
DB
- 테이블 8개 (총 컬럼 51개)
- 사용된 쿼리 44개

Source
- Controller Class 4개
- DTO (Data Transfer Object) Class 11개 - Service Class 3개
- DAO (Data Access Object) Class 3개
- Mapper Class 3개
- View (JSP File) 30개

<hr/>


# *회원가입*
: 폼 유효성 검사 후 패스워드는 BCrypt를 이용해 암호화하여 DB에 저장된다.
![join](Rainbow/src/main/webapp/resources/images/join.gif)

<hr/>

# *로그인*
: 입력한 이메일을 이용해 패스워드를 가져온 후 로그인 폼에 입력한 패스워드와 DB에 저장된 패스워드를 비교하여 로그인한다.
![login](Rainbow/src/main/webapp/resources/images/login.gif)

<hr/>



# *아이디 찾기*
: 회원가입시 입력한 닉네임과 연락처로 DB 검색 후 값이 있을시 값에 해당하는 이메일을 출력한다.
![findid](Rainbow/src/main/webapp/resources/images/findid.gif)

<hr/>



# *비밀번호 찾기 / 변경*
: 입력한 이메일이 회원 테이블에 있을시에만 JavaMail을 통해 비밀번호를 변경하는 폼을 메일로 발송한다.
![findpass](Rainbow/src/main/webapp/resources/images/findpass.gif)

![uppass](Rainbow/src/main/webapp/resources/images/uppass.gif)

<hr/>



# *카테고리별 상품 목록*
![category](Rainbow/src/main/webapp/resources/images/category.gif)

<hr/>



# *키워드 검색*
- 키워드를 검색하면 해당 키워드가 들어간 상품이 출력된다. 
- 카테고리별 상품 목록과 같이 이미지나 상품 이름을 클릭하면 해당 상품의 상세 페이지로 넘어간다.
![search](Rainbow/src/main/webapp/resources/images/search.gif)

<hr/>



# *장바구니*
: 상품 상세 페이지에서 Ajax를 통해 장바구니에 담긴다. 해당 상품이 이미 담겨있을 땐 중복 방지를 위해 수량만 업데이트 된다.
![addcart](Rainbow/src/main/webapp/resources/images/addcart.gif)

<hr/>



# *주문하기*
- 장바구니에서 선택한 상품만 출력된다.
- 주소 API를 이용해 우편번호와 주소를 입력하여 주문이 진행된다.
- 주문 완료한 상품은 장바구니에서 사라진다.
![order](Rainbow/src/main/webapp/resources/images/order.gif)



# *주문 목록*
- 회원이 지금까지 주문한 주문 목록이 주문번호로 나뉘어서 출력된다. 
- 주문번호를 통해 해당 주문의 상세 정보 페이지로 이동이 가능하다.
![orderlist](Rainbow/src/main/webapp/resources/images/orderlist.gif)

<hr/>



# *리뷰 등록*
- 해당 아이디로 주문한 상품만 후기글을 작성할 수 있으며 자신의 글에만 ‘수정’, ‘삭제’ 버튼이 보인다. 
![orderreview](Rainbow/src/main/webapp/resources/images/orderreview.gif)

- 상품을 구매하지 않으면 리뷰를 등록할 수 없다.
![norderrv](Rainbow/src/main/webapp/resources/images/norderrv.gif)

<hr/>



# *댓글*
- 개인정보보호로 회원의 닉네임과 댓글 내용, 날짜만 출력된다.
![reply](Rainbow/src/main/webapp/resources/images/reply.gif)

- 댓글 기능 또한 비로그인은 이용할 수 없다.
- ‘댓글은 로그인 후 이용 가능 합니다.’의 ‘로그인’에 로그인 페이지 링크를 걸어둬서 바로 이동 가능하다.
![nreply](Rainbow/src/main/webapp/resources/images/nreply.gif)

