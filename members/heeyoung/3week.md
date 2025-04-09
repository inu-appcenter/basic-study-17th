# [app center] 3주차 - API 와 JSON

# 1.  HTTP

<aside>
💡

- Hyper Text Transfer Protocool
- 웹 상에서 데이터를 주고 받기 위한 프로토콜
    
    **cf. 프로토콜이란?**
    
    컴퓨터나 전자 기기 간의 통신을 위한 규칙/절차의 집합
    
</aside>

- HTTP 는 클라이언트 (웹 브라우저) 와 서버 간의 요청과 응답을 통해 작동한다.
- 일반적으로 TCP/IP 통신 프로토콜 기반으로 동작한다.

**HTTP 는 Stateless 이다.**

- 이는 state (상태) 를 저장하지 않는다는 뜻으로, 각각의 요청/응답은 **독립적**이다.
    
    예를 들어, 클라이언트가 요청을 보내고 응답을 받은 후, 조금 있다 다시 요청을 보낼 때, 전에 보낸 요청/응답에 대해 알지 못한다.
    

---

## 1)  HTTP 통신 흐름

### **1-1.  요청 (request)**

HTTP Request 메세지는 크게 

- **start line**
- **heades**
- **body (선택사항)**

로 구성되어 있다.

✅  **Start line**

```bash
<메서드><경로><HTTP버전>
# 예시
GET /search HTTP/1.1
```

- 메서드 : 해당 request 가 의도한 action을 정의하는 부분
    - **주요 HTTP 메서드**
    
    | **메서드** | 설명 |
    | --- | --- |
    | **GET** | 데이터 가져오기 |
    | **POST** | 데이터 전송하기 |
    | **PUT** | 전체 수정 |
    | **PATCH** | 일부 수정 |
    | **DELETE** | 데이터 삭제 |
- 경로 : 해당 request 가 전송되는 목표 uri
- HTTP 버전

✅  **Headers**

해당 request 에 대한 부가정보를 전달하는 부분

```bash
Host: example.com
User-Agent: Mozilla/5.0
Accept: text/html
```

- **자주 사용되는 header 정보**

| **헤더 이름** | 설명 |
| --- | --- |
| **User-Agent** | 요청을 보내는 클라이언트에 대한 정보 |
| **Host** | 요청이 전송되는 target의 host url |
| **Accept** | 해당 요청을 받을 수 있는 응답 타입 |
| **Connection** | 해당 요청 이후 네트워크 커넥션의 유지 여부 |
| **Content-Type** | 해당 요청이 보내는 메세지 body 타입  ex) JOSN 을 보내면 application/json            |
| **Content-Length** | 메세지 body 의 길이 |

✅  **Body**

해당 request 의 실제 메세지/ 내용

주로 **POST, PUT** 요청 등에서 데이터를 담을 때 사용한다.

```bash
username=kim&password=1234
```

### **1-2.  응답 (response)**

HTTP Response 메세지도 크게 3가지로 구성된다.

- Status Line
- Headers
- Body

**✅  Status Line**

response 의 상태를 간략하게 나타내주는 부분

```bash
HTTP-version Status-code Status-text
# 예시
HTTP/1.1 404 Not Found
```

- Stauts code

| **코드** | 의미 | 범주 |
| --- | --- | --- |
| **200** | OK (정상 처리됨) | 성공 |
| **301** | Moved Permanently (리다이렉션) | URL 이동 |
| **400** | Bad Request (요청 오류) | 클라이언트 오류 |
| **401** | Unauthorized (인증 필요) | 클라이언트 오류 |
| **403** | Forbidden (접근 금지) | 클라이언트 오류 |
| **404** | Not Found (없는 경로) | 클라이언트 오류 |
| **500** | Internal Server Error (서버 에러) | 서버 오류 |
| **503** | Service Unavailable (서버 점검 중) | 서버 오류 |

**✅  Headers**

서버가 응답에 대해 설명하는 부가 정보

request 의 headers 와 유사하다.

response 에서만 사용되는 header 값들이 있다. → User-Agent 대신 Server 헤더 사용

✅  **Body**

실제 클라이언트가 보게 되는 내용

---

## 2) URI / URL / Base URL

<aside>
💡

URI = 식별자, URL = 식별자 + 위치

</aside>

### 🔹  URI (Uniform Resource Identifier)

: 자원의 위치나 이름을 식별하는 모든 문자열, URL 도 URI 의 하위 개념이다.

### 🔹  URL (Uniform Resource Locator)

: 자원의 **위치**를 나타내는 URI, 즉 **웹 주소(경로)**

```bash
[프로토콜]://[도메인]/[경로]?쿼리
# 예시
https://example.com/posts/123
```

### 🔹  Base URL (기초 URL)

: API 나 웹 서비스의 공통된 앞부분 주소, **항상 고정적으로 사용하는 기본 주소**

```bash
https://example.com
```

### 🔹  EndPoint

: 특정 기능을 수행하는 URL 경로

- 클라이언트가 API 를 통해 요청을 보내는 대상
- 각각의 endpoint 는 서버에서 특정 작업을 담당

```bash
Base URL:  https://api.example.com/
Endpoint:   /users/123
Full URL:   https://api.example.com/users/123
```

---

# 2.  API

<aside>
💡

**API (Application Programming Interface)** 

소프트웨어 프로그램이 데이터와 기능을 공유할 수 있도록 하는 인터페이스

→ 프로그램 간에 기능/ 데이터를 요청하고 받을 수 있는 창구

</aside>

### 사용 예시

- 스마트폰으로 카카오톡에 로그인을 하려고 할 때
    
    👉  스마트폰에서 로그인 **요청**을 보낸다.
    
    👉  해당 요청은 카카오 본사의 서버 컴퓨터 중 하나가 받게 된다.
    
    👉  알맞은 **응답**을 다시 스마트폰에게 돌려준다. (로그인 처리, “로그인 성공” 메세지 띄우기 … )
    

✅  이러한 요청/ 응답을 할 때 “어떤 형식으로”, “어떤 주소로”, “어떤 메서드(GET/POST etc)로” 보낼지 

**정해놓은 체계를 API** 라고 한다.

## 1) REST API

<aside>
💡

**REST (REpresentational State Transfer)**

자원을 이름으로 구분하여 해당 자원의 상태를 주고 받는 모든 것

1. HTTP URI 를 통해 자원을 명시하고
2. HTTP Method 를 통해
3. 해당 자원 (URI) 에 대한 행위(동작) 을 명시 

→ 웹 자원을 URL로 표현하고, 상태를 HTTP 로 주고받는 방식

**REST API** 는 이러한 REST 원칙을 따르는 API 다.

</aside>

### 🔹  REST 의 구성요소

REST 는 다음과 같은 3가지로 구성 되어 있다.

| **구성요소** | 설명 |
| --- | --- |
| **자원(Resource)** | URI 로 표현되는 대상. ex) /groups/:group_id 와 같은 고유한 HTTP URI |
| **행위(Verb)** | 자원에 대한 행위. ex) GET, POST, PUT, DELETE |
| **표현(Representations)** | 자원의 상태를 주고 받는 방식. JSON, XML 등이 있다. |

### 🔹  REST 의 특징

| **특징** | 설명 |
| --- | --- |
| **Sever-Client 구조** | 자원이 있는 쪽이 Sever, 자원을 요청하는 쪽이 Client 가 된다. |
| **무상태성 (Stateless)** | 서버는 이전 요청을 기억하지 않는다. |
| **캐시 처리 가능** | HTTP 프로토콜을 그대로 사용하기 때문에 캐싱 기능을 적용할 수 있다. |
| **계층 구조** | 서버는 다중 계층으로 구성될 수 있어 보안과 확장성 ↑ |
| **인터페이스 일관성** | URI 로 지정한 리소스 종류에 상관없이 동일한 API 메소드를 갖도록 한다. |
| **자체 표현** | REST API 의 메세지만 보고도 이해가 가능하도록 설계 된다. |

## 2) HTTP 와 REST API 의 관계성

- **HTTP** 는 인터넷에서 데이터를 주고 받는 **기본 통신 규약**
- **REST API** 는 **HTTP 메서드를 활용**해 간단하고 직관적인 방식으로 **클라이언트와 서버 간의 상호작용을 정의**한다.

### 🔹  RESTful 하게 API 설계하는 방법

1. 의미를 바로 알아볼 수 있도록 작성하고, 소문자를 사용한다.
    
    `GET /users/post-comments` 
    
2. 밑줄(_) 을 사용하지 않고, 하이픈(-) 을 사용한다.
    
    `GET /users/profile-image`
    
3. URI 는 명사를 사용한다. (동사 사용 X)
    
    `GET /users/show/1` (X)
    
    `GET /users/1` 
    

1. 파일 확장자는 URI 에 포함시키지 않는다.
    
    `GET /users/photo.jpg` (X)
    
    `GET /users/photo`
    
2. 리소스 간 연관관계가 있는 경우 `/리소스/고유ID/관계 있는 리소스` 순으로 작성한다.
    
    `GET /users/{user_id}/profile` 
    

1. 마지막에 슬래시 (/) 를 포함하지 않는다.

---

# 3. XML 과 JSON

<aside>
💡

서버 → 클라이언트로 데이터를 보낼 때 사용되는 **파일 언어**

</aside>

## 1) XML (eXtensible Markup Language)

HTML 형식과 같은 태그로 데이터를 표현하는 방식의 마크업 언어이다. (확장 가능한 마크업 언어)

```xml
<guests>
  <guest>
    <firstName>John</firstName>
    <lastName>Doe</lastName>
  </guest>
  <guest>
    <firstName>María</firstName>
    <lastName>García</lastName>
  </guest>
  <guest>
    <firstName>Nikki</firstName>
    <lastName>Wolf</lastName>
  </guest>
</guests>

```

- 열리는 태그와 닫는 태그가 있다.
- 트리 형태의 구조이다.  `<guests> → <guest> → <firstName>,<lastName>`
- 데이터를 보여주는 목적이 아닌, 저장하고 전달하는 목적으로 만들어졌다.

## 2) JSON (JavaScript Object Notation)

브러우저 통신을 위한 속성-값 또는 키-값 쌍으로 이루어진 데이터 포맷이다.

```json
{
  "guests": [
    {
      "firstName": "John",
      "lastName": "Doe"
    },
    {
      "firstName": "María",
      "lastName": "García"
    },
    {
      "firstName": "Nikki",
      "lastName": "Wolf"
    }
  ]
}
```

- 태그가 없어 데이터 크기가 작다. → 경량 데이터화에 유리
- XML 에 비해 보안에 취약하다.
- 가볍고 효율적이기 때문에 → **REST API 에서 주로 사용한다.**

---