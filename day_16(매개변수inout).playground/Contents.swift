import UIKit

func sayName(_ name: String){
    print("안녕 나는 \(name) 이라고 해")
}


//inout은 매개변수 name을 (name = "개발하는 " + name)처럼 바꿀 때 사용한다. inout이 없으면 바꾸지 못하고 오류가 뜬다
func sayHi(_ name: inout String){
    name = "개발하는 " + name
    print("안녕 나는 \(name) 이라고 해")
}


sayName("손영진")

var name = "손영진"

sayHi(&name) //inout쓸 때 변수앞에 '&'를 써야한다.  
