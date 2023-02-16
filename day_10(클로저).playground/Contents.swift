import UIKit

//String을 반환하는 클로저
let myName: String = {
    //myName으로 들어간다
    return "손영진"
}()

print(myName)



//클로저 정의
let myRealName : (String) -> String = { (name: String) -> String in
        return "개발하는 \(name)"
}

myRealName("손영진")


let myRealNameLogic : (String) -> Void = { (name: String) in //void는 값을 받고 아무런 조취를 하지않는다 그래서 return값이 필요없다
    print("개발하는 \(name)")
}

myRealNameLogic("손영진")
