# 180130 CustomUI

- UIView
- UILabel
- UIImageView
- UIButton


-. 계층 관계, 속성, 행동, 클래스/객체 개념  
-. NSObject 상속  


## Font

1.     폰트 넣기
    - font file(ttf, otf) 프로젝트 내부 삽입  
    - info.plist > Fonts provided by application >> item 추가.  
        ㄴ Value name = file Name.확장자명   
    
2.     fontName 확인  
    -. 파일명과 폰트네임 다를 수 있음. 확인 필요   

3. 폰트 삽입  
-. UIFont(name: “fontName”, size: )  


## ImageView

- isUserInteractionEnabled (Bool, 이벤트 전달)  
    ㅇ default Value  
    -. View : true  
    -. ImageView : false  
    -. Button : true  
- ImageView.addSubview(Button) 
    : 부모(ImageView)에서 이벤트를 전달받지 못하기 때문에 Btn에 전달 X. 이렇게 하려면 ImageView를 true로 바꿔줘야.  
- View.addSubview(Button) : 가능  

- contentmode  
    -. fill  
    -. fit  
    -. to fill  
   
** UIImage 넣을 때, png는 확장자명 안 넣어도 됨. 그 외에는 추가추가  

## Button
- addTarget (액션 추가)  
- setTitle (텍스트 추가) / setTitleColor  
    - 상태값(.normal, .highlighted)를 넣어야 하기 때문에 set 이용  


- Custom View 만들기  
    ㄴ ImageView  
    ㄴ Label  
    ㄴ Button  

    -. 2 x 2 Matrix
    ㄴ for문으로 Custom View 집어넣기