//
//  EmojiMemoryGame.swift
//  CS193p Lecture2
//
//  Created by 김지우 on 2020/10/09.
//

import SwiftUI
// swift UI가 아니라 swift 파일로 만들어줬지만 사실 SwiftUI를 불러와도 된다. 얘는 Model과 View를 잇는 중간다리 역할이니까. 일단 선생님은 바꿔줬으니 나도 Foundation에서 SwiftUI로 바꿔야지

class EmojiMemoryGame {
    private(set) var model: MemoryGame<String>
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}


// 우선 model에 접근가능한 var model을 만들어주자. 보통은 model이라고 하지는 않을거고 좀 더 specific한 이름을 쓰겠지(game, memorygame 등등)
// 우리는 이모지 카드게임을 만들거니까 <>안에 String을 입력해주면 되겠다. 내가 추가로 뭔가 하지 않아도 모델 파일의 struct 이름을 가져오면 알아서 인식한다.
/*
 class EmojiMemoryGame {
     pvar model: MemoryGame<String>
     
 }
 */

// 왜 struct가 아닌 class로 만들어줄까? ViewModel의 역할은 model과 view를 잇는 포탈같은 거다. class의 가장 큰 이점은 share 하기 쉽다는 것이다. heap안에 있으므로 view가 그냥 포인터로 가리키기만 하면 된다. UI가 복잡해지면 엄청나게 많은 수의 View가 이 ViewModel을 참조할테니 class가 걸맞다.
// 이 가장 큰 장점이 반대로 가장 치명적인 단점이 되기도 하는데, 만약 많은 view 중에 하나가 맘대로 코드를 수정해버린다면? 이러면 문제가 생기므로 건드릴수 없게(즉, ViewModel 파일에서만 수정할 수 있게) private 를 달아줄 수 있다. 근데 이러면 문을 닫아버린거나 마찬가지라서 밖(모델)을 전혀 내다볼 수가 없다. ViewModel의 역할을 하지 못하는 것.
// private(set)을 통해서 중간 타협을 할 수 있다. 유리문 같은거라서, 밖은 내다볼 수 있고 건드리지는 못하는 것. 이러면 Model -> ViewModel -> View 방향으로는 문제가 해결됐다.
// 근데 View에서도 반대방향으로 뭔가를 전달한다. 저번에 얘기했던 user intent. 이걸 View에서 ViewModel로 보내면 그걸 해석해서 Model이 조정된다.
// private(set)이 지정되지 않은 부분은 접근 가능한 것 같다. intent를 반영할 수 있는 func을 만들어주면 View들을 이 창구를 통해 user intent를 올려보낼 수 있다
/*
 class EmojiMemoryGame {
     private(set) var model: MemoryGame<String>
     
     // MARK: - Intent(s)
     
     func choose(card: MemoryGame<String>.Card) {    //Card의 풀네임을 써줘야한다
         model.choose(card: card)
     }
 }
 */
