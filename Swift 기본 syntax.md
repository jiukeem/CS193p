### Swift 기본 syntax

- var 선언시 파이썬에서는 무조건 값을 지정해야 했다. 값을 지정하면 파이썬은 그 값의 타입을 인식한다. (물론 str 에서 int로 변경해도 아무 문제 없지만) 스위프트는 strongly typed language 라서 좀 다르다. 일단 var을 생성할 때 value 없이 타입만 지정해줘도 된다. 그래서 init 이 있나보다. var이 있어도 값이 없는 경우가 있으니까. 즉 다음 세가지의 경우가 모두 가능하다.
- var age: Int // var age = 49 // var age: Int = 49
- 두번째 경우 에러는 안나는데 그럼 시스템이 알아서 value를 인식하고 타입을 지정하는 건가?
- string interpolation fstring 이나 format 같은 파이썬 시스템보다 편리하다 ‘’string—— \(string이 아닌 variable) ——“ 하면 OK
- Immutable 한 variable, 즉 constant를 만들때는 let을 사용한다. 
- 이프문신택스는 다음과 같다.

if condition {
  this code will run if condition is true
} else {
  this code will run if condition is false
}
- 사실상 if condition {} else {} 인거다. elif 대신 else if 를 사용하며 if condition1 {} else if condition2 {} else if condition3 {} else {} 로 쓸 수 있다. 
- If/else 문을 더 간결하게 쓸 수 있는 ternary conditional operator 이 있다. Condition ? A : B 식으로, A는 true일 때 실행하고 B는 false일 때 실행한다. 
- switch statement 는 특정 if/ else 문에서 쓸 수 있다. 파이썬에서도 잘 사용할 일이 없기는 했는데.. 일단 형식은 switch var {case 1:  case2:  default:   }이런 식.
- switch 예문 중에 눈여겨봐야할 건 where 절을 쓴 부분이다. case 뒤에는 var이 해당하는 것, 예를 들어 “Earth”, “Moon” 이나 3…12 식으로만 표현할 수 있기 때문에 var이 들어가는 조건문을 쓸 때는 case var % 2 == 0 이 아니라 case let x where x % 2 == 0이렇게 써줘야한다. switch var {case let x where x % 2 == 0:     default:   } 이런 식으로 하면 x는 var과 temporarily binded 된다. var x 로 써도 에러가 나지는 않지만 x는 switch 문 밖에서는 한번도 업데이트 되지 않기 때문에 컴파일러가 x를 let으로 쓰는게 어떻겠냐는 제안을 한다;; 똑똑한놈
- 스위프트에는 로직오퍼레이터가 다르다. 파이썬은 그냥 and or not으로 쓰는 반면 && || ! 이렇게 써야한다. 그리고 연산 순위가 && 가 더 높다. weekend || weekday && dayOff  라고 써도 weekday과 dayOff 먼저 체크한다. true || true && false && true 의 경우 2,3번을 체크해서 true || false && true 가 되고 2,3을 체크해서 true || false 가 되고 최종적으로 true를 return한다. 물론 ()로 명확하게 표시해주는게 제일 좋다. 
- 평소 range는 1…6을 사용하고 stride 가 있을 경우 stride()를 사용해야 한다. stride(from: a, to: b, by: c) b는 포함하지 않는다. 그리고 argument label은 생략할 수 없네ㅜㅜ 불편
- array는 다음과 같이 생성한다. var name = [Type]() 파이썬과 다르게 다양한 타입의 데이터를 한 어레이에 넣을 수 없으며, 처음 선언한 타입은 변경조차도 안된다. 파이썬과 비교하면 굉장히 엄격하다. var name = [list of values] 이렇게도 쓸 수 있다. 당연히 [3, “hi”]식으로 집어넣으면 에러가 나겠지? 두번째 신택스는 틀린 건 아니지만 스위프트의 성격을 생각할 때 좀 더 명확하게 명시해주면 좋겠다. var location: [Double] = [40.7245, -73.9979] 이런식으로. 두번째 방식은 array를 생성할 때 initialize도 같이 해주는 것. 스위프트는 var을 생성할 때 값 없이도 생성할 수 있기 때문에 initialize 에 대한 생각을 꼭 해줘야한다. 파이썬과 가장 다르게 느껴지는 부분.
- array 길이는 .count property를 쓴다.(왜 property라고 부르지?) <-> 파이썬의 len()
- append, insert, remove 등은 같으나 insert와 remove 에는 .remove(at: idx) 식으로 at을 써줘야한다.
- set은 다음과 같이 생성한다. var setName = Set<Type>() 파이썬도 리스트는 = [] 이렇게 하는반면 셋은 = set() 이렇게 해주긴 하니까 이해는 가는데 왜 타입 입력 괄호가 다르지? 어레이는 []였는데 셋은 <>다. 흠 헷갈린당. 
- 생성과 동시에 initialize 하려면 var swiftTeam: Set = ["Galina", "Kenny", "Sonny", "Alex"] 식으로 하면 되는데 왜 어레이와 신택스가 다른거지? type 표시 부분에서 어레이는 [Double], [Int], [String] 식이었는데 얘는 Set이다. 어레이를 생각하면 (Int) 같은 형식이어야할 것 같은데. 어레이와 셋의 관계가 파이썬에서와의 관계와 다른 느낌이다. 파이썬은 같은 위계같은 느낌이었는데. 스위프트의 셋은 어레이와 마찬가지로 다른 종류의 데이터타입들을 함께 넣을 수는 없는 것 같은데 왜 그걸 명시하지 않는지 의문이다. 
- 일단 셋은 중복요소를 넣을 수 없고 셋 안에서의 순서라는게 없다. 이건 파이썬의 셋과 동일.
- ??var consonants = Set<Character>() 라는게 도대체 어떻게 성립하는거지? String도 아니고 Character라는 데이터타입은 없을텐데.
- set에 요소를 추가할 때는 .insert()를 사용한다. <-> 파이썬에서는 .add() 삭제할 때는 remove를 쓴다. 당연히 어레이에 쓸 때와는 다르게 at 은 안쓴다. 파이썬에서는 del이었나 remove 였나 그러고 보니 애초에 set은 immutable 아니었나? 아 내가 tuple과 set을 혼동하고 있었다. tuple은 immutable 하며 순서가 있다. 사실상 수정불가능한 리스트다. set은 수정가능하고, 중복 요소를 갖지 않는다. 순서가 없다. - 파이썬에서는 add / remove 를 썼다. 
- removeAll() 로 요소 전부를 삭제할 수 있다.
- 해당 요소가 set안에 있는지 여부는 .contains() 로 알 수 있다. 이 메소드 어레이에도 쓸 수 있는지는 확인해보기 <-> 파이썬은 in 
- 유용한기능. 두 셋의 교집합만을 취하고 싶으면 var newSet = SetA.intersection(SetB) (당연히 A, B는 순서 상관없음) 합집합은 .union() 셋이므로 겹치는 요소는 한개로 처리. 합집합 - 교집합 도 함수가 있다 .symmetricDifference() 을 쓰면 합집합에서 겹치는 부분을 뺀 셋을 return한다. 마지막으로 SetA.subtracting(SetB) 이 있다. 얘는 유일하게 A와 B의 순서가 중요하다. SetA 에서 SetB를 뺀 셋을 return 한다.
- empty dictionary를 선언하는 방법에는 다음 두가지가 있다. var dictionaryName: [KeyType: ValueType] = [:]   //   var dictionaryName = [KeyType: ValueType]() 앞에껀 literal syntax 라고 하고 뒤에건 initializer syntax 라고 하는데 두 개의 차이는 없다고 한다. 뭐지.? 음 근데 empty가 아니라 처음부터 key-value 를 담을거면 literal syntax 만 사용가능한 것 같다. 

var dictionaryName: [KeyType: ValueType] = [
  Key1: Value1,
  Key2: Value2,
  Key3: Value3
]
- type입력은 생략가능하다 
- 기존에 있는 key-value 값을 삭제하고 싶을 때 dictionaryName[Key] = nil 이렇게도 가능하다. nil 이 null같은 느낌인가봐. dictionaryName.removeValue(forKey: Key) 도 같은 연산. 전부 다 지우고 싶을때는 .removeAll() 은 어레이와 같다.
- isEmpty, count는 어레이, 셋, 딕셔너리에 전부 사용가능하다.
- 딕셔너리에서 유의해야 할 부분이 있다. var variablename = dictname[keyname] 식으로 하고 해당 변수를 출력해보면 optional(value) 이런식으로 출력된다. keyname이 dict 안에 있건 말건 에러를 내지 않기위해 일단 optional 이 붙는다. 이걸 벗겨버리고 싶으면 두가지 방법이 있는데 첫번째는 저 코드 맨뒤에 !를 붙이는 것. ㅋㅋ귀엽다. 이건 확실히 있는거니까 날 믿고 optional을 떼! 하고 말하는 느낌이다. 물론 없는 key를 호출했다면 에러가 난다. 두번째는 if let 문인데 신택스 이해가 잘 안된다.

if let variablename = dictname[keyname] {
  } else {
  }
- 이런식인데 흠 조건문에 = 을 쓰는게 잘 이해가 안된다. 변수에 dict[key]를 할당할 수 있다면~ 이런 뜻인가? 어쨌든 true인 경우 optional 이 떼진다. An *if-let* statement is a Swift conditional that is used to unwrap optional values which can then be assigned to variables. Being a _type-safe language_, Swift returns an optional value as a precaution in case the dictionary doesn’t contain the key we are looking for. By always returning an optional value, we avoid running into errors that occur when we assign a nil optional to a variable.
- * optional type: In Swift, an *optional* is a data type that could contain either a value or nil(=absent of value)
- optional 안에 어떤 값이 들어있는지 모르기 때문에(값이 들어있는지 아닌지 모르기 때문- 이 더 적절하겠다) optional binding 을 통해서 optional wrapping 을 벗기고 안에 접근할 수 있다. 몇가지 방법이 있는데 forcibly unwrapping이 바로 !이고 if let문이 conditional unwrapping이다. 즉, if let문은 먼저 체크하고 안에 value 가 들어있을 경우만 unwrap 한다. 체크해보니 optional(nil) 이라면 variable에는 아무 value 도 지정되지 않는다(아예 variable 생성이 안된다는 건가?) 아 그런가보다 그러니 if variable 과 같은 statement 처럼 작용하는 거지.

- dict 로 포문을 돌릴 때는 for (keyHolder, valueHolder) in dictionaryName {} 식으로 괄호를 쳐주자. 앗 그러고보니 .items()를 안해도 되네
- key만 쓸때는 .keys value만 쓸 때는 .values 를 쓰는게 파이썬과 같다. 근데 스위프트에서는 () 없이 쓴다.
- 오 신기하게도 스위프트에서 튜플은 유일하게 다른 데이터타입들을 포용할 수 있다. var easyAsPie = ("easy as", 3.14) 이런식으로! 왜 얘만 가능한걸까? 그리고 인덱싱때는 닷인덱싱을 쓰는것도 특징이다. easyAsPie.0 은 “easy as”다
- 튜플을 딕셔너리식으로 구성할 수도 있다. 이 부분은 파이썬과 다르네 진짜 신기하다

var easyAsPie = (saying: "easy as", amount: 3.14)
var firstElementValue = easyAsPie.saying  // "easy as"
var secondElementValue = easyAsPie.amount // 3.14
- 딕셔너리로 포문을 돌릴 때 key 와 value를 ()로 묶는 것도 튜플이다. 

