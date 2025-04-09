# 데이터베이스(Database)

## 데이터베이스란 무엇이고 어떤 종류가 있나요? 그렇다면 DBMS는 무엇인가요?

### 1. 데이터베이스란 무엇이고 왜 필요할까요?
데이터베이스(Database)는 체계적으로 조직된 데이터의 모음으로, 데이터를 효율적으로 저장, 검색, 관리할 수 있도록 설계된 시스템입니다. 

#### 1.1 데이터베이스에는 무슨 종류가 있나요?
#### **1) 데이터 모델에 따른 분류**
- **관계형 데이터베이스(RDB)**: 테이블 기반, SQL 사용 (예: MySQL, PostgreSQL, Oracle)
- **NoSQL 데이터베이스**: 비정형 데이터 저장, 다양한 구조 지원
  - 키-값 저장소 (예: Redis, DynamoDB)
  - 문서형 (예: MongoDB, CouchDB)
  - 열 기반 (예: Apache Cassandra, HBase)
  - 그래프 (예: Neo4j, ArangoDB)

#### **2) 저장 방식에 따른 분류**
- **인메모리 데이터베이스**: 메모리 기반으로 빠른 속도 제공 (예: Redis, Memcached)
- **분산 데이터베이스**: 여러 서버에 분산 저장하여 확장성 확보 (예: Apache Cassandra, Google Spanner)

#### **3) 용도에 따른 분류**
- **OLTP (트랜잭션 처리 중심)**: 빠른 데이터 조작, 은행·전자상거래 사용 (예: MySQL, PostgreSQL, Oracle)
- **OLAP (분석 처리 중심)**: 대규모 데이터 분석 최적화 (예: Amazon Redshift, Google BigQuery, Snowflake)

#### **4) 클라우드 기반 여부**
- **온프레미스 데이터베이스**: 자체 서버 관리
- **클라우드 데이터베이스**: 클라우드에서 제공하는 관리형 DB (예: Amazon RDS, Google Firestore, Azure Cosmos DB)

#### 1.2 데이터베이스의 특징은 무엇일까요?
- **무결성(Integrity)**: 데이터의 정확성과 일관성을 유지합니다.
- **보안성(Security)**: 데이터 접근을 제어하여 불법적인 접근을 방지합니다.
- **일관성(Consistency)**: 트랜잭션이 실행된 후에도 데이터의 상태가 일관성을 유지합니다.
- **동시성(Concurrency)**: 여러 사용자가 동시에 데이터를 사용할 수 있도록 지원합니다.
- **회복성(Recovery)**: 시스템 장애 발생 시 데이터를 복구할 수 있도록 합니다.

#### 관계형 데이터베이스 vs. 비관계형 데이터베이스 (NoSQL)
| 비교 항목            | 관계형 데이터베이스 (RDB) | 비관계형 데이터베이스 (NoSQL) |
|--------------------|-----------------|-----------------|
| **데이터 구조**   | 테이블 기반 (행, 열)  | JSON, 문서, 그래프 등 |
| **관계(Relationships)** | 테이블 간 관계 설정 가능 | 관계 없이 독립적인 데이터 저장 |
| **확장성**        | 수직적 확장 (Scale-Up) | 수평적 확장 (Scale-Out) |
| **속도**         | 대량 데이터 처리 시 느림 | 빠른 데이터 처리 가능 |
| **사용 사례**     | 금융, ERP, 전자상거래 | SNS, 빅데이터, IoT |


### 2. DBMS의 등장 배경은 어떻게 될까요?
DBMS(Database Management System)는 데이터베이스를 관리하는 소프트웨어로, 사용자가 데이터를 효율적으로 관리할 수 있도록 도와줍니다. 
DBMS는 파일 시스템 기반 데이터 관리의 비효율성을 극복하고 데이터 일관성을 보장하기 위해 등장하였습니다.

---

## SQL과 NoSQL의 개념 및 차이점

### 1. RDBMS와 SQL은 어떻게 다른가요?
- **RDBMS**(Relational Database Management System)는 관계형 데이터베이스를 관리하는 시스템을 의미합니다.
- **SQL**(Structured Query Language)은 관계형 데이터베이스에서 데이터를 정의하고 조작하는 데 사용되는 언어입니다.

### 2. SQL과 NoSQL의 개념
SQL은 정형화된 데이터 구조를 갖는 관계형 데이터베이스에서 사용되며, NoSQL은 유연한 스키마를 갖춘 비관계형 데이터베이스에서 사용됩니다.

#### 2.1 두 언어의 차이점은 무엇인가요?
| 구분 | SQL | NoSQL |
|------|-----|-------|
| 데이터 구조 | 테이블 기반 | 문서, 키-값, 컬럼 패밀리, 그래프 |
| 스키마 | 고정된 스키마 | 동적 스키마 |
| 확장성 | 수직 확장(Scale-Up) | 수평 확장(Scale-Out) |
| 트랜잭션 | ACID 지원 | BASE 지원 |

### 3. 각각의 언어가 어떤 상황에 사용하면 좋을까요?
- **SQL**: 데이터 구조가 명확하고, 관계형 데이터가 많은 경우 (예: 금융, 전자상거래)
- **NoSQL**: 빠른 확장이 필요하고, 비정형 데이터가 많은 경우 (예: 빅데이터, 실시간 애플리케이션)

---

## SQL의 기본 문법

SQL의 기본 문법은 크게 **DDL(Data Definition Language)**, **DML(Data Manipulation Language)**, **DCL(Data Control Language)**로 나뉩니다.

### 1. DDL, DML, DCL 이란 무엇일까요?
- **DDL (Data Definition Language)**: 데이터 구조를 정의하는 언어 (예: `CREATE`, `ALTER`, `DROP`)
- **DML (Data Manipulation Language)**: 데이터를 조작하는 언어 (예: `SELECT`, `INSERT`, `UPDATE`, `DELETE`)
- **DCL (Data Control Language)**: 데이터 접근 권한을 제어하는 언어 (예: `GRANT`, `REVOKE`)

#### 1.1 이를 활용한 각 쿼리문 예제
##### 1) DDL 예제
```sql
-- 테이블 생성 (CREATE)
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 테이블 수정 (ALTER)
ALTER TABLE users ADD COLUMN email VARCHAR(255);

-- 테이블 삭제 (DROP)
DROP TABLE users;
```

##### 2) DML 예제
```sql
-- 데이터 삽입 (INSERT)
INSERT INTO users (name, age, email) VALUES ('Alice', 25, 'alice@example.com');

-- 데이터 조회 (SELECT)
SELECT * FROM users WHERE age > 20 ORDER BY name ASC;

-- 데이터 수정 (UPDATE)
UPDATE users SET age = 26 WHERE name = 'Alice';

-- 데이터 삭제 (DELETE)
DELETE FROM users WHERE id = 1;
```

##### 3) DCL 예제
```sql
-- 권한 부여 (GRANT)
GRANT SELECT, INSERT ON users TO 'user1'@'localhost';

-- 권한 취소 (REVOKE)
REVOKE INSERT ON users FROM 'user1'@'localhost';
```

### 2. 트랜잭션이란 무엇이고, 어떤 상황에 활용될까요?
- **트랜잭션(Transaction)**: 데이터베이스에서 하나의 논리적 작업 단위로 실행되는 작업 모음
- **ACID 원칙**을 따르며, 데이터의 신뢰성을 보장
- 예제: 은행 계좌 이체 시 `출금`과 `입금`이 함께 이루어져야 함

#### 2.1 트랜잭션 관련 명령어
- `BEGIN TRANSACTION`: 트랜잭션 시작
- `COMMIT`: 트랜잭션을 확정하여 변경 사항 저장
- `ROLLBACK`: 트랜잭션을 취소하여 변경 사항 되돌리기

```sql
-- 트랜잭션 예제
START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
```

---

## ERD란 무엇인가요?

### 1. ERD란 무엇일까요?
ERD(Entity-Relationship Diagram)는 데이터베이스의 구조를 시각적으로 표현하는 다이어그램입니다.

#### 1.1 ERD의 요소에는 무엇이 있나요?
- **엔터티(Entity)**: 데이터베이스에서 관리해야 하는 객체 (예: 고객, 주문)
- **속성(Attribute)**: 엔터티가 가지는 정보 (예: 고객의 이름, 주문 날짜)
- **관계(Relationship)**: 엔터티 간의 연결 (예: 고객과 주문의 관계)

#### 1.2 ERD 예시 (도서 대여 시스템)
다음은 도서 대여 시스템을 ERD(Entity-Relationship Diagram) 형태로 표현한 예시입니다.

#### 📌 엔터티(Entity) 및 관계(Relationships)

- `Books(도서)`와 `Loans(대출)`은 **1:N 관계**  
  → 한 권의 책은 여러 번 대출될 수 있음  
- `Members(회원)`와 `Loans(대출)`은 **1:N 관계**  
  → 한 명의 회원은 여러 책을 대출할 수 있음  

#### 📌 ERD 테이블 구조

| Books (📚 도서) | Loans (📄 대출) | Members (👤 회원) |
|---------------|--------------|---------------|
| `book_id (PK)` 🔑 | `loan_id (PK)` 🔑 | `member_id (PK)` 🔑 |
| `title` 📖 | `book_id (FK)` 🔗 | `name` 🏷️ |
| `author` ✍️ | `member_id (FK)` 🔗 | `email` 📧 |
| `status` ✅ | `loan_date` 📅 | `phone` 📞 |
|  | `return_date` 🔙 |  |

#### 📌 관계 다이어그램 

```plaintext
+-----------+       +---------+       +---------+
|  Books    |       |  Loans  |       | Members |
+-----------+       +---------+       +---------+
| book_id (PK) |──┬▶| loan_id (PK) |◀──┬| member_id (PK) |
| title        |  | | book_id (FK)  |    | name           |
| author       |  | | member_id (FK)|    | email          |
| status       |  | | loan_date     |    | phone          |
+-----------+  | | | return_date   |    +---------+
               | | +---------+
               | |
    (1:N)──────┘ └──────(N:1)
```
