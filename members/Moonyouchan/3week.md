# ✅ HTTP란?

## 📌 HTTP 프로토콜의 의미
- **HTTP (HyperText Transfer Protocol)** 는 웹에서 **클라이언트(브라우저)** 와 **서버** 간에 데이터를 주고받는 통신 규약입니다.
- 요청(Request)과 응답(Response)을 통해 **HTML, 이미지, JSON 등 다양한 데이터를 전송**합니다.
- 기본적으로 **비연결성(Connectionless)** 과 **무상태성(Stateless)** 의 특징을 가집니다.

## 🔒 HTTP vs HTTPS
| 항목 | HTTP | HTTPS |
|------|------|-------|
| 보안 | 없음 | **SSL/TLS** 를 통해 암호화 |
| 포트 | 80 | **443** |
| 인증서 | 불필요 | **SSL 인증서 필요** |
| 사용처 | 내부 통신 등 | 보안이 필요한 로그인, 결제 등 |

---

# ✅ HTTP 주요 요소와 작동원리

## 🔹 엔드포인트 (Endpoint)란?
- **서버에서 요청을 수신하는 URL 경로**입니다.  
  예: `https://api.example.com/users`

## 🔹 URI, BaseURL, URL

| 용어 | 의미 | 예시 |
|------|------|------|
| **BaseURL** | 공통된 도메인 주소 | `https://api.example.com` |
| **URI** | 리소스 식별자 (경로 + 쿼리) | `/users?id=1` |
| **URL** | 전체 주소 | `https://api.example.com/users?id=1` |

## 🔹 HTTP 요청과 응답 방식

### 📄 요청(Request) & 응답(Response)의 구성
- **Header**: 메타 정보 (ex. `Content-Type`, 인증 토큰 등)
- **Body**: 전송할 실제 데이터 (주로 POST, PUT, PATCH에서 사용)

### 📊 HTTP Status Code

| 코드 | 의미 | 설명 |
|------|------|------|
| 200 | OK | 요청 성공 |
| 201 | Created | 리소스 생성 성공 |
| 400 | Bad Request | 잘못된 요청 |
| 404 | Not Found | 리소스를 찾을 수 없음 |
| 500 | Server Error | 서버 내부 오류 |

### 🛠️ HTTP Method (메서드)

| 메서드 | 목적 | 설명 |
|--------|------|------|
| GET | 조회 | 리소스 가져오기 |
| POST | 생성 | 새로운 리소스 생성 |
| PUT | 전체 수정 | 리소스를 전체적으로 수정 |
| PATCH | 부분 수정 | 일부 속성만 수정 |
| DELETE | 삭제 | 리소스 삭제 |

---

# ✅ API란?

## 🔹 API 정의
- **API (Application Programming Interface)** 는  
  **다른 프로그램과 통신하기 위한 명령/규칙의 집합**입니다.  
  예: "앱이 서버에서 사용자 정보를 받아오기 위한 명령문"

---

# ✅ REST API란?

## 🔹 REST의 의미
- **REST (REpresentational State Transfer)**  
  자원을 URI로 표현하고, **HTTP 메서드를 통해 상태를 조작하는 아키텍처 스타일**

## 🔹 REST 구성요소 & 특징

| 요소/특징 | 설명 |
|-----------|------|
| 자원(Resource) | URI로 식별 (예: `/users/1`) |
| 메서드(Method) | HTTP 동사를 사용 (GET, POST 등) |
| 표현(Representation) | JSON, XML 등으로 리소스 표현 |
| 무상태성(Stateless) | 각 요청은 독립적이며 서버는 상태 저장하지 않음 |
| 캐시 처리 가능 | 응답에 따라 캐싱 가능 |

## 🔹 장점 & 단점

| 장점 | 단점 |
|------|------|
| 구조가 단순하고 명확함 | 표준이 아님 (해석의 여지가 있음) |
| 클라이언트-서버 분리 가능 | 복잡한 트랜잭션 처리에 부적합 |
| 다양한 포맷 지원(JSON/XML) | 버전 관리에 신경 써야 함 |

---

# ✅ HTTP와 REST API의 관계성

## 🔹 REST API에서 HTTP 메서드 활용 예시

| 리소스 | 메서드 | URI 예시 | 설명 |
|--------|--------|----------|------|
| 사용자 조회 | GET | `/users/1` | 1번 사용자 조회 |
| 사용자 생성 | POST | `/users` | 사용자 생성 |
| 사용자 수정 | PUT | `/users/1` | 전체 정보 수정 |
| 사용자 부분 수정 | PATCH | `/users/1` | 일부 정보만 수정 |
| 사용자 삭제 | DELETE | `/users/1` | 삭제 요청 |

## 🔹 RESTful API 설계 원칙

1. **명사 기반 URI** 사용 (`/getUser` ❌ → `/users` ✅)
2. **HTTP 메서드 적절히 사용**
3. **상태 저장 금지** (Stateless)
4. **계층 구조 표현 가능 (`/users/1/posts`)**
5. **JSON 사용 권장**
6. **균일한 인터페이스**

## 🔹 둘의 관계성
- **REST API는 HTTP를 기반으로 설계된 하나의 구현 방식**
- HTTP의 **URL, 메서드, 상태 코드 등을 활용**하여 리소스를 직관적으로 조작합니다.

---

# ✅ XML과 JSON이란?

## 🔹 XML (eXtensible Markup Language)

### 구조
```xml
<user>
  <id>1</id>
  <name>Alice</name>
</user>
```

### 특징
- 태그 기반, 사람/기계 모두 읽기 쉬움
- 데이터 구조 표현이 명확
- **무겁고 복잡**함

## 🔹 JSON (JavaScript Object Notation)

### 구조
```json
{
  "id": 1,
  "name": "Alice"
}
```

### 특징
- **경량 포맷**, 빠른 처리 속도
- JS와 자연스럽게 호환
- 가독성 좋음, 대부분의 REST API가 사용

## 🔹 REST API에서 어떤 걸 쓰나요?
- **JSON이 기본 표준처럼 사용**됩니다.
- XML도 가능하지만, 복잡하고 무거워 잘 사용되지 않음.