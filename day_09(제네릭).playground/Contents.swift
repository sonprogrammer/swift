import UIKit



//'<'이 제네릭의 표현이다
struct MyArray<SomeElement>{
    
    //제네릭을 담은 빈 배열
    var elements : [SomeElement] = [SomeElement]()
    
    
    //생성자
    init(_ elements: [SomeElement]){ //SomeElement를 담고 있는 배열이 들어오면
        self.elements = elements //내가 가지고 있는 elements에(self) 넣어주는 식으로 한다.
    }
}

struct Friend{
    var name: String
}

struct Ppakcoder{
    var name: String
}

var mySomeArray = MyArray([1,2,3])
print("mySomeArray: \(mySomeArray)")

var myStringArray = MyArray(["가", "나", "다"])
print("myStringArray: \(myStringArray)")

let friend_01 = Friend(name: "철수")
let friend_02 = Friend(name: "짱구")
let friend_03 = Friend(name: "영희")

var myFriendsArray = MyArray([friend_01,friend_02, friend_03])
print("myFriendsArray: \(myFriendsArray)")
