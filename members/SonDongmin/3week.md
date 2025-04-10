# HTTP와 REST API 정리

---

## 1. HTTP란?

### HTTP 프로토콜의 의미
  > 웹에서 클라이언트(브라우저)와 서버 간에 데이터를 주고받기 위한 통신 규약.   
  > 웹 브라우저(클라이언트)가 웹 서버에 요청(Request)을 보내고, 서버가 응답(Response)을 보내는 방식.

### HTTP와 HTTPS의 차이
| 항목 | HTTP | HTTPS |
|------|------|-------|
| 보안성 | 없음 | SSL/TLS를 통한 암호화 |
| 포트 | 80번 | 443번 |
| URL 표시 | http:// | https:// |
| 데이터 전송 | 평문(누구나 볼 수 있음) | 암호화된 형태로 전송 |
| 사용 예시 | 테스트 서버, 내부망 | 실제 서비스, 민감 정보가 오가는 서비스 |
---

## 2. HTTP 주요 요소와 작동 원리

### URI, BaseURL, URL의 개념
- **URI (Uniform Resource Identifier)**: 리소스를 식별하는 문자열
- **URL (Uniform Resource Locator)**: 특정 리소스의 위치를 포함한 URI, 프로토콜과 결합한 형태 (e.g. `https://example.com/page`)
- **BaseURL**: API에서 공통적으로 사용하는 URL의 기본 주소. (e.g. `https://api.example.com/`)

### 엔드포인트 (Endpoint)란?
- API가 제공하는 기능에 접근하기 위한 구체적인 URL 경로.
- 예: `https://api.example.com/users` 는 "사용자" 리소스에 접근하는 엔드포인트.

### HTTP 요청과 응답 방식

#### 헤더(Header)와 바디(Body)
- **Header**: 요청/응답에 대한 부가 정보 포함
- **Body**: 전송하려는 실제 데이터

#### HTTP Status Code
> 1xx: 조건부응답, 정보교환   
> 2xx: 성공   
> 3xx: 리다이렉션   
> 4xx: 요청오류   
> 5xx: 서버오류   

| 코드 | 의미 |
|------|------|
| 200 | OK – 성공적인 요청 |
| 201 | Created – 새 리소스 생성 성공 |
| 400 | Bad Request – 잘못된 요청 |
| 401 | Unauthorized - 요청에 대한 권한이 부족(인증실패) |
| 403 | Forbidden - 리소스에 대한 권한이 없음(인가실패) |
| 404 | Not Found – 리소스를 찾을 수 없음 |
| 500 | Internal Server Error – 서버 내부 오류 |
| 502 | Bad Gateway |

#### HTTP Request Method

| 메소드 | 설명 | 사용 예 |
| -------- | --------- | -------- |
| GET |	리소스 조회	| 게시글 목록 가져오기 |
| HEAD |	리소스의 헤더만 조회 (본문은 없음)	| 파일 유무 확인, 속도 체크 |
| POST |	리소스 생성	| 회원가입, 글 작성 |
| PUT	| 리소스 전체 수정/교체	| 회원 정보 전체 변경 |
| PATCH	| 리소스 일부 수정	| 회원 닉네임만 수정 |
| DELETE	| 리소스 삭제	| 글 삭제, 계정 삭제 |
| CONNECT	| 터널 연결 설정 (주로 HTTPS용 프록시 서버에서 사용) | SSL 터널 연결 |
| TRACE	| 요청이 서버에 도달하는 경로를 디버깅용으로 보여줌	| 네트워크 경로 확인 |
| OPTIONS	| 해당 서버가 지원하는 메소드 목록 조회	| 사전 요청 (CORS 검사 등) |


---

## 3. API란?

### API(Application Programming Interface)의 정의
> 정의 및 프로토콜 집합을 사용하여 두 소프트웨어 구성 요소가 서로 통신할 수 있게 하는 메커니즘
>
> 개발자가 특정 기능을 쉽게 사용할 수 있도록 도와줌   
>
> 예: 휴대폰의 날씨 앱은 API를 통해 기상청 소프트웨어에 들어있는 일일 기상 데이터를 가져옴

---

## 4. REST API란?

### REST(Representational State Transfer)의 의미
> 클라이언트가 서버 데이터에 액세스하는 데 사용할 수 있는 GET, PUT, DELETE 등의 함수 집합을 정의

### REST API의 구성 요소 및 특징
#### 구성 요소
- **자원 (Resource)**: HTTP URI
- **행위 (Method)**: HTTP Method
- **표현 (Representation)**:  HTTP Message Pay Load (JSON, XML 등으로 데이터 표현)

#### 특징
- **무상태성**: 서버는 클라이언트의 상태를 저장하지 않음
- **클라이언트-서버 구조**: 클라이언트와 서버가 명확하게 분리되어 독립적으로 개발 가능
- **자원 기반**: 모든 것은 Resource로 간주. URI로 자원을 표현
- **표현**: 자원은 다양한 형태로 표현 가능(XML, JSON, HTML)
- **일관된 인터페이스**: 일관된 URI 규칙과 HTTP 메소드 사용
- **계층화 구조**: 여러 중간 서버를 사용할 수 있음
- **캐시 가능**: HTTP의 캐싱 기능을 활용해 성능 향상 가능

### REST의 장단점
#### 장점
- 직관적이고 명확한 구조
- 다양한 포맷(JSON, XML 등) 사용 가능
- 브라우저에서도 사용 가능 (HTTP 기반)
- 확장성과 유지보수 용이

#### 단점
- 복잡한 트랜잭션 처리에는 부적합
- 상태 정보를 서버가 기억하지 않아 매 요청마다 모든 정보를 포함해야 함 (무상태성의 단점)
- 버전 관리 어려움

---

## 5. HTTP와 REST API의 관계성

### REST API 설계에서 HTTP 메서드 활용 예시

> 예: "users"라는 자원(리소스)를 관리하는 API

| 동작 | HTTP 메서드 | URI 예시 | 설명 |
|------|--------------|----------|------|
| 전체 사용자 목록 조회 | `GET` | `/users` | 모든 사용자 데이터를 가져옴 |
| 특정 사용자 조회 | `GET` | `/users/1` | ID가 1인 사용자 정보 조회 |
| 새 사용자 등록 | `POST` | `/users` | 요청 본문에 있는 정보를 바탕으로 새 사용자 생성 |
| 사용자 전체 수정 | `PUT` | `/users/1` | ID가 1인 사용자의 전체 정보를 수정 (완전 덮어쓰기) |
| 사용자 일부 수정 | `PATCH` | `/users/1` | ID가 1인 사용자의 일부 정보만 수정 (부분 변경) |
| 사용자 삭제 | `DELETE` | `/users/1` | ID가 1인 사용자 삭제 |

### RESTful하게 API 설계하는 방법

- **자원 중심 URI**: URL은 리소스를 명사로 표현해야 하며, 동사는 지양함     `/users`: O `/getUsers`: X
- **HTTP 메서드 의미대로 사용**: `GET`, `POST`, `PUT`, `DELETE`, `PATCH` 등 HTTP 메서드를 역할에 맞게 사용
- **계층적 구조 URI**: 리소스 간 관계를 `/users/1/posts`와 같이 계층 구조로 표현
- **형식 독립적 설계**: 응답 포맷은 MIME 타입(`Content-Type`, `Accept`)으로 표현 (JSON, XML 등)
- **상태는 URI에 포함하지 않음**: `/users?status=active`는 OK, `/activeUsers`는 지양
- **HTTP 상태 코드 정확히 사용**: 200, 201, 400, 404, 500 등의 상태 코드를 의미에 맞게 사용

### HTTP와 REST API의 관계
- REST는 HTTP 위에서 동작하는 아키텍처 스타일
- HTTP의 메서드, 상태코드, URL 등을 이용하여 REST API를 구현함

---

## 6. XML과 JSON 이란?

### XML이란?
> 데이터의 구조를 태그로 표현하는 마크업 언어 (데이터 저장과 전송 목적에 초점)

### XML의 기본 구조 및 태그 사용 방식
```xml
<book>
  <title>XML 입문</title>
  <author>홍길동</author>
  <year>2025</year>
</book>
```

### XML의 특징과 장점
- 계층적 구조로 표현
- 태그를 통해 어떤 데이터인지 명확히 구분 가능
- 필요한 대로 태그와 구조를 자유롭게 확장 가능
- 서로 다른 시스템이나 언어 간 데이터 교환에 유리

### JSON이란?
> 데이터를 저장하고 전송하기 위한 가볍고 읽기 쉬운 데이터 형식

### JSON의 기본 구조 및 표현 방식
```json
{
  "name": "홍길동",
  "age": 25,
  "isMember": true,
  "skills": ["Java", "Python"],
  "address": {
    "city": "Seoul",
    "zip": "12345"
  }
}
```

### JSON의 특징과 장점
- XML보다 훨씬 간단하고 데이터 크기가 작음
- 가독성이 좋고 JavaScript와 호환성 뛰어남
- 네트워크 통신에 적합 (특히 REST API와 잘 맞음)
- 파싱 속도가 빠르고, 라이브러리 지원도 풍부

### REST API에서는 어떤 걸 기준으로 사용할까?
- 대부분의 REST API는 **경량**하고 **처리 속도가 빠른 JSON**을 사용
- XML은 특수한 환경이나 복잡한 구조 정의가 필요한 경우 사용

---