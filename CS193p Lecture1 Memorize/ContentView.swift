//
//  ContentView.swift
//  CS193p Lecture1 Memorize
//
//  Created by 김지우 on 2020/10/06.
//

import SwiftUI
// 애플에서 제공하는 스위프트ui 패키지

struct ContentView: View {
    var body: some View {
        return ZStack(content: {
            RoundedRectangle(cornerRadius: 10.0).stroke()
            Text("👻")
        })
    }
}
// 이게 가장 최종버전. 중간 과정들은 노트필기에 같이 적어두었다.


/*
 struct ContentView: View {
     var body: some View {
         return Text("Hello, world!")
     }
 }
 */
// keywords들은 magenta로 표시
// struct - container for some variables 스위프트에서는 더 강력하며 추가로 function / behavior 등을 담을 수 있다.
// struct의 이름은 ContentView. 우리의 idetifier는 green 색상으로 뜬다. swift의 identifier는 purple
// 첫번째 줄은 이 struct의 이름은 ContentView이고 View처럼 behave 하겠다고(=going to fuction like a View) 선언(declaration)한 것
// View는 화면에 나타나는 rectangular screen이다. (hello world 를 감싼 테두리가 View의 테두리임) - 터치, 드로잉 등 모든 상호작용이 이 범위를 기준으로 작동함
// 아, 현재 코드에 View가 두번 선언됐는데 ContentView의 View는 화면 전체(기기에 상관없이)이고 두번째 View가 hello world 텍스트에 대한 View이다.
// 이 struct가 View처럼 행동하게 하고 싶으면 var body 가 필요하다. struct 혹은 class 안에 있는 var는 일반적으로 variable 대신 properties 라고 부른다
// 그 뒤의 : some View는 프로퍼티의 타입을 지정하는 부분이다. 요상하게 끼어들어가 있는 마젠타 some은 무엇이냐면, View처럼 행동하는한 any type/ any struct 나 가능하다는 의미이다.
// View 처럼 행동하게 하기 위해서는 View 타입의 var이 그 안에 다시 필요하다고? 흠 선생님은 이걸 레고처럼 생각하라고 설명하심. 째끄만 레고가 쌓여서 더 강력하고 파워풀한 성능을 지닌 뭔가가 되는 식이라는거지. View가 레고와 다른 점이 있다면 View 중에는 View들을 연결하는 역할을 지닌 combiner View가 있다는 점이다. 더 자세한건 나중에.
// View 뒤에 나오는 {}를 보자. 텍스트를 감싸고 있는데, 이 안의 내용(=var's value)은 메모리에 저장되지 않는다. 매번 실행될 때 마다 compute 됨. 시스템이 var body의 value를 요구하면 {}안의 내용이 실행된 뒤에 return 된다. Text 앞에 return을 입력하면 좀 더 한눈에 이해할 수 있다. return이 있어도 맞는데 swift는 최대한 미니멀리스틱하게 간다고.
// 여기서는 Text 타입을 return하는게 확연히 보이니 사실상 some View 가 아니라 Text라고 적어도 문제가 없다. 하지만 struct가 점점 복잡해질 경우 return되는 View의 종류가 바뀌기도 하고 어떤 타입이 return 되는지 헷갈릴 수도 있게 된다. 그러니 이 some View는 컴파일러에게 '이 코드를 보고 이게 뭘 return하는지 알아내봐, 그리고 이게 View처럼 작동하는지 확인해. 그리고 그걸 body의 type으로 사용해' 라고 말하는 것이다.
// swift는 strongly typed language이다. 즉, 모든 var이 specific 한 타입을 가지게 된다는 것
// struct를 만들 때는 Text("Hello, world!") 에서 볼 수 있듯이 ()안에 struct를 구성하는 데에 필요한 argument를 넣어준다.


// 자 그럼 우리가 만들고자 하는 걸 한번 도전해보자
// 우리가 만들고 싶은 건 카드 뒤집기 게임 - 카드마다 이모지가 그려져 있고 뒤집어서 짝을 맞추면 점수를 얻고 틀리면 점수를 잃는 프로그램이다.
// 이모지는 텍스트처럼 취급할 수 있다. Text("Hello, world!") 헬로우 월드 자리에 이모지를 그냥 넣어주면 됨. 상단의 edit에 들어가면 이모지 창이 있다.
// Text("👻") 로 바꿔줬더니 화면에 귀여운 유령이모티콘이 떴다. 흠 하지만 너무 작아서 카드게임에 사용하려면 크기를 키워야겠다.
// 카드도 한번 만들어보자. 리턴 텍스트 대신에 return RoundedRectangle(cornerRadius: 10.0) 를 넣어줬다. 아예 type에 RoundedRectangle 이라는게 있다. 이걸 선택하고 괄호를 열면 필요한 argument가 뜬다. cornerRadius로 해도 되고 size인가 그걸로 해도 되고 그 중에 선택해서 하면 된다. 여기서 보면 text와는 다르게 괄호안에 argument들의 label이 같이 입력된 걸 볼 수 있는데 이게 오히려 기본이다. 텍스트처럼 키워드가 안써있는게 특이한거다. 이 코드를 실행시키면 꼭지점이 둥글게 말린, 화면을 꽉채운 검은 사각형을 볼 수 있다.
/*
 struct ContentView: View {
     var body: some View {
         return RoundedRectangle(cornerRadius: 10.0)
     }
 }
 */
// 이제 이 사각형(카드)안에 그림(이모지)이 들어가야 카드가 완성되겠지 (사이즈, 색깔 등은 일단 뒤로 미뤄두자) 그걸 위해서 ZStack 타입을 return 하고 그 안에 RoundedRectagle과 Text를 넣어줄거다. ZStack 도 View 처럼 작용하는 타입이며 argument로 content를 받는데 {}안에 차례로 사각형과 그림을 넣어주면 두개가 같이 뜨는 걸 확인할 수 있다. (content 안에 들어가는거니까 당연히 return은 없애줘야한다)
// ZStack 같은애들을 combiner View라고 한다. 복잡한 View를 구성하기 위해서는 이런애들을 잘 활용할 줄 알아야겠지
/*
struct ContentView: View {
    var body: some View {
        return ZStack(content: {
            RoundedRectangle(cornerRadius: 10.0)
            Text("👻")
        })
    }
}
 */

// 자 이제는 이걸 좀 더 예제의 카드와 비슷하게 조정해보자. 우선 사각형을 fill 대신 stroke(테두리만)로 바꿔주고 카드의 크기도 조절해야겠다. RoundedRectangle 뒤에 .stroke() 함수를 실행하면 우선 테두리가 있고 속은 채워지지 않은 형태로 변경된다. 즉 RoundedRectangle은 View 처럼 작동하지만 동시에 Shape 처럼 동작하기도 하는 것. Shape에 해당하는 타입들은 전부 .stroke()를 쓸 수 있다. .stroke()는 View를 return한다. 당연한 얘기다 ZStack 안에 들어있는 content들은 전부 View 처럼 작동하는 애들이어야 하기 때문.
// 즉 지금은 두개의 View가 ZStack 안에 들어있다. stroked rounded rectangle 과 text
// stroke 괄호 안에 argument들을 넣어줄 수도 있고, 얘는 넣지 않아도 디폴트값으로 작동하는 애라서 지금 문제가 없다. 





 





















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// 위의 세줄은 컨텐츠 구축이 아니라 glue 역할
