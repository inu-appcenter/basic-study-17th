# git, GitHub

- git이란
    
    1.코드 변경을 관리해주는 도구
    
    2.버전 관리 시스템
    
    - 여러 코드를 하나도 합치는데 용의
    - 이전 버전의 코드로 되돌아가기 가능
    
    3.git 명령어 정리
    
    | 명령어 | 내용 설명 |
    | --- | --- |
    | $ git init | .git 하위 디렉토리 생성 |
    | $ git clone <https:.. URL> | 기존 소스 코드 다운로드/복제 |
    | $ git clone /로컬/저장소/경로 | 로컬 저장소 복제 |
    | $ git clone 사용자명@호스트:/원격/저장소/경로 | 원격 서버 저장소 복제 |
    | $ git add <파일명> | 커밋에 단일 파일의 변경 사항을 포함 |
    | $ git add * | (인덱스에 추가된 상태) |
    | $ git add -A | 커밋에 파일의 변경 사항을 한번에 모두 포함 |
    | $ git commit -m “커밋메세지” | 커밋 생성 |
    | **$ git status** | 파일 상태 확인 |
    | **$ git branch** | 브랜치 목록 |
    | **$ git branch <브랜치이름>** | 새 브랜치 생성 (local로 만듦) |
    | **$ git checkout -b <브랜치이름>** | 브랜치 생성 & 이동 |
    | **$ git checkout master** | master branch로 되돌아 옴 |
    | **$ git branch -d <브랜치이름>** | 브랜치 삭제 |
    | **$ git push origin <브랜치이름>** | 만든 브랜치를 원격 서버에 전송 |
    | **$ git push -u < remote > <브랜치이름>** | 새 브랜치를 원격 저장소로 push |
    | **$ git pull < remote > <브랜치이름>** | 원격에 저장된 git 프로젝트의 현재 상태를 다운받고 + 현재 위치한 브랜치로 병합 |
    | **$ git push origin master** | 변경사항 원격 서버에 업로드 |
    | **$ git push < remote > <브랜치이름>** | 커밋을 원격 서버에 업로드 |
    | **$ git push -u < remote > <브랜치이름>** | 커밋을 원격 서버에 업로드 |
    | **$ git remote add origin <등록된 원격 서버 주소>** | 클라우드 주소 등록 및 발행 |
    | **$ git remote remove <등록된 클라우드 주소>** | 클라우드 주소 삭제 |
    | **$ git pull** | 원격 저장소의 변경 내용이 현재 디렉토리에 가져와지고(fetch) 병합(merge)됨 |
    | **$ git merge <다른 브랜치이름>** | 현재 브랜치에 다른 브랜치의 수정사항 병합 |
    | **$ git add <파일명>** | 각 파일을 병합할 수 있음 |
    | **$ git diff <브랜치이름><다른 브랜치이름>** | 변경 내용 merge 전에 바뀐 내용을 비교할 수 있음 |
    | **$ git log** | 현재 위치한 브랜치 커밋 내용 확인 및 식별자 부여됨 |
    | **$ git checkout -- <파일명>** | 로컬의 변경 사항을 변경 전으로 되돌림 |
    | **$ git fetch origin** | 원격에 저장된 git프로젝트의 현 상태를 다운로드 |
- git 데이터 저장 방식
    
    
    | 객체 | 역할 | 특징 |
    | --- | --- | --- |
    | Blob | 파일의 원본 데이터를 저장 | 내용만 저장,이름 없음 |
    | Tree | 디렉터리 구조(폴더) 구조 저장 | 파일과 디렉터리 정보 포함 |
    | Commit | 특정 시점의 저장소 상태 기록 | 부모 Commit 정보 포함 |
    | Tag | 특정 Commit을 가리키는 참조 | 주로 버전 관리에 사용 |
- GitHub이란
    - 코드를 저장,공유 할 수 있게 해주는  구글 드라이브와 같은 느낌의 저장소
    - git 으로 관리된 코드를 psuh 를 통하여 GitHub 으로 올림
- GitHub를 사용하는 이유
    - git은 로컬 저장소에서 작동하기 때문에 공유와 협업이 어려움
    - 팀 프로젝트시 매우 유용하다.
    - private,public 등의 공개 범위를 설정 할 수 있다.
    - public 설정된 소스들을 open source 라 부르면 전세계의 오픈 소스들을 확인 할 수 있다.
- 용어 정리
    
    
    | 용어 | 의미 |
    | --- | --- |
    | 저장소(Repository) |  Local ,Remote로 분류 할 수 있으며 각각 개인용과 원격서버용 저장소를 의미합니다. |
    | 브랜치(Branch) | 작업을 분리하기 위한 수단이며, 주로 main, master 브랜치가 주 브랜치로 사용됩니다. |
    | 커밋(commit) | 변경사항을 로컬 저장소에 기록합니다. 커밋은 변경 내용, 작성자 ,날짜 같은 정보와 함께 고유 ID를 가집니다. 깃은 시간에 따라 코드가 변화된 것을 영구적으로 저장합니다. |
    | 병합(Merge) | 두 브랜치의 변경사항을 하나로 합치는것을 의미 합니다. |
    | 충돌(Conflict) | 두 브랜치를 병합할때 같은 파일의 같은 부분이 다르게 수정되어 병합할 수 없는 상황을 의미합니다. |
    | 풀(Pull) | 원격 저장소의 변경 사랑을 원격 저장소에 업로드 하는 과정입니다. |
    | 풀 리퀘스트(Pull Request) | 하나의 브랜치에서 다른 브랜치로 변경사항을 병합하기 위한 요청입니다. |
    | 푸시(Push) | 로컬 저장소의 변경사항을 원격 저장소로 업로드 하는 과정입니다. |
- 인용 자료(ref)
    
    https://www.dbpia.co.kr/journal/articleDetail?nodeId=NODE11231379
    
    https://www.hanbit.co.kr/channel/category/category_view.html?cms_code=CMS2036561776
    
    https://dntmdgns03.tistory.com/80
    
    https://velog.io/@delilah/GitHub-Git-%EB%AA%85%EB%A0%B9%EC%96%B4-%EB%AA%A8%EC%9D%8C