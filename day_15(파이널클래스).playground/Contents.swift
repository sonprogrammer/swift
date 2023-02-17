import UIKit



//final은 상속이 안딘다
//사용은 final class Friend { 이런식으로 쓴다

class Friend {
    var name : String
    init(name: String){
        self.name = name //외부에서 넘겨주는 매개변수를 내가 가지고 있는 이름으로(var name의 name) 넣어주는 것
    }
}

class BestFriend : Friend { //상속해줌
    
    
    override init(name: String){
        super.init(name: "베프 " + name)
        
    }
}

let myFriend = Friend(name: "손영진")
let myBestFriend = BestFriend(name: "영진")
