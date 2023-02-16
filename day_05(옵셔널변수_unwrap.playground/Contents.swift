import UIKit

// 옵셔널이란? 값이 있는지 없는지 모른다.

var someVariable : Int?

if someVariable == nil {
    someVariable = 90
}

print("someVariable : ", someVariable)

//언랩핑(unwrap)이란 감싸져있는 것을 벗기는 것

if let otherVariable = someVariable { //옵셔널인 someVariable을 다른 변수(otherVariable)에 담음
    print("언랩핑 되었다. 즉 값이 있다. otherVariable : \(otherVariable)")
} else {
    print("값이 없다.")
}


someVariable = nil

//someVariable 이 비어있으면 즉, 값이 없으면 기본값으로 요놈을 넣겠다

let myValue = someVariable ?? 10
print("myValue: \(myValue)")

var firstValue : Int? = 30 //옵셔널임
var secondValue : Int? = 50

print("firstValue: \(firstValue)")//언랩핑을 하지않았기 때문에 출력은 firstValue: Optional(30)이라고 뜬다.
print("secondValue: \(secondValue)")

unwrap(firstValue)
unwrap(secondValue)


func unwrap(_ parameter: Int?){
    print("unwrap() called")
    //값이 없으면 리턴 해버린다 즉 지나간다
    guard let unWrappedParm = parameter
    else {
        return
    }
    print("unWrappedParm: \(unWrappedParm)")
}
