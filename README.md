# DANIM : Travel Diary App
<img src="https://capsule-render.vercel.app/api?type=wave&color=007FFF&height=300&section=header&text=DANIM&fontSize=90&animation=fadeIn" />

## 📜 프로젝트 설명

### 개요
- 주제 선정 배경
   ![](./image/기획배경.png)
- 프로젝트 목표
   - 여행을 하면서 순간순간 기록을 남기고 싶지만 이를 힘들어하는 사람들을 위해, 텍스트를 입력할 필요없이 음성으로 편리하게 기록할 수 있는 프로그램.

### 구성
- STT를 사용하여 말한 내용을 텍스트로 변환하여 저장해줍니다.

- 여행 종료 시 [여행 종료 버튼]을 누르면, 여행 기록들을 정리함.

- 여행 기록을 타임라인 형식으로 해당 여행 기간 동안의 기록들을 정리

- 사진의 위치 정보를 저장. 위치를 기반으로 검색 기능

- 접근 권한 (앨범, 마이크 권한 등) 이용하여 앨범에도 데이터 저장.

- 욕, 비방 글 필터링 (Bad words api 등)


## 😲민감 키워드
- 시연을 위해 민감 키워드를 "행복"으로 설정 했습니다.
```
여러분들의 앞날에 무궁한 영광을 기원합니다. 모두 행복하세요.
```
![필터링wav](/uploads/873480e1b5ce1719e8b32871bcbe04a5/3180aa89-f81e-409a-b819-8d0188925852.wav)

## 🖼화면

| 에이                                                                                    | 비                                                                                                        |
| --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| ![하얀 강아지](https://i.esdrop.com/d/ZklKfna5T3.jpg)<p align="center"> **메인** </p>   | ![하얀 강아지](https://i.esdrop.com/d/ZklKfna5T3.jpg "하얀 강아지")<p align="center"> **홈** </p>         |
| ![하얀 강아지](https://i.esdrop.com/d/ZklKfna5T3.jpg)<p align="center"> **로그인** </p> | ![하얀 강아지](https://i.esdrop.com/d/ZklKfna5T3.jpg "하얀 강아지")<p align="center"> **마이페이지** </p> |
| ![하얀 강아지](https://i.esdrop.com/d/ZklKfna5T3.jpg) <p align="center"> **메인** </p>  | ![하얀 강아지](https://i.esdrop.com/d/ZklKfna5T3.jpg "하얀 강아지")<p align="center"> **홈** </p>         |



## 🛠사용법

### 설치

#### 프론트 빌드

```

```

#### 서버 빌드

```

```

### 호환 브라우저

- 안드로이드 어플리케이션


---

## 📂폴더 구조

#### 프론트엔드

```
frontend
└─ lib
   │  ├─ main.dart
   │  ├─ models
   │  │  ├─ LocationInformation.dart
   │  │  ├─ Post.dart
   │  │  ├─ PostForUpload.dart
   │  │  ├─ SearchedPost.dart
   │  │  ├─ Timeline.dart
   │  │  ├─ TimelineDetail.dart
   │  │  ├─ TimelineInfo.dart
   │  │  ├─ Token.dart
   │  │  └─ UserInfo.dart
   │  ├─ module
   │  │  ├─ audio_player_view.dart
   │  │  ├─ audio_player_view_model.dart
   │  │  ├─ bottom_navigation.dart
   │  │  ├─ camera_floating_action_button.dart
   │  │  ├─ custom_app_bar.dart
   │  │  ├─ images_page_view.dart
   │  │  └─ my_alert_dialog.dart
   │  ├─ services
   │  │  ├─ post_repository.dart
   │  │  ├─ search_repository.dart
   │  │  ├─ timeline_repository.dart
   │  │  ├─ upload_repository.dart
   │  │  └─ user_repository.dart
   │  ├─ utils
   │  │  ├─ app_scroll_behavior.dart
   │  │  ├─ auth_dio.dart
   │  │  └─ stack.dart
   │  ├─ view_models
   │  │  ├─ app_view_model.dart
   │  │  ├─ camera_view_model.dart
   │  │  ├─ home_feed_view_model.dart
   │  │  ├─ login_view_model.dart
   │  │  ├─ modify_profile_view_model.dart
   │  │  ├─ my_feed_view_model.dart
   │  │  ├─ post_view_model.dart
   │  │  ├─ record_view_model.dart
   │  │  ├─ search_bar_view_model.dart
   │  │  ├─ search_result_view_model.dart
   │  │  └─ timeline_detail_view_model.dart
   │  └─ views
   │     ├─ camera_screen.dart
   │     ├─ home_feed_page.dart
   │     ├─ login_page.dart
   │     ├─ main_page_view.dart
   │     ├─ modify_profile.dart
   │     ├─ my_feed_view.dart
   │     ├─ post_detail.dart
   │     ├─ post_list_item.dart
   │     ├─ record_screen.dart
   │     ├─ search_bar_view.dart
   │     ├─ search_result_page.dart
   │     ├─ timeline_detail_page.dart
   │     ├─ timeline_list_item.dart
   │     ├─ timeline_list_page.dart
   │     └─ user_information_view.dart
   ├─ pubspec.yaml
   └─ test
      └─ widget_test.
```

#### 백엔드

```
├─build
│  ├─docs
│  │  └─asciidoc
│  ├─generated-snippets
├─src
│  ├─docs
│  │  └─asciidoc
│  ├─main
│  │  ├─java
│  │  │  └─com
│  │  │      └─danim
│  │  │          ├─config
│  │  │          │  └─security
│  │  │          │      └─common
│  │  │          ├─conponent
│  │  │          ├─controller
│  │  │          ├─dto
│  │  │          ├─entity
│  │  │          ├─exception
│  │  │          │  └─controller
│  │  │          ├─repository
│  │  │          ├─service
│  │  │          └─utils
│  │  └─resources
│  │      └─static
│  └─test
│      └─java
│          └─com
│              └─danim
│                  └─controller
└─temp
```


---

## 🗺시스템 구성도

![image](https://lab.ssafy.com/s08-ai-speech-sub2/S08P22A701/uploads/dc1d48aa0088d981c17a066677aeb94a/Web_App_Reference_Architecture_V2.png)

---
## ERD
![Image_Pasted_at_2023-4-10_21-10](/uploads/b4c8f47701ba50ffd54094b1a8215802/Image_Pasted_at_2023-4-10_21-10.png)
---
## 🛢기술스택

|프론트엔드|백엔드|인프라|툴|
|--------:|------|-------|----|                                                                 
|<img src="https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"> | <img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white"> <img src="https://img.shields.io/badge/Spring Data JPA-6DB33F?style=for-the-badge&logo=Spring Boot&logoColor=white"><img src="https://img.shields.io/badge/Spring Security-6DB33F?style=for-the-badge&logo=Spring Security&logoColor=white"> <img src="https://img.shields.io/badge/gradle-02303A?style=for-the-badge&logo=gradle&logoColor=white"> <img src="https://img.shields.io/badge/Redis-FF0000?style=for-the-badge&logo=Redis&logoColor=white"> <img src="https://img.shields.io/badge/mariadb-4479A1?style=for-the-badge&logo=mariadb&logoColor=white"> <img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white">  <img src="https://img.shields.io/badge/flask-00979D?style=for-the-badge&logo=flask&logoColor=white"> <img src="https://img.shields.io/badge/jwt-black?style=for-the-badge&logo=jsonwebtokens&logoColor=white">| <img src="https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=Ubuntu&logoColor=white"> <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=Docker&logoColor=white"> <img src="https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=Jenkins&logoColor=white">  | <img src="https://img.shields.io/badge/Android Studio-3DDC84?style=for-the-badge&logo=androidstudio&logoColor=white"> <img src="https://img.shields.io/badge/IntelliJ IDEA-000000?style=for-the-badge&logo=IntelliJ IDEA&logoColor=white"> <img src="https://img.shields.io/badge/jira-0052CC?style=for-the-badge&logo=jira&logoColor=white"> <img src="https://img.shields.io/badge/GitLab-FC6D26?style=for-the-badge&logo=GitLab&logoColor=white"> <img src="https://img.shields.io/badge/Mattermost-0058CC?style=for-the-badge&logo=Mattermost&logoColor=white"> |

## 개발 환경

### BE

**툴**

- IntelliJ IDE

**언어 및 라이브러리**



### FE

**툴**

- android studio

**언어 및 라이브러리**

- Dart

- Flutter



### CI/CD

- Jenkins
- AWS EC2
- AWS S3

---

