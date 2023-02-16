import UIKit

class MyFriend {
    var name : String
    
    init(_ name: String = "이름없음") {
        self.name = name
        print("MyFriend가 메모리에 올라갔다.")
    }
    deinit{
        print("메모리에서 사라짐")
    }
}

let myFriend = MyFriend("손영진")
let aFriend = MyFriend()

let anObjectMemoryAddress = Unmanaged.passUnretained(aFriend).toOpaque()
let secondMemoryAddress = Unmanaged.passUnretained(myFriend).toOpaque()

print(anObjectMemoryAddress)

print(secondMemoryAddress)
