import UIKit

class Friend {
    var name : String
    
    init(_ name: String){
        self.name = name
    }
    
    func sayHi(){
        print("안녕 난 \(self.name) 라고 해")
    }
}

class BestFriend : Friend {
    
    //override로 부모의 메소드를 가져왔다
    override init(_ name: String){
        
        //super 는 부모라는 뜻임, Friend가 가진 init을 꼭 호출해줘야한다
        super.init("베프 " + name)
    }
    override func sayHi(){
        super.sayHi()
    }
}

let myFriend = Friend("손영진")  //프렌드가 기존에 가지고 있던 sayHi를 호출하게 되면 안녕 난 손영진 라고 해

myFriend.sayHi()

let myBestFriend = BestFriend("영진")

myBestFriend.sayHi()// 출력 :  안녕. 난 베프 영진 라고 해. 이유 -> 부모의 프렌드 생성자를 보면(init(_ name : String){self.name = name} 이름으로 들어온 애를 self의 name으로 var name으로 만들어버린다(메인으로 만들어버린다)
    // 부모로부터 덮어쓰기(override)를. 했기 때문에 부모의 생성자를 가져올때 name을 super.init("베프 " + name)로 변경했기 때문에 그렇게 출력된다.BestFriend가 가지고 있는 이름은 베프 영진이 되는거다

myBestFriend.name
