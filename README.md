# 🍚 밥이화(BabEwha) 🍚
### OCR 기반 배달 어플리케이션 **🍚** **밥이화(BabEwha) 🍚** AI 레포지토리입니다.
#### 1️⃣ Client 레포지토리 링크: https://github.com/BabEwha/BabEwha-Client
#### 2️⃣ Backend 레포지토리 링크: https://github.com/BabEwha/BabEwha-Backend

- 개발 기간: 2023.03.15(금) 15:00 ~ 2023.03.17(일) 17:20 <br/>
- 예상 사용자 설문조사: 3.15(금) 21:00 ~ 3.17(일) 14:00<br/>
- 설문 링크 (현재 폐쇄): https://docs.google.com/forms/d/e/1FAIpQLSfulZbuCy8cGD-FTW601AuBbd7FedH7zUMOYdtjfu-iqWXjSw/viewform?usp=sf_link

<br/>

## 🍙 프로젝트 소개

### 기존에 이화인끼리 진행하던 ‘배달톡방’을 어플화하여 직관적이고 신속한 배달을 가능하게 하는 ‘배달 공구 서비스’

### 🍘 문제 상황 및 솔루션
#### 1️⃣ 식사권이 보장되지 않는 상황
- 넓은 부지를 소유하고 있는 우리 학교지만, 상권은 정문 위주로 형성되어 있으며 언덕이 심한 특성으로 인해 한 번 각 건물로 등교하면 다른 장소로의 이동이 어려움
- 공대, 연협, 중도 등 정문과 거리가 있는 건물의 학생들은 근방에 음식점이 없어 편의점이나 배달을 통해 식사를 해결하고 있음.
- 편의점의 경우 영양 불균형 문제가 심각하게 발생함. 그러나 배달의 경우 오르는 배달팁이 부담됨.
#### 2️⃣ 배달 공구를 이용하고 있으나, 현존하는 배달 공구는 카카오톡 오픈채팅을 이용하기에 여러 불편이 따르는 상황
- 공구를 할 때마다 새로 오픈채팅방을 파야 하고, 알림이나 입장/퇴장 등 배달 공구 경험을 방해하는 여러 요소들이 존재함
- 이로 인해 배달 공구를 포기하는 인원이 다수 발생하여 공구 리젠이 줄어듦
- => 직관적인 UI/UX로, 사용자로 하여금 신속하고 긍정적인 배달 공구 경험을 쌓게함. 이를 통해 배달 공구를 활성화하고, 교내 이화 학생들의 식사권 보장 및 배달팁 감소를 통한 금전적 이득 보장을 가능케 함. 

### 🍘 가치
#### '이화’라는 공간 내에서 공동 생활을 하는 이화인이 공동 구매 경험을 통해 서로의 이익 증진과 권리 보장을 도모할 수 있음 
### 🍘 차별성
#### 1️⃣ 실제 사용자 리서치를 통해 얻은 결과로, 사용자 맞춤형 UI/UX 제안
- 총 응답 324개를 바탕으로 신뢰성 향상
- 사용자가 진정으로 원하는 서비스임을 확인
#### 2️⃣ 배달 공구의 신속성을 위하여 AI (OCR) 기술 적용
- 공구 참여자, 공구 개설자의 주문내역 및 영수증을 확인하여 신속하고 안전한 정산

<br/><br/>

## 🍙 프로젝트 구조

<img width="1000" src="https://github.com/BabEwha/BabEwha-ai-private/assets/91009436/adda6865-b0f4-4f80-9cad-79eb534990bb"/>

- Client: Swift(iOS)
- Server: Django, MySQL, AWS EC2, AWS S3
- AI: Google Vision, Flask, AWS EC2

<br/><br/>

## 🍙 팀원 소개

| <img width="200" src="https://github.com/BabEwha/BabEwha-ai-private/assets/91009436/1a77ca56-1b72-48cc-81e1-09d2d2ee1688"/> | <img width="200" src="https://github.com/BabEwha/BabEwha-ai-private/assets/91009436/0c997a4a-b942-457a-8c20-fb8bdd0a7277"/> | <img width="200" src="https://github.com/BabEwha/BabEwha-ai-private/assets/91009436/f1414b85-9269-4aae-a121-af8e01090579"/> | <img width="200" src="https://github.com/BabEwha/BabEwha-ai-private/assets/91009436/6b676f0c-d5e1-44e9-ab1d-1d00d7c48046"/> | <img width="200" src="https://github.com/BabEwha/BabEwha-ai-private/assets/91009436/4be5a2b8-fd32-4ccc-b89c-00d4269c77ce"/> |
| --- | --- | --- | --- | --- |
| **엄채은** | **양연우** | **허혜민** | **김원정** | **이남영** |
| 기획 | 디자이너 | 프론트엔드 | 백엔드 | IT기술(AI) |

<br/><br/>

## 🍙 Client 정보

### 1️⃣ 버전
- iOS 17.0 +
- 다크 모드, 세로모드 미지원 
- iPhone 15 Pro에서 최적화되어 있습니다. 

### 2️⃣ 프레임워크
- View 
    - SwiftUI

### 3️⃣ 아키텍쳐
- MVVM 패턴 (Model - View - ViewModel) 
![image](https://github.com/team-rocketdan/MAKS-iOS/assets/97100404/7ea2be2c-f69a-490f-919a-2714a0566fb1)

(출처: https://ko.wikipedia.org/wiki/%EB%AA%A8%EB%8D%B8-%EB%B7%B0-%EB%B7%B0%EB%AA%A8%EB%8D%B8)

<br/><br/>

## 🍙 실행 화면 (스마트폰 화면 직접 녹화)

### 1️⃣ 진입
| <img height = "400" width="200" src="https://github.com/BabEwha/BabEwha-Client/assets/97100404/89905ce9-09b6-4638-b4af-a0f4e118b0ba"/> |
| :---: |
| **진입** |  

### 2️⃣ 로그인
| <img height = "400" width="200" src="https://github.com/BabEwha/BabEwha-Client/assets/97100404/9e55b9a4-3b57-4738-a9a6-b3ba57339c69"/>  |
| :---: |
| **로그인** |  

### 3️⃣ 회원가입
 | <img height = "400" width="200" src="https://github.com/BabEwha/BabEwha-Client/assets/97100404/1172027f-4921-4369-aa12-aa811259b77c"/> | <img height = "400" width="200" src="https://github.com/BabEwha/BabEwha-Client/assets/97100404/62ba7fa6-4577-4c05-8a05-2791644149b2"/> |<img height = "400" width="200" src="https://github.com/BabEwha/BabEwha-Client/assets/97100404/b9df24f5-29f3-4675-adb0-ada10a03310a"/> | <img height = "400" width="200" src="https://github.com/BabEwha/BabEwha-Client/assets/97100404/945f69b2-27d2-4ac9-b2e5-8dadd0b7e52f"/> |
| :---: | :---: | :---: | :---: |
| **이메일** | **이름** | **비밀번호** | **권한** | 


### 4️⃣ 리더벗(방장)
| <img height = "400" width="200" src="https://github.com/BabEwha/BabEwha-Client/assets/97100404/abd3e428-4a3e-4fcd-b091-11ac8d69c4c9"/> 
| :---: |
| **주문과정** |  
### 5️⃣ 참여벗(참여자)
| <img height = "400" width="200" src="https://github.com/BabEwha/BabEwha-Client/assets/97100404/8183baf3-8b0d-4cf2-8732-bf3ce3f9ea8d"/> | <img height = "400" width="200" src="https://github.com/BabEwha/BabEwha-Client/assets/97100404/22d0186c-ab09-4b5e-902c-92aac4beeaef"/> | <img height = "400" width="200" src="https://github.com/BabEwha/BabEwha-Client/assets/97100404/abd3e428-4a3e-4fcd-b091-11ac8d69c4c9"/> |
| :---: | :---: | :---: |
| **앱에서 메뉴보기** | **주문 보내기** | **주문과정** | 

<br/><br/>

## 🍙 폴더 구조 
```sh
BabEwha
├── Assets.xcassets
├── BabEwhaApp.swift
├── Extension
│   ├── Color+.swift
│   ├── Date+.swift
│   ├── Font+.swift
│   ├── Image+.swift
│   └── View+.swift
├── Info.plist
├── Model
│   ├── Party.swift
│   └── User.swift
├── Preview Content
│   └── Preview Assets.xcassets
│       └── Contents.json
├── View
│   ├── Add
│   ├── Archive
│   │   └── ArchiveView.swift
│   ├── Component
│   │   ├── BEButton.swift
│   │   ├── BECheckBox.swift
│   │   ├── BENavigationBar.swift
│   │   ├── BEProcessView.swift
│   │   ├── BEProgressView.swift
│   │   ├── BETextField.swift
│   │   ├── HandoutPlace.swift
│   │   ├── ImageBanner.swift
│   │   ├── Information.swift
│   │   ├── LargeDivider.swift
│   │   ├── RestPeopleChip.swift
│   │   ├── SelectPlace.swift
│   │   └── TimeChip.swift
│   ├── Font
│   │   └── PretendardVariable.ttf
│   ├── History
│   │   ├── DepositView.swift
│   │   ├── HistoryView.swift
│   │   └── Leader
│   │       ├── ETASheet.swift
│   │       └── LeaderHistoryView.swift
│   ├── Home
│   │   ├── HomeView.swift
│   │   ├── PartyDetailView.swift
│   │   ├── PhotoPickerView.swift
│   │   ├── SelectImageSheet.swift
│   │   └── SendMenuSheet.swift
│   ├── Login
│   │   ├── LogoView.swift
│   │   ├── ReLoginRouteView.swift
│   │   ├── SignInView.swift
│   │   └── SignUp
│   │       ├── AuthorityView.swift
│   │       ├── SignUpView.swift
│   │       ├── TypeEmailView.swift
│   │       ├── TypeNameView.swift
│   │       └── TypePasswordView.swift
│   ├── Profile
│   │   └── ProfileView.swift
│   └── TabBarRouteView.swift
└── ViewModel
    ├── ToastViewModel.swift
    └── UserViewModel.swift

```




<br/><br/><br/><br/>
