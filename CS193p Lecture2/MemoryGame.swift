//
//  MemoryGame.swift
//  CS193p Lecture2
//
//  Created by 김지우 on 2020/10/09.
//

import Foundation

// ContentView에서는 import SwiftUI 였는데 여기는 import foundation 인 것을 볼 수 있다. foundation은 string, array, int, bool 등 기본 데이터 타입들을 담고 있으며 사실 SwiftUI가 Foundation을 포함하고 있어서 ContentView에도 import되어 있다고 보면 된다. 여기서는 foundation 만을 import 했으므로 RoundedRectangle이나 View 같은 UI 애들은 없다.

struct MemoryGame<CardContent> {
    var cards: Array<Card> //generic 타입 사용
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>() // empty array 로 init
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool             // 이 카드가 뒤집혔는지에 대한 정보
        var isMatched: Bool            // 이 카드가 뒤집힌 다른 카드와 짝이 맞는지에 대한 정보
        var content: CardContent       // 우리의 경우 이모지(string type)이지만 사실 image여도 되고 다른거여도 상관없다.
                                       // dont care 타입을 하나 만들어줬다. 가장 바깥의 struct(MemoryGame)에 내가 generic type을 만들어줬음을 명시해주자. 이제 MemoryGame을 불러서 사용하고 싶으면 CardContent 의 타입이 무엇인지 같이 입력해줘야 한다.
        
    }
}


// 빈곳은 많지만 사실상 밑의 코드가 우리 게임의 전체 로직이라고 할 수 있다. cards 가 있고, cards는 Card의 어레이 타입일거다. 맨 밑에 Card struct를 통해서 Card 에 대한 설명과 정보들을 쓰면 되고, 가장 기본적인 동작인 choose 펑션이 있겠다. argument로 Card를 받아서 작동하는 함수일거다.
/*
 struct MemoryGame {
     var cards: Array<Card> //generic 타입 사용
     
     func choose(card: Card) {
         
     }
     
     struct Card {
         
     }
 }
 */


// 파이썬과 마찬가지로 print 나 pass 등을 통해서 일단 얼개를 짜고 디버깅을 한다. 일단 choose 의 동작에 print를 써주자. string이 아닌걸 string과 합쳐서 print 하고 싶을 때 \()를 쓰면된다. 간단한 문법. 스위프트는 다른 타입들을 스트링형식으로 바꾸는걸 굉-장히 잘한다고 하니 맘편하게 이렇게 써주자.


// init 함수를 만들어주자.
/*
 struct MemoryGame<CardContent> {
     var cards: Array<Card> //generic 타입 사용
     
     func choose(card: Card) {
         print("card chosen: \(card)")
     }
     
     init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
         cards = Array<Card>() // empty array 로 init
         for pairIndex in 0..<numberOfPairsOfCards {
             let content = cardContentFactory(pairIndex)
             cards.append(Card(isFaceUp: false, isMatched: false, content: content))
             cards.append(Card(isFaceUp: false, isMatched: false, content: content))
         }
     }
     
     struct Card {
         var isFaceUp: Bool
         var isMatched: Bool
         var content: CardContent
     }
 }
 */

// init을 시킬 때 우리가 카드페어의 개수를 입력하면 그 개수만큼 카드쌍을 어레이에 추가한다. 근데 문제는 struct인 Card를 어레이에 append 할 때 얘도 init을 시켜줘야한다(struct Card를 보면 default init이 없음)
// 처음 추가할때 카드는 뒤집혀있고, 쌍이 맞춰진 상태도 아니므로 첫 두개는 false로 지정할 수 있지만 content는 어떨까? 이 모델은 이모지메모리게임이 아니라 그냥 메모리게임이다. MemoryGame<String> 이 아니라 우리는 <CardContent>라는 제너릭을 사용했다. 그러면 content의 init value는 여기서 정할 수 있는게 아니라 뷰모델파일인 EmojiMemoryGame에서 정해햐하겠지. 그럼 init에 한개의 parameter를 더 추가해주자. init 시에 입력해야할 파라미터인데 그 파라미터의 데이터 타입이 무려 펑션이다! 이래서 펑션도 데이터 타입의 하나라고 하는구나..
