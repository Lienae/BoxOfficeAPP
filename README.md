# 박스오피스 영화 앱 (Box Office Movie App)

## 프로젝트 개요
박스오피스 영화 앱은 영화진흥위원회 API를 활용하여 어제의 박스오피스 순위를 보여주는 iOS 애플리케이션입니다. 사용자는 인기 영화를 확인하고, 각 영화의 누적 관객 수와 어제 관객 수를 쉽게 조회할 수 있습니다. 또한, 각 영화의 상세 정보를 확인할 수 있는 기능과 영화관 검색 기능도 제공합니다.

## 기술 스택
- Swift
- UIKit
- WebKit
- Codable
- URLSession

## 설치 방법

1. **저장소 클론**
   ```bash
   git clone https://github.com/yourusername/box-office-movie-app.git
   cd box-office-movie-app
2. **Xcode에서 열기**
  - Xcode를 실행하고, 클론한 프로젝트를 엽니다.
  - A_009_ssw.xcodeproj 파일을 열어주세요.
3. **시뮬레이터 또는 실제 기기에서 실행**
  - Xcode에서 원하는 시뮬레이터를 선택하고, Run 버튼을 클릭하여 앱을 실행합니다.

## 사용법
1. 앱을 실행하면 어제의 박스오피스 영화 목록이 표시됩니다.
2. 각 영화의 순위와 제목, 누적 관객 수, 어제 관객 수를 확인할 수 있습니다.
3. 영화 목록에서 원하는 영화를 선택하면 해당 영화의 상세 정보를 웹 페이지로 확인할 수 있습니다.
4. 영화관 검색 기능을 통해 가까운 영화관을 찾아볼 수 있습니다.

## 주요 기능
- API 연동: 영화진흥위원회 제공 API를 통해 실시간 박스오피스 데이터를 가져옵니다.
- 테이블 뷰: UITableView를 사용하여 영화 목록을 효율적으로 표시합니다.
- 상세보기: 사용자가 선택한 영화의 상세 정보를 나무위키 페이지에서 확인할 수 있습니다.
- 영화관 검색 기능: Kakao맵을 이용하여 영화관을 검색할 수 있는 기능을 제공합니다.
