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
// 모든 View에는 foregroundColor 함수를 적용할 수 있다. 지금 테두리 색깔은 짙은회색(혹은 검정)인데 샘플은 주황색이므로 stroked rounded rectangle에 이 함수를 적용해보자. argument로는 color를 넣어주면 되고 Color.orange 로 설정해주면 짠 색깔이 같아졌다. 텍스트에도 적용 가능하다. 물론 지금은 이모지 뿐이라 효과가 안보이지만 텍스트가 있으면 글자 색깔이 주황색으로 변한다.
/*
 struct ContentView: View {
    var body: some View {
        return ZStack(content: {
            RoundedRectangle(cornerRadius: 10.0).stroke().foregroundColor(.orange)
            Text("👻")
        })
    }
}
*/

// foregroundColor은 모든 View에 작동한다고 했다. 그럼 ZStack에도 가능하다! ZStack의 argument를 담는 괄호 뒤에 .foregroundColor(Color.orange)를 입력하면 이 안에 있는 모든 View 에 이 함수를 적용할 수 있다.
// 만약 ZStack에는 orange를 적용하고 안의 View 중 하나에는 blue를 적용했다면 그 한개는 파란색이 적용된다. 오류가 나지않고 override 함.
// 우리는 뒤집힌 카드 이미지에도 색깔이 일치하기를 원하므로 ZStack에 적용하는게 더 좋겠다.
// 이런 modifier들은 읽기 쉽게 엔터한번 쳐서 다른 줄에 위치시킨다. 원래는 ZStack() 바로 뒤에 붙는게 맞다. 잉 근데 탭을 한번 해줘도 문법상 문제가 없나보다. 강의에서는 안의 컨텐츠들과 줄이 맞게 탭을 한번 눌러줬다.
// 자 이제 색깔은 맞춰줬다. 흠 이제는 RoundedRectangle의 크기를 조절해보자. 현재는 전체화면과 완벽하게 일치해서 세로 모서리는 아예 보이지 않는다. padding을 넣어주자
// 다양한 기기에서 작동하기 때문에 객체의 사이즈를 지정하는 방법대신에 padding을 조절하는 식으로 입력하는 것 같다. 뒤집혔을 때의 RoundedRectangle도 같은 크기이기를 원하므로 얘도 전제 ZStack에 적용해주자 (text를 클릭해보면 얘한테도 적용된 걸 확인할 수 있다.)
// foregroundColor 과 달리 padding은 중복 적용이 된다. ZStack과 RoundedRectangle에 둘 다 .padding() 을 해보면 RoundedRectangle이 한단계 더 작아지는 걸 확인할 수 있다.
// foregroundColor 과 padding은 조금 다른 성격인데, 지금은 둘 다 ZStack에 적용해놓은 상태지만 padding은 ZStack 자체에 적용이 된 반면, foregroundColor는 그렇지 않다(ZStack에는 색깔이라는게 없으니) 그래서 ZStack안의 View 들에게 pass down 됨
/*
 struct ContentView: View {
     var body: some View {
         return ZStack(content: {
             RoundedRectangle(cornerRadius: 10.0).stroke()
             Text("👻")
         })
             .foregroundColor(.orange)
             .padding()
     }
 }
 */

// 시뮬레이터로 한번 실행해보자. 애플기기에는 다크모드가 있는데 시뮬레이터로 실행해보면 다크모드에서는 카드 안쪽 색깔이 검은색으로 바뀌어버리는 걸 볼 수 있다. 우리는 어떤 모드에서든 흰색이길 원한다. stroke()에는 채우기 색깔 설정 옵션은 없으므로 RoundedRectagle을 하나 더 만들어서 fill()로 채워주자.
// fill()하고 비워놓으면 ZStack 전체에 적용된 주황색으로 채워지니 Color.white로 argument를 입력해주자. 옆에 preview에서는 차이가 안보이지만 시뮬레이터 다크모드에서는 변화를 확인할 수 있다.
// 두 RoundedRectangle의 입력순서가 바뀌어도 작동하긴하는데 흰색사각형을 밑에 쓰면 테두리가 조금 흐려지는 것 같다. 밑에 입력할 수록 더 앞에 위치하는건가?
// 이제 세부조정을 해주자. 테두리가 너무 얇게 보이므로 lineWidth argument를 입력해서 조정해주고, 이모지는 너무 작으므로 font 함수를 통해 키워주자 font argument로는 pre-canned font를 입력해줬다. largetitle, subheadline, body 등등 여러가지가 있다. 숫자로 입력하니 font member가 아니라고 오류가 뜬다. 요것에 관해서는 다음시간에 더 자세히 배운다고 함
// font() 함수를 지금은 이모지 텍스트에 적용해줬는데 ZStack에 쓸 수도 있다. 그럼 그 안의 모든 텍스트들에 대해 적용이 된다.
/*
 struct ContentView: View {
     var body: some View {
         return ZStack(content: {
             RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
             RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
             Text("👻").font(Font.largeTitle)
         })
             .foregroundColor(.orange)
             .padding()
     }
 }
 */


// 자 이제 카드 비스무리한 게 만들어졌으니 이걸 여러개 만들어보자. 이 부분 집중! 문법이 좀 복잡해진다.
// 여러개를 나타내기 위해서는 ForEach라는 다른 combiner View를 사용한다. ForEach는 두개의 argument를 요구하는데, 첫번째는 iterablething 이고(포문의 in 다음에 올 수 있는 것들처럼) 두번째는 ZStack과 같은 content이다.
// 그럼 ForEach의 content는 ZStack이 되어야 하니 지금까지 만든 코드를 ForEach로 감싸주자. 그러면 iterablething을 돌면서 매번 content를 반환한다. 반복문이 되는 것. iterablething은 array나 range 등을 넣어주면 된다. 우리는 0..<4를 넣을건데 이건 파이썬의 range(0, 4)와 같은 문법이다. 만약 뒤쪽 숫자까지 포함하고 싶으면 0...4 라고 쓰면 된다. 0..<4는 0, 1, 2, 3 에 대해 총 4번 반복하게 된다.
// 현재 ForEach 안에 들어있는게 한개의 View라는 것에 유의(ZStack). ZStack안에 여러개의 View를 넣은 것처럼 ForEach 안에도 당연히 여러개를 넣을 수 있다.
// 그리고 content {}안의 맨 앞, 즉 ZStack 앞에 in을 넣어줘야한다. index in 이런식으로 쓰면 된다. 파이썬 리스트컴프리헨션에서 i for i in range(0,4) 에서 i를 두번쓰는 문법과 같은건가? 흠 이건 나중에 좀더 생각해보기로.
// 이렇게 하면 프리뷰에 아이폰이 4개가 뜨는 것을 볼 수 있다. 오잉 우리는 한 기기의 화면안에 4개의 카드가 들어가기를 원한건데 지금은 화면은 안바뀌고 기기 개수만 늘었다. ForEach는 레이아웃 View가 아니기 때문이다. ZStack은 레이아웃 View다. 우리가 현재 넣어놓은 3개의 View들을 겹쳐서 position 해주고 있다(back to front). ForEach 는 그런 기능은 없고 정말 말 그대로 View를 4번 보여주고 있다. 프리뷰에서 저렇게 보여주면 디버깅에는 용이하겠지.
// 그러면 이 네개의 View를 옆으로 position해줄 combiner View가 또 필요하다. ZStack을 쓸 수는 없다. 네 개를 겹쳐버릴테니 우리 눈에는 한 개 밖에 안보일거다. HStack을 쓰면 된다(horizontal). ZStack이 컨텐트들을 back to front 로 position한다면 HStack은 가로로 position 한다.
// 다시 return HStack 해주고 ForEach를 content로 집어넣으면 ZStack을 ForEach가 감싸고 있고 그걸 다시 HStack이 감싸고 있는 형태가 된다. 그리고 프리뷰도 다시 기기 한개로 바뀌었다! 비율은 이상하지만 한 화면안에 우리가 만든 카드가 네 개 들어가있다.
// HStack content 안에 text("hello") 같은 걸 넣으면 맨 왼쪽에 텍스트도 나열된다. ForEach는 ZStack을 네 번 나열한 것과 다름 없는거지.
/*
 struct ContentView: View {
     var body: some View {
         return HStack(content: {
             ForEach(0..<4, content: { index in
                 ZStack(content: {
                     RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                     RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                     Text("👻")
                 })
             })
         })
             .foregroundColor(.orange)
             .padding()
             .font(Font.largeTitle)
     }
 }
 */

// 자 이제 화면을 다시 보자. 우리는 padding(), forgroundColor(), font()를 HStack에 적용하고 있다. 근데 4개의 카드들 간에도 약간의 간격이 있는 걸 확인할 수 있다. 이건 뭘까? padding은 HStack 전체에 적용하고 있으므로 이건 패딩과 상관없는 값이다. 이건 HStack이 가지고 있는 spacing인데 간격을 조정하고 싶을 경우 spacing argument를 통해 해주면 된다. 만약 설정하지 않는다면 디폴트로 standard spacing이 적용된다. 지금 padding에 별다른 값을 넣지 않은 것과 똑같다.
// swift는 굉장히 간결한 것을 추구하는 듯 하다. 우리가 짠 코드에서 뺄 수 있는 것들을 다 빼보자.
// 우선 HStack 앞에 있는 return은 앞에서 말했듯이 생략할 수 있다.
// 만약 마지막 argument가 {}를 쓰는 애라면, 즉 위의 ForEach 같은 경우, content라는 label을 삭제하고 (첫번째 argument, {})에서 (첫번째 argument){}로 바꿀 수 있다. ()와 {} 사이의 띄어쓰기는 상관없는 듯 하다. ZStack과 HStack의 경우 argument가 하나밖에 없는데 이 경우도 가능하다. 그러면 ()는 그냥 빈 괄호가 된다. 이렇게 빈괄호가 될 경우 ()도 그냥 생략할 수 있다! 어마어마하네.. 훨씬 깔끔해졌다.
/*
 struct ContentView: View {
     var body: some View {
         return HStack {
             ForEach(0..<4) { index in
                 ZStack {
                     RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                     RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                     Text("👻")
                 }
             }
         }
             .foregroundColor(.orange)
             .padding()
             .font(Font.largeTitle)
     }
 }
 */
 

// 여기서 더 깔쌈하게 정리해볼까? ZStack을 따로 만들어주고 위 코드의 ZStack 다섯줄은 참조로 바꿔보자. 코드도 더 이해하기 쉽고 관리하기도 편하다. CardView 이렇게 쓰면 에러가 나고 CardView()로 써줘야한다.
/*
 struct ContentView: View {
     var body: some View {
         return HStack {
             ForEach(0..<4) { index in
                 CardView()
             }
         }
             .foregroundColor(.orange)
             .padding()
             .font(Font.largeTitle)
     }
 }

 struct CardView: View {
     var body: some View {
         ZStack {
             RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
             RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
             Text("👻")
         }
     }
 }
 */


// 이제 카드의 뒷면을 표시하고 싶은데 어떻게 해야할까? ZStack 안에
/*
 RoundedRectangle(cornerRadius: 10.0).fill()
 */
// 라고 입력하면 뒷면이 나오기는 한다 (color는 입력할 필요가 없다. HStack에 orange가 적용되어 있으므로 이걸 따른다) 흠 근데 우리가 원하는건 약간 conditional 적인거다. 클릭하면 뒤집혀서 뒷장이 나오고 앞장이 나오고- 이런식으로 나타나게 하고 싶다. 어떻게 해야할까?
// ZStack은 if 문을 지원한다. 지금은 condition이 없지만 이해의 편의를 위해 isFaceUp을 써보자.
// 자 그럼 isFaceUp은 뭐가 되어야할까? 그냥 불린값을 가지는 변수면 충분하겠지. 그러면 struct안에, 하지만 body 안에는 들어가지 말고 var isFaceUp 을 선언하면 된다.
// 이러면 CardView라는 struct 자체에는 아무 문제가 없다. 근데 대신 위의 코드, ContentView 안에서 Missing argument for parameter 'isFaceUp' in call 라는 에러가 발생한다. 스위프트는 strongly typed 언어고, 모든 변수들이 initial value를 가지고 있어야 한다(나는 오히려 이게 더 익숙해서 좋다. 파이썬도 그러니까) 그래서 var isFaceUp: Bool 로는 불충분하고 처음에 True 든 False 든 일단 지정해줘야한다. 기본상태에서는 뒷면이 보여야하므로 False로 지정하는게 좋겠지.(앗 여기는 대문자를 안쓰고 그냥 false 라고 쓰네)
// 이 에러가 CardView struct 가 아니라 ContentView 에서 발생하는 이유는 CardView는 마치 def function 같은거기 때문이다. 그리고 ContentView 에서는 이걸 받아서 실행시키므로 이때 에러가 발생하는 것. 그래서 CardView 안에서는 그냥 : Bool 로 두고 ContentView 안의 CardView 에서 CardView(isFaceUp: false) 이렇게 해줘도 된다.

// 여기까지 lecture 1 이었습니당 수고했어요- ////////////////////////////////












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// 위의 세줄은 컨텐츠 구축이 아니라 glue 역할
