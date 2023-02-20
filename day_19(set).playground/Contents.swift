import UIKit

//안에 들어있는 요소가 고유해야한다. 즉 배열은 그 값이 네모 세모 별 등이 있어도 같은 네모가 또 들어올수 도 있다.
//그러나 set은 고유해야하는 특징이 있어 똑같은 네모가 들어올수 없다 즉 똑같은애가 들어오지 못한다.

var myNumberSet : Set<Int> = Set<Int>()

myNumberSet.insert(1)
myNumberSet.insert(2)
myNumberSet.insert(3)
myNumberSet.insert(3)
myNumberSet.insert(3)


myNumberSet.count //결과값 은 3이다

//위에서도 볼수 있듯이 값을 1 한개, 2 한개, 3 세개를 집어넣었는데 count한 결과는 3이라고 뜬다 그 말은 처음들어간 1은 들어가고 그 다음 들어간 2도 처음 넣은 2니깐 들어가고 그 다음 들어간 3도 첫 3이니깐 들어가고 그 이후에 들어간 3은 들어가지 않는다

myNumberSet //결과 값{3, 2, 1}, 이 순서는 계속 달라진다 예를들어 값이 { 2, 1, 3}이럴 수도 있다

for aNumber  in myNumberSet{
    print("aNumber: ", aNumber) //출력 aNumber: 1, aNumber: 3, aNumber: 2이런식으로 무작위로 나온다

}

var myFriends : Set<String> = ["철수", "영희", "수지"]
myFriends.contains("철수")    //contains는 그 안에 넣은 애를 가지고있는지 없는지를 알려주는 메소드이다. 여기서는 철수라는 아이가 들어가 있는지 없는지 Bool타입으로 true or false로 알려주는 메소드 이다.

//set에 들어있는 값을 지우고 싶을 때 먼저 인덱스를 가져오는 것이다 내가 지우고 싶어하는 값이 몇번째에 있는지(firstIndex(of: "이름"))
if let indexToRemove = myFriends.firstIndex(of: "수지"){
    print("indexToRemove: " , indexToRemove)
    myFriends.remove(at: indexToRemove)
}
myFriends


var myBestFriends : [String] = ["철수", "영희", "수지"]
myBestFriends.contains("수지")//배열 형태에서도 나온다

