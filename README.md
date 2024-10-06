# Junion(휴먼 클라우드 이력 관리 플랫폼 웹사이트): 7인 프로젝트

We aimed to provide not only job information but also career-related resources and a community function, specifically for junior developers. To solve the problem of information imbalance, we wanted to activate the community. We also implemented a system where personal skills and company requirements are filtered by keywords, so the right job postings and candidates can be shown to each other.


## Developed by Team
- **UI/UX Design**: Design of pages and layouts.
<hr/>  
Contributor(Me) : 🐳yeonjuseo712@gmail.com

Developed Features:
- **Individual Member Information**: Read, Update, Delete (RUD)
- **Individual Member's Notice Info**: Create, Read, Update, Delete (CRUD)
<hr/>
Contributor : 🎮jwlme@naver.com  
Contributor : 🥑aovhff@naver.com  
Contributor : 🍀jsjszszs12@gmail.com  
Contributor : 🥞ekwjd088@naver.com  
Contributor : 🥓fgghk132@naver.com  
Contributor : 🐿️choimin0915@naver.com
<hr/>

💻프로젝트 개요

💬 SpringBoot Flamework를 사용하여 작성하였으며, MVC 패턴을 따르고 있습니다.신입 개발자를 타겟으로 채용 정보뿐만 아니라 커리어에 도움이 되는 정보와 커뮤니티 기능을 제공하고자 했습니다. 정보 불균형 문제를 커뮤니티 활성화를 통해 해결하고, 개인의 기술 스택과 기업의 요구 사항을 키워드화하여 필요한 인재와 공고가 필터링되어 노출되도록 구현했습니다.

- [x] [💿서비스 시연 영상](#서비스-시연-영상)
- [x] [🎯서비스 핵심기능](#서비스-핵심기능)
- [x] [🛠기술 스택](#기술-스택)
- [x] [✨기술적 의사결정](#기술적-의사결정)
- [x] [🚧시스템 아키텍처](#시스템-아키텍처)
- [x] [📖ERD](#erd)

<hr/>

### 💿서비스 시연 영상
# 개인사용자 시나리오
<iframe width="50%" src="https://www.youtube.com/embed/7M9xw1jGwF0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# 기업사용자 시나리오
<iframe width="50%" src="https://www.youtube.com/embed/gQHTiSeQNeE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


### 🎯서비스 핵심기능
```
👤 회원 : 로그인 | 회원가입 | 아이디 찾기 | 비밀번호 찾기 
🏡 개인 마이페이지 : 이력서CRUD | 받은제안, 최근본공고, 스크랩공고 RUD | 관심기업 CRUD | 회원정보조회 수정 | 회원탈퇴
🏡 기업 마이페이지 : 채용공고CRUD | 지원된 이력서 관리 | 회원정보조회 수정 | 회원탈퇴
🗃️ 채용 : 채용공고 검색,필터링 조회 | 지원하기
👨‍👨‍👧 인재풀 : 인재풀 검색/필터링 조회 | 포지션 제안하기(기업회원) |
👬커뮤니티 : 게시글 조회(사용자 타입별로 다른 게시판으로 접근) | 게시글 작성 및 수정, 삭제 | 댓글 및 좋아요 | 파일업로드 및 다운로드
👩🏻‍💻 고객센터 : 공지 조회 | 사용자 약관 조회 | REST API로 구현된 공지사항 CRUD
📝 DailyCS : Stack별 문제풀이 | 참여/미참여 확인 기능
💟 SNS : 팔로워,팔로잉 조회 | 다른 사용자 팔로우 | 채팅 | SNS게시글작성 | SNS게시글 조회 및 좋아요, 댓글 기능
```

### 사용자 시나리오(시연영상)

|<small>검색/필터링</small>|<small>인재 매칭 & 포지션제안</small>|
|:-:|:-:|
|<iframe width="100%" src="https://www.youtube.com/embed/LzOAwAQ9BZo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>|<iframe width="100%" src="https://www.youtube.com/embed/ZSCBRCvA5zo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>|
|<small><b>SNS</b></small>|<small><b>게시판(RESTful API)</b></small>|
|<iframe width="100%" src="https://www.youtube.com/embed/9k0EeGu-7jI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>|<iframe width="100%" src="https://www.youtube.com/embed/ABu2RIZL9kw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>|



### 🛠기술 스택
OS | Windows 10
--- | --- |
Language | ![Java](https://img.shields.io/badge/JAVA-000?style=for-the-badge&logo=java&logoColor=white) ![Spring](https://img.shields.io/badge/Spring-000?style=for-the-badge&logo=spring&logoColor=white) ![HTML5](https://img.shields.io/badge/html5-000?style=for-the-badge&logo=html5&logoColor=white) ![CSS3](https://img.shields.io/badge/css3-000?style=for-the-badge&logo=css3&logoColor=white) ![JavaScript](https://img.shields.io/badge/javascript-000?style=for-the-badge&logo=javascript&logoColor=white)
IDE | ![STS4](https://img.shields.io/badge/STS4-000?style=for-the-badge&logo=spring&logoColor=white) ![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-000?style=for-the-badge&logo=visualstudiocode&logoColor=white) ![MySQL Workbench](https://img.shields.io/badge/MySQL%20Workbench-000?style=for-the-badge&logo=oracle&logoColor=white)
Framework | ![Spring Boot](https://img.shields.io/badge/Spring%20Boot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white) ![MyBatis](https://img.shields.io/badge/Mybatis-d40000?style=for-the-badge)
Build Tool | ![Gradle](https://img.shields.io/badge/Gradle-02303A?style=for-the-badge&logo=gradle&logoColor=white)
Database | ![MySQL](src="https://img.shields.io/badge/Mysql-4479A1?style=flat-square&logo=Mysql&logoColor=white")
Frontend | ![HTML5](https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white) ![CSS3](https://img.shields.io/badge/css3-1572B6?style=for-the-badge&logo=css3&logoColor=white) ![JavaScript](https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black) ![jQuery](https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white)
Library | ![Spring Security](https://img.shields.io/badge/spring%20security-6DB33F?style=for-the-badge&logo=springsecurity&logoColor=white)
API | ![Iamport Payment](https://img.shields.io/badge/Iamport%20Payment-c1272d?style=for-the-badge) ![coolSMS](https://img.shields.io/badge/cool%20SMS-f7943a?style=for-the-badge)
Server |![Apache Tomcat 9.0](https://img.shields.io/badge/Apache%20Tomcat%20-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black)
Version Control | ![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white)


