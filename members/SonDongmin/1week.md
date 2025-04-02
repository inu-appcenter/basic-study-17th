# Git & GitHub 정리 문서

## 1. Git이란?


Git은 **버전 관리 시스템(VCS, Version Control System)** 중 하나로, 특히 **분산 버전 관리 시스템(DVCS)** 에 속한다.  
소스 코드의 변경 이력을 기록하고 추적하며, 여러 명의 개발자가 동시에 협업할 수 있도록 돕는 도구다.


###  Git의 주요 특징

- **로컬 저장소 중심**: 모든 개발자는 자신의 컴퓨터에 전체 프로젝트의 복사본(이력 포함)을 가짐.
- **빠른 속도**: 로컬에서 이력이 관리되므로 속도가 매우 빠름.
- **효율적인 브랜치 관리**: Git은 브랜치 생성/병합이 매우 간편하고 빠르며, 실험적인 개발을 쉽게 할 수 있음.
- **데이터 무결성 보장**: Git은 모든 변경사항을 해시(SHA-1)로 추적하여 위조 및 손상을 방지.

---

## 2. Git의 주요 기능


### 2.1 버전 관리
- 파일의 변경 이력을 저장하고 언제든지 이전 상태로 되돌릴 수 있음.
- 변경된 내용, 변경한 사람, 시점 등을 추적 가능.


### 2.2 브랜치(Branch)와 병합(Merge)
- **브랜치**: 기능 추가나 버그 수정을 독립적으로 진행할 수 있도록 분기된 작업 공간.
- **병합**: 다른 브랜치의 변경사항을 현재 브랜치로 통합.


### 2.3 협업 지원
- 각자 작업 후 병합을 통해 팀 전체 코드에 반영 가능.
- Conflict 발생 시 수동으로 조정하여 품질 유지.


### 2.4 변경 이력 추적
- `git log`를 통해 커밋 메시지, 작성자, 시간 등을 확인할 수 있음.
- `git blame`으로 각 라인의 마지막 수정 기록 확인 가능


### 2.5 작동 구조

<p align="center">
  <img width="600" height="400" src=".\git_image.png">
</p>

- 작업 디렉토리: 코딩하는 공간
- 스테이징 영역: 임시 저장 공간
- 로컬 저장소: 실제 저장 공간
- 원격 저장소: 내가 저장한 변경내역을 다른 사람과 공유할 수 있는 원격 공간

---

## 3. Git 기본 명령어

| 명령어 | 설명 |
|--------|------|
| `git init` | 새 Git 저장소 생성 |
| `git clone [URL]` | 원격 저장소 복제 |
| `git status` | 현재 작업 디렉토리 상태 확인 |
| `git add [파일명]` | 파일을 staging area에 추가 |
| `git commit -m "메시지"` | 변경사항을 커밋으로 저장 |
| `git log` | 커밋 기록 보기 |
| `git branch [브랜치명]` | 브랜치 생성 |
| `git checkout [브랜치명]` | 브랜치 이동 |
| `git switch [브랜치명]` | 브랜치 이동(checkout의 최신 방식) |
| `git merge [브랜치명]` | 현재 브랜치에 다른 브랜치 병합 |
| `git pull` | 원격 저장소의 변경사항을 가져와 병합 |
| `git push` | 로컬 변경사항을 원격 저장소로 업로드 |
| `git remote -v` | 연결된 원격 저장소 목록 보기 |
| `git reset --hard` | 작업 상태를 이전 커밋으로 되돌림 |

`git commit` 전에 반드시 `git add`로 스테이징해야 한다.


**1. 파일 수정**

echo "hello world" >> hello.txt


**2. 변경된 파일 스테이징 (작업 준비 단계)**

git add hello.txt


**3. 스테이징된 파일을 커밋 (변경 사항 확정 저장)**

git commit -m "Add hello.txt with greeting message


**4. 연동할 원격 영역을 지정**

git remote add origin https://github.com/사용자이름/저장소이름.git


**5. 파일 업로드**

git push origin master


**6. 원격 영역에 있는 파일을 로컬로 복제**

git clone https://github.com/사용자이름/저장소이름.git

---

## 4. Branch와 Merge 

**Branch는 커밋의 포인터**
**기존 코드를 보존한 채 새로운 작업을 독립적으로 진행**


**1. hotfix 브랜치를 master 브랜치와 합치는 경우**
<p align="center">
  <img width="500" height="250" src=".\Branch_1.png">
</p>
<p align="center">
  <img width="500" height="250" src=".\Branch_2.png">
</p>

- C4 커밋은 C2 커밋에 기반한 브랜치이기 때문에 Merge 과정없이 master 브랜치 포인터만 이동 (**Fast-forward**)
- 별도의 커밋이 생성되지 않음 → 히스토리가 깔끔함
- 브랜치 간 변화가 직선적일 때 자동 병합 가능


**2. master와 별개로 진행하는 iss53 브랜치를 합치는 경우**
<p align="center">
  <img width="500" height="250" src=".\Branch_3.png">
</p>
<p align="center">
  <img width="500" height="250" src=".\Branch_4.png">
</p>

- master와 별개로 진행된 브랜치를 병합할 때 사용
- 각 브랜치가 가리키는 커밋 두 개와 공통 조상 하나를 사용하여 Merge를 한다. (**3-way Merge**)
- 3-way Merge 의 결과인 C6를 별도의 커밋으로 만들고 master가 해당 커밋을 가르킴 (**Merge  커밋**)


---

## 5. GitHub란?

GitHub는 Git 저장소를 클라우드에 **호스팅**하고, 다양한 **협업 도구**를 제공하는 플랫폼이다.  
개발자들은 GitHub를 이용해 코드 공유, 협업, 코드 리뷰 등을 효율적으로 수행할 수 있다.


### GitHub의 핵심 역할

- Git 저장소를 웹에서 관리
- 협업 도구 제공: Pull Request, Issues, Projects, Actions 등
- 코드 리뷰, 피드백, CI/CD 연동
- 공개/비공개 저장소 운영 가능


### Git vs GitHub 

| 구분 | Git | GitHub |
|------|-----|--------|
| 역할 | 버전 관리 도구 | Git 저장소 호스팅 및 협업 플랫폼 |
| 위치 | 로컬 | 클라우드 |
| 사용 방식 | CLI 기반 | 웹 UI + CLI 지원 |
| 기능 | 커밋, 브랜치, 병합 등 | Pull Request, Issues, Actions 등 협업 기능 |

---

## 6. GitHub 활용 방법


### 6.1 저장소(Repository) 생성

1. GitHub에서 `New repository` 클릭
2. 이름, 설명, 공개/비공개 여부 설정
3. README, `.gitignore`, 라이선스 선택 가능


### 6.2 로컬과 원격 연결

git remote add origin https://github.com/사용자명/저장소명.git

git push origin main


### 6.3 Pull Request(PR)

이 브랜치에서 작업한 내용을 메인 브랜치에 **"합쳐도 될까요?”** 하고 요청하는 과정
- 실수 방지 (병합 전에 확인 가능)
- 코드 리뷰로 품질 향상

**Fork**: 다른 사람의 저장소를 내 계정으로 복사   
→ 저장소를 내 공간으로 가져오기

**Clone**: 내 로컬 환경에 저장   
→ git clone으로 내 환경에 다운받기

**Branch**: 새로운 기능을 위한 브랜치 생성   
→ git checkout -b feature/기능명

**Commit & Push**: 작업 후 원격 브랜치에 푸시

**PR 생성**: GitHub에서 Pull Request 생성하여 코드 리뷰 요청   
→  리뷰어가 확인하고 승인하면 병합(Merge)


### 6.4 Issue 트래킹

**Issue 등록**: 버그 발생, 기능 요청 등 작업이 필요할 때 등록

**라벨(Label)**: Issue의 종류(예: bug, feature, help wanted)를 분류하는 태그   
→ 우선순위와 역할군을 지정하여 구별에 용이

**마일스톤(Milestone)**: 이슈들을 하나의 목표(예: v1.0 출시)로 묶어 관리   
→ 프로젝트 일정을 계획하고 추적하는 데 도움됨

**Assignees(담당자 지정)**: 누가 이 작업을 할 건지 지정 가능   
→ 협업 효율 증가


### 6.5 README.md 작성

프로젝트 설명, 설치 방법, 사용법, 기여 방법 등을 기술

오픈소스에서의 첫인상


### 6.6 GitHub Actions (CI/CD)

자동 테스트, 빌드, 배포를 위한 워크플로우 설정 가능

.github/workflows 디렉토리에 YAML 형식으로 구성

---

## 번외 - Git 실습
| 명령 | 의미 |
|------|-----|
| git init	 | git 파일 생성 |
|   |   |
| echo ~~~ | 파일 생성 |
| git add 파일명 |   |
| git commit -m "설명" |   |
| git remote add origin 주소 | 원격 저장소와 연동 |
| git branch -M main | 브랜치 이름 강제 변경 |
| git push -u origin main |   |
|   |   |
| git checkout -b feature/login | 브랜치 생성 및 이동 |
| echo ~~~ | 파일 생성 |
| git add 파일명 |   |
| git commit -m "설명" |   |
| git push -u origin feature/login |   |
|   |   |
| git checkout main	 | main으로 복귀 |
| git branch -d feature/login | 브랜치 삭제 |
| git push origin --delete feature/login  | 원격저장소의 브랜치 삭제 |
