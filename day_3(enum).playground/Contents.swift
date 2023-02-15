import UIKit


//학교 - 초, 중, 고
enum School {
//    case elementary
//    case middle
//    case high
    case elemantary, middle, high
}

let yourSchool = School.high
//print("yourSchool: \(yourSchool)")
print("yourSchool: ", yourSchool)

enum Grade : Int {
    case first =  1
    case second = 2
    
}

let yourGrade = Grade.second  // '.'을 찍으면 Grade가 가지고 있는 케이스를 접근할수있다
print("yourGrade: \(yourGrade.rawValue)") //rawValue는 케이스가 가지고 있는 실질적 값을 가져옴, 위 Grade.second에서 그 값을 바로 줘도된다 -> Grade.second.rawValue

enum SchoolDetail{
    case elementary(name: String) //파라미터로 이름을 정해서 값을 가져올 수 있다.
    case middle(name: String)
    case high(name: String)
    
    func getName() -> String { //getName을 부르면 String을 반환하겠다는 뜻. '->'이 반환하겠다는 뜻임
        switch self {
        case .elementary(let name):
            return name
        case let .middle(name):
            return name
        case .high(let name):
            return name
        }
    }
}

let yourMiddleSchoolName = SchoolDetail.middle(name: "대영진중학교")

print("yourMiddleSchoolName: \(yourMiddleSchoolName.getName())")
//print("yourMiddleSchoolName: \(yourMiddleSchoolName)") 이렇게 쓰면 middle(name: "영진중학교")로 출력된다. 그 값만 알고 싶으면 우리가 이렇게 쓸거라고 정의한getName이라는 애를 호출한다.
