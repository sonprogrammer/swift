import UIKit

struct Pet{
    init() {
        print("Pet이 생성되었다.")
    }
}


//lazy는 바로 메모리에 올라가는 것이 아니라 pet을 사용할때 메모리에 올리겠다라고 생각하면 된다.
struct Friend{
    var name: String
    
    lazy var pet: Pet = Pet()//lazy는 당장메모리를 사용하지않고 pet을 사용할때 메모리에 올린다
    
    init(_ name: String) {
        self.name = name
        print("Friend가 생성됨")
    }
}

var myFriend = Friend("손영진")
//Friend라는 애는 메모리에 올라가서 여기까지는 출력이 Friend가 생성됨만 뜬다. 그러나 Pet은 사용하지 않았으니깐 메모리에 안올라간다

myFriend.pet //pet을 사용하니깐 Pet()이 자동으로 생성되고 메모리에 올라가게 된다.
//출력은 Friend가 생성됨. Pet이 생성되었다. 이런식으로 순서가 바뀌어 출력된다 먼저 friend출력되고 그다음 pet출력

