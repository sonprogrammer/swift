import UIKit


//프로토콜은 약속같은걸 의미 이름은 **able, **ing로 보통 이름을 지음

//프로토콜로 약속
protocol Naming{
    //우리는 이런 변수를 가지고 있을 거라는걸 약속.
    var name: String{ get set}  //값을 가져올수도 있고 넣을 수도있다는 듯(get,set)
        
    func  getName() -> String
}


//위약속을 지켜야하기때문에 var name: String과 func getName() -> String을 꼭 써줘야한다.
//이런걸 프로토콜을 준수한다 혹은 implement라고 한다. 
struct Friend : Naming{
    var name: String
    
    func getName() -> String {
        return "내 친구: " + self.name
    }
    
    
}
var myFriend = Friend(name: "손영진")
myFriend.getName()
