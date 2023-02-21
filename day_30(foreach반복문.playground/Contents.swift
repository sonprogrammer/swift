import UIKit

let myFriendArray : [String] = ["철수", "영희", "수잔", "제임스", "마크"]



var friendWithIndex : [String] = []

myFriendArray.forEach{ aFriend in
    print(aFriend)
}

for (index, aFriend) in myFriendArray.enumerated(){ 
    print("index: \(index) , item: \(aFriend)")
    friendWithIndex.append("\(index), 번 \(aFriend)")
}
