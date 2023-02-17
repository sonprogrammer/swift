import UIKit

//딕셔너리는 키와 값으로 이루어져 있다.

//첫번째 들어가는게 키 그다음 값 -> 키 : 값
var myFriends = ["bestFriend" : "손영진",
                 "highschool" : "영희"]

let myBestFriend = myFriends["bestFriend"] //myFriends에서 해당하는 키를 넣게 되는게 그게 bestFriend이다. 그럼 그 값은 손영진이된다.

myFriends["bestFriend"] = "sonprogrammer"
let myBF = myFriends["bestFriend"]  //키의 값을 이렇게 해서 변경할 수 있다.

myFriends["newFriend"] = "chulsu"
let newFriend = myFriends["newFriend"]


let highschoolFriend = myFriends["highschool"]

let youtube = myFriends["youtube"]  //데이터가 없기때문에nil로 뜬다



let youtube1 = myFriends["youtube" ,default: "친구 없음"]  //키에 값이 없을 때는 뒤에 default값을 줘서 정해줄수 있다.


myFriends.updateValue("suzan", forKey: "girlfriend") //이런식으로 새로운 키와 값을 넣을 수 있다
let girlfriend = myFriends["girlfriend"]


//let emptyDictionary : [String : Int] = [:] //빈 딕셔너리 만들기
let emptyDictionary = [String : Int]() //빈 딕셔너리 만들기2
let emptyDictionary1 : [String : Int] = Dictionary<String, Int>()

myFriends.count

for item in myFriends {
    print("item")
}
