import UIKit

protocol Naming {
    var lastname: String{get set}
    var firstname: String{get set}
    func getName() -> String
}

extension Naming{
    func getFullName() -> String{
        return self.lastname + " " + self.firstname
    }
}

struct Friend: Naming {
    var lastname: String
    var firstname: String
    func getName() -> String {
        return self.lastname
    }
}

let myFriend = Friend(lastname: "손", firstname: "영진")

myFriend.getName()
myFriend.getFullName()
