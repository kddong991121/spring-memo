# 📝 Memo — Spring MVC 메모장

카테고리별로 메모를 작성·수정·삭제할 수 있는 간단한 메모장 웹 애플리케이션입니다.  
Spring MVC + MyBatis + Oracle 구조로 **Controller → Service → DAO → Mapper** 계층을 직접 구성하며 CRUD 흐름을 익히기 위해 만들었습니다.

## 🛠 기술 스택

| 구분 | 사용 기술 |
|---|---|
| Language | Java 11 |
| Framework | Spring MVC 5.3 |
| Persistence | MyBatis, HikariCP, log4jdbc |
| Database | Oracle XE |
| View | JSP, JSTL, jQuery |
| Build / IDE | Maven, STS3 |
| 기타 | Lombok, Logback |

## ✨ 주요 기능

- **목록 보기**: 메모와 카테고리(색상)를 JOIN 하여 최신순으로 표시
- **메모 쓰기**: 카테고리를 선택해 새 메모 등록
- **메모 수정**: 기존 메모 내용과 카테고리 변경
- **메모 삭제**: 확인 후 삭제

## 🏗 구조

```
요청 ─▶ MemoController ─▶ MemoService ─▶ MemoDao ─▶ mappers/memo.xml ─▶ Oracle
                │
                └─▶ JSP (index / add / edit / del + *ok.jsp 결과 페이지)
```

```
src/main/java/com/test/memo
├── controller/MemoController.java   # URL 매핑 (/, /add.do, /edit.do, /del.do ...)
├── service/MemoService.java         # 비즈니스 로직
├── repository/MemoDao.java          # SqlSessionTemplate으로 Mapper 호출
└── model/                           # MemoDto, CategoryDto
src/main/resources/mappers/memo.xml  # SQL
src/main/webapp/WEB-INF/views/       # JSP 화면
script.sql                           # 테이블·시퀀스·샘플 데이터
```

## 🗄 DB 설계

| tblCategory | | tblMemo | |
|---|---|---|---|
| seq (PK) | 카테고리 번호 | seq (PK) | 메모 번호 (seqMemo) |
| category | 이름 | memo | 내용 |
| color | 표시 색상 | regdate | 작성일 |
| | | cseq (FK) | → tblCategory.seq |

## ▶ 실행 방법

1. Oracle XE에서 `script.sql` 실행
2. `src/main/resources/config/db.properties.example`을 복사해 `db.properties`로 만들고 DB 접속 정보 입력
3. STS/Eclipse에서 Maven 프로젝트로 Import 후 Tomcat 9에 배포
4. 브라우저에서 `http://localhost:{포트}/memo/` 접속

## 📚 배운 점

- Spring MVC의 계층 분리(Controller / Service / Repository)와 각 계층의 책임
- MyBatis Mapper XML 작성과 `SqlSessionTemplate`을 이용한 DAO 구현
- 처리 결과(`result`)를 JSP로 넘겨 성공/실패 분기하는 흐름
