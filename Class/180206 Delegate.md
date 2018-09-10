# 180206 Delegate

## ㅁ Design Pattern 
- 반복적인 문제 해결 전략들을 하나의 패턴으로 정의한 것.
- iOS 개발에 자주 사용되는 디자인 패턴
    - 델리게이션
    - 데이터소스
    - MVC(Model-View-Controller)
    - Target-Action Pair

#### ㅇ Delegation
- 선생님이 반장에게 인원 확인을 위임하는 경우. 즉, 한 객체가 정해진 의무 중 일부를 다른 객체에게 위임하는 것을 델리게이션 패턴이라고 함.
- 객체가 해야할 일을 부분적으로 확장해서 대신 처리. 대신 처리 해줄 객체(반장) / 처리하라고 시키는 객체(선생님)가 필요.
- ex. UITextField에서 텍스트 필드의 내용이 변경된 것을 알리기 위해 델리게이션을 사용

- 델리게이트 사용하기  
    1) 프로토콜 채택  
     -. Protocol : 기본은 required. 필수적으로 모든 메소드를 만들어야. But, Optional 키워드가 앞에 붙으면 선택적으로 만들어서 사용 가능.  
    2) 위임자 정하기  
     -. 프로토콜을 활용해서 delegate 역할을 하게 하도록.  
     -. textField.delegate = self  
     -. self = ViewController  
    3) 구현하기  
      -. 메소드 불러오기(자동완성)  
      -. 메소드 작성  


#### ㅇ 데이터소스
- 선생님이 반장에게 준 인원 확인 임무 중 전체 인원 데이터를 알려달라고 부탁함. 즉, 구체적인 데이터를 제공받는 것이 데이터 소스의 패턴. 
- 데이터 소스는 델리게이트와 유사하지만, 다른 객체에 반응하는 대신 요청이 오면 다른 객체에 데이터를 제공하는 역할을 함. 주로 테이블 뷰에서 자주 확인할 수 있음.

#### ㅇ 모델-뷰-컨트롤러
- view —— Controller —— Model(data)
- 컨트롤러는 중간에서 모델(데이터)과 뷰(사용자 인터페이스)를 함께 묶는 접착제 역할

#### ㅇ 타깃-액션 쌍
- 이벤트 발생 시, 한 객체는 또 다른 객체의 메서드를 호출. 타깃은 호출할 메서드를 가진 객체이고, 액션을 호출된 메서드.
- ex. 버튼의 addTarget. 터치 이벤트가 발생하면 해당 메서드를 다른 객체(보통 뷰 컨트롤러)에서 호출.

<br>

##### ㅁ 출처 & 참고 :   
-. https://brunch.co.kr/@joonwonlee/2 : 디자인 패턴  
-. http://zeddios.tistory.com/8  

-. https://magi82.github.io/ios-delegate/ : 나중에 다시 읽어보기  
ㄴ 왜 델리게이트 패턴을 이용하는가  
ㄴ 테이블 뷰에서의 델리게이트 패턴   