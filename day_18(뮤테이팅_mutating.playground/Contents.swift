import UIKit

//class Friend{
//    var name: String
//    func changeName(newName: String){
//        self.name = newName
//    }
//    init(_ name: String){
//        self.name = name
//    }
//}

//var myFriend = Friend("손영진")

//myFriend.changeName(newName: "개발하는 손영진")

//myFriend.name
    
struct BestFriend{
    var name: String
   mutating func changeName(newName: String){
       self.name = newName
     //   print("newName: ", newName)
    }
    //init(_ name: String){
      //  self.name = name
    //}
}

var myFriend1 = BestFriend(name: "손영진")

myFriend1.changeName(newName: "개발자")
