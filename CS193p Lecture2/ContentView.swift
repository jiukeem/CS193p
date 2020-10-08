//
//  ContentView.swift
//  CS193p Lecture2
//
//  Created by 김지우 on 2020/10/08.
//

// 오늘은 이론수업. MVVM과 각종 타입들에 대해 배워보자
// MVVM : Model-View-ViewModel 의 줄임말로 design paradigm의 한 종류이다.
// a "code organizing" architectural design paradigm. works in concert with the concept of "reactive" user-interfaces.
// 스위프트는 두가지 컨셉으로 나눠 이해할 수 있다. 뒤에서 작동하는 Model과 맨 앞에서 사람들에게 보여지는 View. 그리고 MVVM은 이 두개를 연결시키는 방법이다.
// Model은 UI independent 하다. 이 앱의 data와 logic을 담고있다. 렉쳐1에서 만든 프로그램을 예로 들어 설명하자면 카드(데이터), 카드를 뒤집는방법(클릭), 카드가 match되는 조건(같은 이모지), 맞혔을 때 얻는 포인트 등이다. 간단히 말해 "the truth" 라고 할 수 있겠다.
// View는 Model을 reflect 한다. data는 언제나 model에서 view 방향으로 흐르며 view의 목적은 model과 똑같게 화면에 나타내는 것이다. view는 stateless 상태인데 왜냐면 model에 state들이 다 명시되어 있으니까. view 자체는 아무 state도 가지지 않는다.
// view는 declarative 한 성격을 지닌다. declarative와 상반된 개념은 imperative인데 what 과 how의 차이라고 할 수 있다. declarative는 그 기저에 imperative abstraction 을 깔고 간다.
// 간단한 예를 들면 친구가 월마트 옆에 있을 때 우리집에 오는 것에 대해 생각해보자. imperative는 월마트의 어느 출입구로 가서 어느 방향으로 몇 블록을 오면 어디인데 거기서 왼쪽으로 틀어서... 하고 설명하는거라면 declarative는 우리집 주소는 어디어디야 하고 알려주는 거라고 할 수 있다. 즉, 주소를 알려줄 때는 듣는 사람이 주소를 듣고 위의 imperative 과정을 혼자 실행할 능력이 있을 거라는 가정이 있다(혹은 내비가 있던지)
// 우리가 어제 짠 코드들은 전부 declarative 하다. RoundedRectangle을 보면 이 위치부터 이 위치까지 직교하는 네개의 선을 긋고 가장자리에는 1/4원을 대고 잘라내- 이런식으로 쓰지 않았다. 우리는 그냥 RoundedRectangle 이라고 declare 밖에 안했고 그걸 얘가 알아서 실행하고 있다.
// UI에는 imperative 한 방식이 잘 안맞는데 메인 이유는 시간이다. imperative 한 방식이라면 roundedrectangle 에만 해도 십여개의 함수가 작동할텐데 이걸 수정할 때마다 실시간으로 반영하는건 사실상 불가능하다. imperative는 time dependent 한 반면 declarative는 time imdependent하다고 말할 수 있겠다.
// View의 마지막 특징은 reactive 하다는 것. model이 수정되면 자동적으로 그 수정사항을 반영한다.


// MVVM 에는 Model 과 View 말고 한가지가 더 있는데 그게 바로 ViewModel 이다. viewmodel의 역할은 view를 model에 bind 하는 것이다. 또한 view를 위해 model을 interpret 하는 일도 수행한다.
// 지금 짠 코드야 간단하지만 model이 sql db 거나 더 복잡한거라면? 그런 경우에는 model을 simplify 해주는 viewmodel이 필요하다.
// 자 그럼 이제 model 이 있고 그건 viewmodel을 통과해서 view 로 간다.
// viewmodel은 model의 변경사항들을 체크한다. 바뀐 부분을 알아채는 것은 viewmodel의 가장 중요한 역할! 그리고 나서 선택적으로 그걸 interpret한다. 즉 그냥 처리할 때도 있고 다른 포맷으로 바꿔처리하기도 한다는 것. 그리고나면 이제 출력을 해야하는데 여기서 중요한 점은 viewmodel이 view에 pointer를 가지고 있지는 않다는 점이다. 흠 이게 왜 중요한지는 모르겠는데 어쨌든 view에게 콕 찝어서 야, 여기 이부분이 이렇게 바뀌었어 하는게 아니다. 대신 세상에(?) publish 한다. 심지어 어느부분인지도 안알려주고 "변경사항이 있어----!" 한다. 그럼 그걸 구독중이던(?) view가 viewmodel 에게 물어본다. "야 바뀐게 뭐야? 나 그거랑 맞게 그려야돼서."
// 이걸 model이 아닌 viewmodel에게 물어보는 이유는 viewmodel이 변경사항에 대한 interpret을 진행하고 있을 수도 있고, 더 중요하게는 악성코드가 model에 닿지 못하게 하려는 이유다. view를 가장한 뭔가가 바로 model에 닿으면 프로그램이 망가져 버리니까 viewmodel을 내세워서 보안을 강화한다.
// 어쨌든 간단히 줄이자면, viewmodel 이 변경사항이 있음을 알리면 view는 viewmodel을 참조해서 조정한다.
// 이따가 어제 썼던 코드에 MVVM을 적용해보자.


// 그 전에 type 을 살펴보고 넘어갈거다. swift 에는 다음과 같인 6개의 type이 있다. struct, class, protocol, "Don't Care" type(aka generics), enum, functions(function도 타입이다! 파이썬과 다름)
// 먼저 struct와 class를 보자.
