import UIKit

func getName(_ name: String) -> String {
    return "내 이름은 \(name)"
}

//getName이라는 메소드는 밑에와 같다
var getNameClosure : (String) -> String //매개변수를 받아서 String을 반환하는 클로저이다

//sayHello라는 매개변수는 getName라는 클로저를 매개변수로 받는다는 뜻
//sayHello는 메소드인데 매개변수를 받고 그 클러저를 받고 반환을 한다는 뜻
func sayHello( getName: (String) -> String, name: String) -> String {
    return getName(name)
}


let resultOne = sayHello(getName:getName(_:), name: "호롤롤로")
//위 순서는 sayHello를 실행했고 getName이라는 매개변수를 받았기 때문에 해당하는 맨위가 실행됨 그래서 매개변수로 "내이름은 ~~" 이 들어옴


let numbers = [3, 7, 4, -2, 9, -6, 10, 1]

let stringNumbers = numbers.map { (aNumber: Int) -> String in
    return "\(aNumber) 입니다."
}

let evens : [Int] = numbers.filter { aNumber in
    return aNumber%2 == 0
}
