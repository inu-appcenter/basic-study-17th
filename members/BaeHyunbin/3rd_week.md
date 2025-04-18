# HTTP란?
## HTTP 프로토콜의 의미
웹과 앱에서 정보를 주고받기 위해 사용(웹 브라우저와 웹 서버가 통신하기 위해 설계됨)
HTML 문서를 가져오기 위한 프로토콜, 데이터 통신 규칙 체계
하이퍼미디어 문서를 주고받기 위해서 만들어짐
->클라이언트와 서버가 통신할 때 쓰는 약속이다!

TCP프로토콜(데이터가 원래 순서댜로 전송되도록)을 기반으로 만들어졌다. 즉, 데이터 왜곡을 걱정하지 않아도 된다.
'모든 통신은 요청 한번에 응답 한번이 일대일로 대응된다. 단, 모든 요청은 서로 독립적이로 클라이언트의 상태 기억하지않음'
기본 포트: 80번

### 참고 curl 명령어
<!--Table-->
|Code|Meaning|
|:--:|:--:|
|-k|https를 인증없이 연결한다.|
|-L|리다이렌션을 따라 최종응답을 보낸다.|
|-v|http응답 전체를 출력한다.|
|-d "data"|요청에 데이터를 같이 보낸다.|
|-X "method|POST, GET, DELETE, PUT 등 메서드를 특정한다.|

## HTTP 요청
#### 1. 시작줄
Pst /test HTTP/1.1
<!--Table-->
|Code|Example|
|:--:|:--:|
|HTTP method|Post|
|요청 타겟|/test|
|HTTP 버전|HTTP/1.1|

2. 헤더
본문의 형식, 본문의 바이트 수, 보낼 url 호스트, 인증정보, 클라이언트 식별자, 클라이언트가 보내는 쿠키, 서버가 클라이언트에 저장/지시하는 쿠키

3. (빈줄)
헤더와 본문을 구분

4. 본문 - 요청과 응답의 마지막 부분에 들어가는 데이터
Get 요청 - 쿼리스트링
 URL에 '?키1=값1&키2=값2' 형식으로 요청할 데이터에 붙여 보낸다.
POST 요청 - 서버에 정보를 저장, 헤더의 Content-type 형식에 맞춰 본문에 요청 내용을 담아 보낸다.

## HTTP와 HTTPS의 차이
### HTTP + 보안 -> 모든 통신 내용을 암호화해서 해커가 침입하지 못하게함
<!--Table-->
|항목|HTTP|HTTPS|
|:--:|:--:|:--:|
|보안|암호화 안됨|SSL/TLS로 암호화|
|데이터 보호|노출 위험 있음|안전하게 암호화됨|
|사용 용토|일반 정보 제공|로그인, 결제 등 민감한 정보 처리|
|주소 형식|http://|https://|
|기본 포트|80번|443번|

## HPPT 주요 요소와 작동 원리
### 엔드포인트
클라이언트가 요청을 보낼 수 있는 URL 경로 

### URI, URL, BaseURL
URI (Uniform Resource Identifier): 리소스를 식별하는 모든 것 (URL 포함)
URL: URI의 한 종류로 **위치(주소)**를 포함함
BaseURL: API의 공통된 기본 주소

### HTTP 요청과 응답 구조
요청: 클라이언트 → 서버
응답: 서버 → 클라이언트

#### 요청 구성 요소
헤더: 인증, 데이터 형식 등 메타정보
본문: 실제 전달하는 데이터 (POST 등에서 주로 사용)

#### HTTP 상태 코드 예시
<!--Table-->
|Code|Meaning|
|:--:|:--:|
|200|성공|
|201|생성됨|
|400|잘못된 요청|
|404|페이지 없음|
|500|서버 오류|

#### HTTP 메서드
<!--Table-->
|method|Meaning|본문 여부|
|:--:|:--:|:--:|
|GET|데이터 조회|x|
|POST|새 데이터 생성|o|
|PUT|전체 수정|o|
|PATCH|일부 수정|o|
|DELETE|데이터 삭제|x|

# API란?
Application Programming Interface의 약자, 하나의 프로그램에서 다른 프로그램으로 데이터를 주고받기 위한 방법
"If you say ~, then I do ~"
API는 서버 역할의 프로그램이 준 메뉴판같은 것, 보낼 수 있는 요청들이 나열되어 있음 -> 일정한 체계가 잡혀있음
또한, 어떻게 대답해야할지도 매뉴얼로 저장되어있음

#### ex) 우리가 유튜브 앱을 사용할 때, 모든 영상이 저장된 게 아니라, 서버에 저장된 영상에 관련된 데이터를 받아서 저장 -> 소프트웨어간의 소통

## REST API란?
리소스를 URL로 표현하고 HTTP 메서드로 동작을 정의하는 방식
A가 어떤 방시으로 요청하고 B가 어떤 방식으로 응답할 지 지정해놓은 다양한 형식들 중 하나
어떤 작업을 할지는 'HTTP 메소드'

### REST의 구성요소
<!--Table-->
|구성요소|Meaning|Example|
|:--:|:--:|:--:|
|자원(resource)|데이터 자체|users, posts|
|URI|자원의 고유 주소|/users/1|
|HTTP method|자원에 대한 동작 방식|GET, POST|
|표현|응답 데이터 형식|JSON, XML|

### REST의 특징
1. 클라이언트-서버 구조 -> 프론트엔드와 백엔드가 역할 분리
2. 무상태 -> 요청 간 상태를 저장하지 않음. 모든 요청은 독립적
3. 캐시 처리 가능 -> 자주 쓰는 데이터는 캐시 가능
4. 계층 구조 -> 서버 구성 단계를 분리할 수 있음. 보안, 로드밸런서 등
5. 인터페이스 일관성 -> URI와 메서드 사용 방식이 명확

### REST의 장단점
<!--Table-->
|장점|단점|
|:--:|:--:|
|단순, 직관|복잡한 기능 표현 어려움|
|HTTP 기반으라 널리 사용 가능|무상태성 때문에 요청마다 인증 필요|
|언어에 구애받지 않음|실시간 통신에 부적|

##HTTP와 REST API의 관계성
1. RESR API설계에서 HTTP method 활용 예시
   <!--Table-->
|method|Meaning|example|
|:--:|:--:|:--:|
|GET|전체 유저 조회|/users|
|GET|특정 유저 조회|/users/1|
|POST|새 유저 생성|/users|
|PUT or PATCH|유저 정보 수정|/users/1|
|DELETE|유저 삭제/users/1|

"URL은 '무엇을' 요청할지, HTTP method는 '어떻게' 요청할지를 의미"

2. RESTful 하게 API 설계하는 방법
   - RESTful 이란?
     1. REST의 원칙에 맞게 API를 설계한 상태
     2. 직관적이고, URL과 메서드만 보고도 기능을 유추할 수 있는 구조
     3. URI는 명사형이며 소문자, 동사는 HTTP method로 표현, 계층형 구조, 형식 통일(JSON)

3. 둘의 관계성은?
   HTTP는 REST API의 기반 기술이며, REST는 HTTP를 효과적으로 활용하는 설계방식
   예시) HTTP = 도로  REST = 도로를 활용하는 규칙  REST API = 규칙에 맞춘 자동차(통신 방식)

# XML과 JSON이란?

## XML의 기본 구조 및 태그 사용방식
1. XML은 HTML처럼 태그<>로 데이터를 표현한다! -> <태그명>내용</태그명>
2. 중첩구조 가능
3. 루트 태그는 반드시 하나여야 한다.(<user>)

## XML의 특징과 장점
1. 형식이 엄격 - 구조가 명확, 문법 오류에 민
2. 태그 기반 - 사람에게 읽기 쉽지만, 길어짐
3. 확장성 있음 - 자유롭게 태그 이름을 정의 가능
4. 다양한 데이터 타입 표현 - 복잡한 구조 표현 가능
5. 스키마 지원 - 문서 구조를 정의/검증 가능

## JSON의 기본 구조 및 표현 방식
1. 키-값 쌍(key-value pair) 구조
2. 문자열은 **큰따옴표("")**로 감싸야 함
3. 중괄호 {}: 객체
4. 대괄호 []: 배열
   
예시)
{
  "name": "홍길동",
  "age": 25
}

## JSON의 특징과 장점
1. 가볍고 간결함 -> XML보다 데이터 양 작고, 속도 빠름
2. 사람과 기계 모두 이해 쉬움 ->	읽기 쉽고 가공도 쉬움
3. 언어 독립적 -> 거의 모든 언어에서 사용 가능
4. 웹과 호환성 우수 -> 자바스크립트 기반이라 웹 개발에 적합

-> REST API에서는 대부분 JSON사용!
WHY? 가볍고 빠름. 프론트엔드와 잘 맞음. 처리가 쉬움, XML은 너무 무겁고 복잡하다!

-> 그렇다면 XML은 어디서 사용?
외부 시스템(공공시관, 금융권)과 연동하는 경우
스키마 기반의 데이터 검증이 필요할 

<!--Table-->
|항목|XML|JSON|
|:--:|:--:|:--:|
|형식|태그기반|키-값기반|
|가독성|낮음|높음|
|데이터크기|큼|작음|
|웹친화성|낮음|높음|
|RESTAPI사용성|제한적|대부분사용됨|
|
