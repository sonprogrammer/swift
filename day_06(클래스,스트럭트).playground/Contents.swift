import UIKit

print("=======구조체=========")

//구조체는 youngjin이라는 애는 다른 종이에다가 복사를 한 것(youngjinClone)이다. 내가 복사한 종이를 훼손하면 본체는 영향이 가지 않는다. 즉 값이 영향이 가지 않는다. == 사본이라 생각하면됨

//클래스는 서로 연결이 되어있어있다고 생각하면 됨(son 과 sonClone이 연결되어있다). 쉽게 말하면 서로 쓰는 메모리를 공유한다 그러니깐 본체(son)이 값이 바뀌면 쓰는 메모리를 공유하기 때문에 sonClone도 값이 변하게 된다 == 구글docx처럼 내가 수정하면 다른곳에서도 수정되어 보이는 것처럼 그 예로 icloud도 있다. 

//유튜버(데이터)모델 - struct / 구조체 -값타입
struct YoutuberStruct {
    var name : String
    var subscriptionCount : Int
}

var youngjin = YoutuberStruct(name: "손영진", subscriptionCount: 1000000000000)

var youngjinClone = youngjin    //youngjin을 youngjinClone에 넣은거임

print("값 넣기 전 youngjinClone.name : \(youngjinClone.name)")

youngjinClone.name = "영진"
print("값 넣은 후 youngjinClone.name: \(youngjinClone.name)")
print("값 넣은 후 youngjin.name: \(youngjin.name)")


print("========클래스=========")


//클래스 - 참조 타입(reference), 생성자를 만들어야함(메모리에 올려야한다)
class YoutuberClass {
    var name : String
    var subscriptionCount : Int
    //init은 생성자, 즉 메모리에 올리기 시작한다라는 뜻이다, 롤에 이니쉬건다가 이 뜻임
    //init으로 매개변수를 가진 생성자 메소드를 만들어야 매개변수를 넣어서 그 값을 가진 객체(object)를 만들수 있다.
    init(name: String, subscriptionCount: Int){
        self.name = name
        self.subscriptionCount = subscriptionCount
    }
}

var son = YoutuberClass(name: "손영진", subscriptionCount: 99999)
var sonClone = son


print("값 넣기 전 sonClone.name : \(sonClone.name)")

sonClone.name = "영진"
print("값 넣은 후 sonClone.name: \(sonClone.name)")
print("값 넣은 후 son.name: \(son.name)")
