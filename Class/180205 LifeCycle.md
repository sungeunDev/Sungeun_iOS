# 180205 LifeCycle


## ㅁ Application Life Cycle
- MVC Pattern
- user touch -> 하드웨어 인식 -> iOS에 전달 ->  UIApplication에 전달.

```
- 앱 실행 > UIApplication() > App Delegate 
                                          > Main() (storyboard) > View controller > ViewDidLoad
```

- UIApplication() 이후 App Delegate / Main() 투트랙으로.
- 둘 다 작성시, 먼저 실행되는건 storyboard. 마지막까지 살아남는 건 code이기 때문에 적용은 code로 됨

```
VC 만드는 법.
1) UI를 통해서(스토리보드) 인스턴스 생성
2) 코드를 통해서 만든 후에, UI를 불러오기
```

- should -> return : 하기 전에
- did : 한 후에
- first responder

```
VC ------> View    : 호출
     <------             : Delegate
```