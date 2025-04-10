# API와 JSON

### HTTP

### HTTP 프로토콜의 의미

HTTP(HyperText Transfer Protocol)는 월드 와이드 웹(World Wide Web)에서 데이터를 주고받는 기본 프로토콜입니다. 클라이언트(예: 브라우저)와 서버 간의 통신을 규정하며, HTML 문서, 이미지, 쿼리 결과 등을 전송합니다. 요청(Request)과 응답(Response) 방식으로 작동하며, stateless(상태 비저장) 특성을 가져 각 요청이 독립적으로 처리됩니다.

### HTTP와 HTTPS의 차이

- **HTTP**: 데이터를 암호화하지 않고 전송하여 노출 위험이 있습니다.
- **HTTPS**: HTTP에 SSL/TLS 암호화가 추가되어 데이터의 보안성과 무결성을 보장합니다. 개인정보나 결제 같은 민감한 작업에 사용됩니다.

---

### HTTP 주요 요소와 작동원리

### URI와 BaseURL, URL의 개념

- **URI(Uniform Resource Identifier)**: 자원을 식별하는 문자열로, URL과 URN을 포함합니다.
- **URL(Uniform Resource Locator)**: URI의 한 종류로, 자원의 위치를 나타냅니다(예: `https://example.com/api/users`).
- **BaseURL**: URL의 기본 부분으로, 도메인과 프로토콜을 포함합니다(예: `https://example.com`). 여기에 경로를 추가하여 전체 URL이 됩니다.

### 엔드포인트(EndPoint)

엔드포인트는 클라이언트가 서버의 특정 자원에 접근하기 위한 URL의 끝부분입니다. 예를 들어, `https://example.com/api/users`에서 `/api/users`가 엔드포인트입니다.

### HTTP 요청과 응답 방식

- **헤더와 바디**:
    - **헤더(Header)**: 요청이나 응답의 메타데이터를 포함합니다(예: Content-Type, Authorization).
    - **바디(Body)**: 실제 데이터가 들어가는 부분입니다. GET 요청은 보통 바디가 없으며, POST나 PUT 요청은 바디에 데이터를 담습니다.
- **HTTP Status Code**:
    - `200 OK`: 요청 성공.
    - `201 Created`: 리소스 생성 성공.
    - `400 Bad Request`: 잘못된 요청.
    - `404 Not Found`: 요청한 리소스를 찾을 수 없음.
    - `500 Internal Server Error`: 서버 내부 오류.
- **HTTP Method**:
    - `GET`: 리소스를 조회.
    - `POST`: 리소스를 생성.
    - `PUT`: 리소스를 전체 업데이트.
    - `PATCH`: 리소스를 부분 업데이트.
    - `DELETE`: 리소스를 삭제.

---

### API

### API의 정의

API(Application Programming Interface)는 소프트웨어 간의 상호작용을 위한 인터페이스입니다. 특정 기능이나 데이터를 요청하고 응답받을 수 있는 규칙과 도구의 모음으로, 예를 들어 날씨 데이터를 제공하는 API를 통해 정보를 얻을 수 있습니다.

---

### RE

### REST의 의미

REST(Representational State Transfer)는 자원을 이름으로 구분하고 HTTP 메서드로 조작하는 아키텍처 스타일입니다. 이를 통해 클라이언트와 서버 간의 통신을 단순하고 확장 가능하게 만듭니다.

### REST 구성요소 / 특징

- **자원(Resource)**: URI로 표현됨.
- **HTTP 메서드**: 자원에 대한 작업을 정의(GET, POST 등).
- **상태 비저장(Stateless)**: 각 요청은 독립적.
- **캐시 가능(Cacheable)**: 응답을 캐싱해 성능 향상.
- **클라이언트-서버 분리**: 역할 명확히 구분.

### REST의 장단점

- **장점**: 단순하고 직관적, 확장성이 뛰어나며, HTTP 프로토콜 활용으로 범용성이 높음.
- **단점**: 표준이 느슨해 설계자의 해석에 따라 달라질 수 있으며, 복잡한 쿼리 처리에는 부적합.

---

### HTTP와 REST API의 관계성

### REST API 설계에서 HTTP 메서드 활용 예시

- `GET /users`: 모든 사용자 목록 조회.
- `POST /users`: 새로운 사용자 생성.
- `PUT /users/1`: ID가 1인 사용자 정보 전체 업데이트.
- `PATCH /users/1`: ID가 1인 사용자 일부 정보 수정.
- `DELETE /users/1`: ID가 1인 사용자 삭제.

### RESTful 하게 API 설계하는 방법

1. **자원 중심 설계**: 엔드포인트를 동사 대신 명사로 사용(예: `/users` 대신 `/createUser` 사용 금지).
2. **HTTP 메서드 활용**: 작업에 적합한 메서드 사용.
3. **상태 코드 사용**: 적절한 응답 코드 반환(예: 성공 시 200, 생성 시 201).
4. **계층적 구조**: 자원 간 관계를 URI로 표현(예: `/users/1/orders`).

### 둘의 관계성

HTTP는 REST API의 기반 프로토콜입니다. REST는 HTTP의 메서드, 상태 코드, URI 등을 활용해 자원 중심의 통신을 구현합니다. 즉, REST는 HTTP를 효과적으로 사용하기 위한 설계 철학입니다.

---

### XML과 JSON

### XML의 기본 구조 및 태그 사용방식

- **구조**: 태그 기반의 계층적 마크업 언어.
    
    ```xml
    &lt;user&gt;
        &lt;id&gt;1&lt;/id&gt;
        &lt;name&gt;John&lt;/name&gt;
    &lt;/user&gt;
    ```
    
- **태그 사용**: 열린 태그(`<tag>`)와 닫힌 태그(`</tag>`) 쌍으로 데이터 정의.

### XML의 특징과 장점

- **특징**: 사람이 읽기 쉽고 엄격한 문법과 스키마를 지원.
- **장점**: 다양한 플랫폼 간 호환성이 좋고 복잡한 데이터 구조 표현이 가능.

### JSON의 기본 구조 및 표현 방식

- **구조**: 키-값 쌍으로 구성된 경량 데이터 형식.
    
    ```json
    {
        "id": 1,
        "name": "John"
    }
    ```
    
- **표현**: 객체(`{}`), 배열(`[]`), 기본 데이터 타입(문자열, 숫자 등) 사용.

### JSON의 특징과 장점

- **특징**: 간결하고 읽기 쉬우며 파싱 속도가 빠름.
- **장점**: 데이터 크기가 작고 JavaScript와의 호환성이 높으며 REST API에서 널리 사용.

### REST API에서는 어떤 걸 기준으로 사용할까

REST API에서는 주로 **JSON**을 사용합니다. 이유는:

- **경량화**: XML보다 데이터 크기가 작아 전송 속도가 빠름.
- **파싱 용이**: 대부분의 프로그래밍 언어에서 JSON 파싱이 간단.
- **현대적 트렌드**: 웹 애플리케이션과 모바일 환경에서 JSON이 표준으로 자리잡음.
XML은 복잡한 구조나 레거시 시스템에서 여전히 사용되지만, REST API에서는 JSON이 더 적합합니다.