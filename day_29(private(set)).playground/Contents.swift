import UIKit


//pirvate은 그 스트럭트안에서만 사용가능하다는 것
struct MyPet {
    
    var title : String = "타이틀 없음"
    
    private(set) var name : String = "이름 없음"// mypet이라는 블럭안에서 값을 변경 가능 그러나 밖에선 불가능하다
    
    mutating func setName(to newName: String){
        self.name = newName
    }
}

var myPet = MyPet()
//myPet.name = "손영진" //오류뜸 왜냐면 private은 외부에서 접근 불가 자바의 private이라 생각하면됨
//myPet.name
//myPet.title = "호롤롤로"

myPet.setName(to: "손영진") //setName을 하게 되면 바꿀수 있다. 
myPet.name
