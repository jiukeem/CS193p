//
//  ContentView.swift
//  CS193p Lecture2
//
//  Created by 김지우 on 2020/10/08.
//

// 오늘은 이론수업. MVVM과 각종 타입들에 대해 배워보자 -> 하단에 오늘 배운 걸 적용시켜 보는 실전도 있음
// MVVM : Model-View-ViewModel 의 줄임말로 design paradigm의 한 종류이다. 스위프트에서 사용하는 패러다임이다.
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

// 반대 방향은 어떨까? 지금까지는 model - viewmodel - view 순으로 흐르는 방식만 봤다. end-user는 view에서 상호작용을 하고 view에서 (swipe, tap 등 뭔지는 몰라도) user intent를 viewmodel로 올려보낼 수 있다. viewmodel은 process intent 의 역할도 수행한다.
// view에서 user intent가 발동하면 viewsms viewmodel로 intent function을 call한다. viewmodel이 이 function을 받으면, 이걸 process 해서 model을 조정한다(modify model) model이 바뀌면 다시 또 반복. model에서 viewmodel을 거쳐 view가 바뀐다.
// 위의 내용을 어렵게 생각할 필요없다. 우리는 view만 볼 수 있는데 예를 들어 렉쳐1의 카드게임에서 우리가 카드 한개를 탭했다고 하자. 그러면 view가 알아서 뒤집히는 모션과 뒤집힌 면을 보여주는게 아니라(view는 그냥 거울같은거니 얘 스스로 이렇게 변화할 수는 없다.) view가 viewmodel에게 야, 유저가 이거 탭했어 하고 알리고 viewmodel이 그걸 처리해서 model을 수정하면 (isFaceUp 을 false 에서 true 로 바꾼다든지) 그럼 그걸 반영한 view가 나타나는 것이다.

// 이따가 어제 썼던 코드에 MVVM을 적용해보자.


// 그 전에 type 을 살펴보고 넘어갈거다. swift 에는 다음과 같인 6개의 type이 있다. struct, class, protocol, "Don't Care" type(aka generics), enum, functions(function도 타입이다! 파이썬과 다름)
// 먼저 struct와 class를 보자.
// lecture1 에서 썼던 게 전부 struct였다. struct와 class는 공통점이 많은데, syntax가 비슷하다. 다음과 같은 애들을 저장할 수 있다.
// 1. 우선, var(ex. var isFaceUp: Bool).

// 2. computed var(computed var: whose value is the result of evaluating some code / 어제 썼던 var body 같은 애들. 실행할 때 마다 value 가 compute 됨)

// 3. let. let은 변하지 않는(does not vary) variable, 즉 constant 이다. 흠 왜 이렇게 설명하지? constant 도 틀린말은 아닌데 vars whose values never change 라고 설명한다. 아, 파이썬에서의 set이나 str처럼 수정이 불가능하다는 얘기다.
/*
 let defaultColor = Color.orange
 ...
 CardView().foregroundColor(defaultColor)
 */


// 4. function. function syntax를 살펴보자.
/*
func mutiply(operand: Int, by: Int) -> Int {
    return operand * by
}
>> multply(operand: 5, by: 6) : 30
*/
// 이게 우리가 아는 일반적인 function 이다. 두개의 parameter가 있고 label(operand 와 by)가 있고 각각의 데이터타입이 명시되어 있고(이거 필수인가?) {}에 func의 내용을 쓴다. 이것도 틀린건 아니지만 사실 각각의 parameter는 두개의 label을 가질 수 있다. 밑의 func multiply와 밑의 func multiply 는 같다.
/*
func multiply(_ operand: Int, by otherOperand: Int) -> Int {
    return operand * otherOperand
}
>> multiply(5, by: 6) : 30
*/
// 보면 operand는 _와 operand를, by는 by와 otherOperand 를 label로 가지고 있는 걸 볼 수 있다. 각각 앞의 label은 func의 caller 에게 쓰이고 두번째 label은 function 안에서 쓰인다. 밑에 multiply를 실행시키는 걸 보면 5, by: 6이라고 한 데에서 알 수 있다. _는 label이 없음을 의미한다. 그래서 5 앞에 아무것도 없는 것. 어제 Text 같은 애들을 그냥 Text("hello world") 라고 쓴 것도 같은 원리이다. caller label이 _로 되어있기 때문.
// 이게 function의 기본 syntax이고 function은 struct 와 class 둘 다에 존재할 수 있다.


// 5. initializers (special functions that are called when creating struct or class with some argument that is not one of existing variables)
/*
struct MemoryGame {
    init(numberOfPairsOfCards: Int) {
        // create a game with that many pair of cards
    }
}
*/


// 자 그럼 이렇게나 비슷한 struct 와 class 의 차이는 뭘까? 가장 큰 차이는 struct는 value type 인 반면 class는 reference type 이라는 것.
// reference type : passed aroung via pointers. storage for reference type is in the heap. 레퍼런스와 포인터라면 이게 파이썬의 방식과 유사한 것 같다. 파이썬도 언제나 데이터 자체는 변하지 않고 레퍼런스 포인터만 바뀌니까
// value type : not passed around by pointer, they are copied. 만약 struct를 function의 argument로 넣는다면 그 funtion은 struct의 복사본을 가지게 된다. reference 타입이 한가지 값이 있고 모두가 그걸 포인터로 공유하고 있는거라고 하면 value type은 전부 다 다른 값을 실제로 지니고 있다고 보면 된다. 파이썬에서도 그런 경우가 많았는데 레퍼런스 타입이면 두 variable이 같은 id를 가리키고 있을 때, 둘 중 하나에 변형을 가하면 나머지도 같이 변하는 경우가 종종 있었다.(str 타입일 경우 .lower() 을 적용한다든지 등등) value type은 그런일은 없다는 거지.
// 근데 대신 그럼 메모리를 너무 많이 차지하는 문제가 생긴다. array, dictionary, set 등이 전부 struct인데 엄청난 크기의 어레이를 여러개 가지고 있으면 저장공긴에 너무 낭비가 아닐까? 이걸 막기 위해 보통은 reference type 처럼 공유하는 상태를 유지하고 만약 뭔가 변형을 가해야할 경우(on write) 그 때 복사를 하는(copy) 방식을 사용한다고 한다. 이게 바로 copy on write 방식!
// 반대로 class는 한 개의 value에 대해 pointer로 가리키는 방식이므로 대신 reference의 개수를 자동으로 센다(=automatically reference counted) 그리고 만약 이 클래스에 대한 pointer가 0개가 되면 메모리를 힙에서 없앤다.
// swift에서는 struct를 주로 사용한다. array, dictionary, int, bool, double(이건 뭐지) 등등이 전부 struct이다.
// struct는 보통 functional programming의 근간이 되고 class는 object-oriented programming의 기초가 된다.
// functional programming은 말그대로 funtionality(기능성)에 초점을 맞추는 프로그래밍이고(언어를 명령어(funtion)들의 나열처럼 본다) oop는 funtionality와 data를 한 컨테이너 안에 encapsulate 하는 데에 초점을 맞춘다(파이썬의 class를 생각하면 된다). 스위프트는 struct, 즉 funtional programming 에 치우져져 있다. 한학기 내내 이걸 배워볼거다-
// struct는 inheritance가 불가능, class는 가능.(파이썬에서의 class 상속과 같은 개념인가?) 하지만 스위프트에서의 class는 single inheritance만 가능하다고 한다. 한개의 클래스에서만 상속받을 수 있다는 얘기.
// ***어떤 언어를 딱 함수형언어! 객체지향형언어! 이렇게 볼수는 없는 듯 하다. 당장 스위프트만 봐도 struct를 주로 사용한다는 거지 class를 못쓴다는게 아니니까. 함수형 언어의 예를 찾아보면 파이썬이 뜨는데 사실 파이썬에서 class를 쓰지 않으면 함수형 언어처럼 쓸 수도 있다. 어쨌든 이건 무슨형이야, 이건 무슨형이야! 하고 못박아두고 생각하지는 말자.
// 그 밖에 차이들을 간단히 정리하자면, struct: mutability must be explicitly stated <-> class: always mutable
// struct: your 'go to' data structure(주로 이걸 쓰게 될거라는 뜻) <-> class: used in specific circumstances
// MVVM에서 ViewModel은 언제나 class. 많은 View들이 얘를 참조하려고 할테니까. View는 아직 안배운 protocol이라는 type. 그 외에는 거의 전부(전부래봤자 Model 밖에 안남은거 아냐?) struct.
// struct: free init initializes ALL vars <-> class: free init initializes NO vars.


// 이번에는 generics 타입을 보자.
// 어떤 때는 정말로 이게 어떤 타입인지 신경쓰지 않을 때가 있다(뒤에 예를 들거다). 하지만 스위프트는 strongly-typed language 라서, untyped 같은 건 없는데, 이럴 때 generics type을 쓴다. (결국 untype을 type의 한 종류로 집어넣었다는 거잖아.. 아, 뒤에보니까 그게 아니네)
// 대표적인 예가 array인데 어레이 안에는 str, int, bood, array, dict, set 등등등등이 다 들어갈 수 있다. 만약 array의 마지막 요소를 꺼내는 함수가 있다면 얘가 어떤 타입 return할지 지정해놓을 수가 없다. 이럴 때 generic을 사용한다. 예제를 보면 훨씬 이해가 잘될거다.
/*
 struct Array<Element> {
    ...
    func append(_ element: Element) {...}
}
 */

// Element 라는건 음 placeholder for a type 같은 거다. 이제 이걸 call 할 때,
/*
 val a = Array<Int>()
a.append(5)
 */
// 처럼 쓰면 된다. 누군가가 Array를 사용할 때, Element의 타입이 결정된다.(정확히 말하면 Element가 valid type으로 대체된다?)
// 이 dont care 타입의 이름을 명시할 때는 <>을 사용한다. 이제 Array를 부를 사람은 <>가 있는걸 보고 타입을 명시해줘야함을 알 수 있다. 아 그리고 <Element, Foo>처럼 여러개도 사용가능하다.


// 이번에는 funtion. 펑션도 타입이다!(이게 정확하게 무슨 의미인지는 모르겠지만)
// variable, 혹은 parameter 같은 데에 'funtion' type을 declare 할 수 있다. 문법은 type of argument와 type of return value 이다.
/*
 (Int, Int) -> Bool        // 두개의 Int를 받고 Bool을 return
 (Double) -> Void          // Double을 받고 아무것도 return 하지 않음
 () -> Array<String>       // 아무 argument도 받지 않고 Array of String을 return
 () -> Void                // 아무 argument도 받지 않고 아무것도 return 하지 않음(가장 일반적)
 */
// 각 줄의 저 자체가 type이 된다고 한다 신기.. (Int) -> Bool 이 자체가 Bool이나 View 같은 타입이라는 것.
// var foo: (Double) -> Void 라고 하면 foo는 Double을 받아서 아무것도 return하지 않는 function 이라고 선언하는 것이다.
// func doSomething(what: () -> Bool) 같은 식도 가능하다. what의 type은 아무것도 받지 않고 bool을 return하는 펑션이다.
/*
var operation: (Double) -> Double (* Double은 일단 파이썬의 Float이라고 이해하자)
 
func square(operand: Double) -> Double {
    return operand * operand
}
 */
// 일 때 operation = square 이 가능하며 let result1 = operation(4) 를 하면 result1은 16이 된다.
// 펑션 타입을 실행할 때는 label(여기서는 operand) 없이 쓴다고 한다.
// 그리고 나서 operation = sqrt 를 또 쓰는 것도 가능하다 (sqrt는 built-in 펑션으로 (Double) -> Double을 만족함)
// let result2 = operation(4) 를 하면 2가 된다.

// function에 대해 설명하면서 마지막에 closure을 언급했는데 아직 이해가 안가서 일단 필기만 옮겨적어놓는다.
// it's so common to pass funtions around that we are very often 'in-lining' them. We call such an inlined funtion a 'closure' and there's special language support for it. We'll cover this in the demo and again later in the quarter.

// enum 과 protocol이 남았는데 이건 다음번에 설명할거고 이제 데모로 돌아가서 렉처1 결과물에 MVVM을 적용시켜 보자.

import SwiftUI
// 애플에서 제공하는 스위프트ui 패키지

struct ContentView: View {
    var body: some View {
        return HStack {
            ForEach(0..<4) { index in
                CardView(isFaceUp: false)
            }
        }
            .foregroundColor(.orange)
            .padding()
            .font(Font.largeTitle)
    }
}

struct CardView: View {
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// 자 우리가 지난시간에 작업한 모든건 View였다 MVVM중 첫번째 V. 오늘은 Model을 작업해서, 여기에 logic을 불어넣어 보자.
// 자 그러려면 file에서 new file을 만들어주자. UI말고 그냥 swift 파일로. 같은 폴더인 CS193p Lecture2 에 저장했고 여기다가 model을 구축할거다. 그쪽으로 넘어가자. 쑝 (파일이름 MemoryGame)

// 자 다시 돌아와서 MemoryGame 에서 Model을 구축해줬다면 우리는 이제 UI dependent 한 View(이 파일)와 UI independent 한 Model(MemoryGame 파일)을 이어줄 ViewModel을 만들거다.
// ViewModel에 해당하는 파일도 만들어주자. 파일 만들 때 보면 EmojiMemoryGame 이라고 이름을 붙인다. 그리고 우리는 Model 파일에서 이모지가 아닌 다른 타입의 컨텐트를 쓰는 카드라고 하더라도 돌아갈 수 있게 구축했다(CardContent 라는 generic을 만들어 줬다).
// 내가 느끼기엔 마치 파이썬의 class 와 instance의 관계 같다. Model에서 청사진을 만들어서 넘겨주면 각각의 ViewModel(만약 여러개라면)이 그걸 자기네의 필요에 맞게(하지만 Model의 로직을 벗어나지 않는 한에서) 사용하는거다. 우리는 이모지를 쓰는 메모리게임을 만들거니까 ViewModel의 이름은 EmojiMemoryGame 이 됐다.
