# Swift 
# 기본
#  syntax

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

func functionName(paramName: paramType) -> returnType {
 // function's task goes here
} 
- function의 기본 syntax로, 파이썬과 달리 -> returnType이나 paramType은 필수인 듯 하다(확실히 strongly-typed 가 맞네..) 만약 아무것도 return하지 않는다면 -> 을 아예 빼버리거나 -> Void 로 쓰면 된다.
- 앗 그런데 파이썬과 크게 다른 부분이 있다

let birthYear = 1994
var currentYear = 2020

func findAge() -> Int {
  return currentYear - birthYear
}
- 함수의 parameter로 넣지 않은 외부 variable(global variable)도 그냥 가져다 쓴다! 파이썬이라면 오류가 날텐데. 흠 이 부분 좀 헷갈린다. 근데 어쨌든 global을 막 갖다쓰면 코드가 조잡해질테니 parameter로 관리하는게 좋겠지
- 스위프트의 funtion은 한개의 값만 return할 수 있는것 같다(파이썬은 여러개 가능). 그래서 여러개를 return하고 싶을때는 array나 tuple로 묶어서 return한다 - 파이썬에서도 이렇게 하는 경우를 많이 봤는데 다른 언어와 결이 맞게 하려고 그런가보다. 어쨌든 이렇게 여러 값을 return하는 경우 return value의 타입 명시도 각각 다 해줘야 한다. 

func favoriteBook() -> (name: String, author: String, yearPublished: Int) {
  return ("Harry Potter and the Philosopher's Stone", "J.K. Rowling", 1997)
}

let book = favoriteBook()
print(book) 

// Prints: (name: "Harry Potter and the Philosopher\'s Stone", author: "J.K. Rowling", yearPublished: 1997)

print(book.name) // Prints: Harry Potter and the Philosopher's Stone
print(book.author) // Prints: J.K. Rowlin
- 오잉 근데 각 return value의 이름도 지정해줘야한다. 맨위에 func 선언을 보면 첫번째꺼는 string이에요 에서 끝나는게 아니라 첫번째 꺼는 name이고요, string 타입이에요 하고 적어주고 있다. 그리고 book 출력값을 보면 마치 dict처럼 name: —, author: — 식으로 출력되는 걸 볼 수 있다. 싱기싱기. 그 안의 각 요소를 가져오고 싶을 경우 dot syntax를 사용한다. 
- body 안에 single expression/value 만 있으면 return을 생략할 수 있는 기능은 스위프트5에서 추가된 기능이라고 한다(implicit return)
- variadic parameter를 쓸 수 있는 것도 업데이트 된 부분. 

func avgSongLength(times: Int...) -> Int {
  var total = 0
  for time in times {
    total += time
  }
  return total / times.count
}
- 보면 times에는 Int형태의 초가 들어가긴 할건데 1개가 들어갈 수도 있고 100개가 들어갈 수도 있다. 이럴 때 paramType 뒤에 …을 붙여주면 된다. function call 시에는 괄호로 묶어나 하지않고 그냥 콤마로 나열해주면 된다. 그래서 한개의 func에 두개 이상의 variadic parameter를 쓸 수 없다. 
- inout paramerter 라는 걸 쓸 수 있다. parameter로 집어넣는 argument를 바꿀 수 있게 하는 건데, 다음과 같이 paramType 앞에 inout을 명시해주면 된다

func funcName(parameterName: inout parameterType) -> returnType {}
- func call 시에는 argument 앞에 &을 붙여준다. 당연히 미리 선언된 variable을 입력해야 제대로 작동하겠쬬

- struct 는 커스터마이즈된 데이터 타입이라고 생각하면 된다. 블루프린트, 즉 오브젝트라고 일단 이해하자(스위프트에는 스트럭처도 있고 클래스도 있다)

struct Name {
  Properties
}
예시

struct Book {
  var title: String
  var pages: Int
}
- default value를 부여하는 것도 당연히 가능하고 접근 및 재할당은 dot syntax로 가능하다
- init method 

struct Dog {
  var age : Int
  var isGood : Bool

  init (age: Int, isGood: Bool) {
    self.age = age
    self.isGood = isGood
  }
}

// Using the init() method:
var bucket = Dog(age: 4, isGood: true)
print(bucket.age)    // Prints: 4
print(bucket.isGood) // Prints: true
- init은 파이썬의 __init__ 과 마찬가지로 instance 생성시 자동으로 실행된다. 
- init 앞에는 func을 생략
- 근데 파이썬과는 다르게 struct 안 init전에 var 을 선언해주는게 필수겠네. 그리고 type 선언도 두번인게 좀 사족처럼 느껴짐 
- 아 그래서 스위프트에는 init을 생략할 수 있는 memberwise initialization 이 있다.

struct Dog {
  var age: Int
  var isGood: Bool
}
var eloise = Dog(age: 5, isGood: true)

- init 이 없는데도 저렇게가 가능하다. init이 없어졌기 때문에 readability는 떨어지지만 익숙해지면 훨씬 더 간결하게 사용할 수 있다. 
- struct 는 dot syntax를 사용. 메쏘드를 경우는 ()를 뒤에 붙여서 call
- method는 struct 안에서 func을 사용한다 * methods : functions specific to a type
- 메소드 중 instance property를 변경하는 메소드는 func 앞에 mutating 키워드를 꼭 붙여줘야한다. 일반적으로 self는 immutable 이기 때문에 특별히 명시해줘야 하는 것.
- struct는 새로운 데이터 타입을 만드는거라고 생각하면 된다. 타입을 확인하는 함수인 type(of:)로 인스턴스의 타입을 확인해보면 struct의 이름이 뜨는 걸 볼 수 있다. String, Int 와 같은 위계의 타입이 하나 더 생기는 것. 즉 다른 스트럭처 안의 var의 타입을 이 스트럭처로 지정할 수도 있고 활용방법은 무궁무진하다.
- 스위프트는 데이터타입을 두가지로 분류할 수 있는데 value type과 reference type이다. (파이썬은 레퍼런스 타입) 스트럭처는 value type이다.(클래스를 제외한 스위프트의 모든 데이터타입들은 value type이다) 모든 인스턴스(혹은 변수)에 각각의 물리적인 value를 배정한다. 밑의 예제를 보면 한번에 이해할 수 있다.

var youngDog = Dog(age: 5, isGood: true)
var oldDog = youngDog
oldDog.age = 10

print(oldDog.age)   // Prints: 10
print(youngDog.age) // Prints: 5 
- 파이썬이었으면 oldDog의 property를 변경하면 youngDog의 property도 같이 변화했을 거다. 여기서는 처음에 둘 다 같은 정보로 지정했음에도 물리적으로 복사붙여넣기 한 것 처럼 따로따로 행동한다. 서로 영향을 주는 관계가 아니다. 반대로 레퍼런스 타입은 하나의 데이터를 여러 변수가 포인터로 가리키고 있는 상태다. 

- 스위프트에는 class 도 있는데 스트럭처와 유사하게 청사진 역할을 하지만 두가지 차이가 있다 class는 상속이 가능하고, reference type 이다. 사실상 파이썬의 클래스같은거라고 보면 되겠다. 스트럭처와 마찬가지로 property(class 안의 variable)와 method(class 안의 function)를 지닐 수 있다. init 메소드까지는 struct와 같은 syntax다.
- 클래스의 꽃인 상속(inheritance)은 다음과 같이 사용한다

class Subclass: Superclass {

}
- override 도 가능하지만, func declare 앞에 override 라고 써줘야한다.

