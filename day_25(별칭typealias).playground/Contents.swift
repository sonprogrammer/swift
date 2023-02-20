import UIKit

protocol Naming {
    func getName() -> String
}

protocol Aging {
    func getAge() -> Int
}

typealias Friendable = Naming & Aging   //Naming, Aging프로토콜을 한번에 쓸수 있게 별명을 붙여주는 것

typealias FullNaming = Naming //Naming이라 불러도 되고 FullNaming이라고 불러도됨

struct Friend : Friendable { // == struct Friend : Naming & Aging이랑 같은 뜻이다
    var name : String
    var age : Int
    
    func getName() -> String {
        return self.name
    }
    
    func getAge() -> Int {
        return self.age
    }
}

typealias FriendName = String

var friendsName : String = "손영진"

