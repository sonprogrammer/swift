import UIKit


//함수, 메소드 정의
func myFunction(name: String) -> String{ //name이라는 이름을 받고 String을 반환한다는 뜻
    return "안녕하세요? \(name)입니다!"
}

//함수, 메소드 호출한다.
myFunction(name: "손영진") //안녕하세요? 손영진입니다를 반환한다 return해줬으니깐


//함수, 메소드 정의
//이름을 바꾸고 싶으면 name앞에 다른 이름을 쓰면된다
func myFunctionSecond(widh name: String) -> String{ //name이라는 이름을 받고 String을 반환한다는 뜻
    return "안녕하세요? \(name)입니다!"
}

myFunctionSecond(widh: "손프로그래머")

//함수, 메소드 정의
//이름을 바꾸고 싶으면 name앞에 언더바'_'쓰면된다
func myFunctionThird(_ name: String) -> String{ //name이라는 이름을 받고 String을 반환한다는 뜻
    return "안녕하세요? \(name)입니다!"
}

myFunctionThird("gkgkgkgk")
