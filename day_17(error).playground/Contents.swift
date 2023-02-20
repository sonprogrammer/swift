import UIKit

enum MismatchError: Error {
    case nameMismatch
    case numberMismatch
}

//케이스1.    에러를 던지는 메소드, 반환이 없는 메소드이다 일반적으로 끝에다가 throws를 써준다
//func guessMyName(name input: String) throws {
//    print("guessMyNam() called")
//    if input != "손영진"{
//        print("틀렸다")
//        throw MismatchError.nameMismatch
//    }
//
//    print("맞췄다")
//}


//try? guessMyName(name: "손영진") 이뜻은 에러를 처리하고 싶지않을 때

//try! guessMyName(name: "손영진") 이뜻은 에러가 없다라는 뜻


//케이스1.  에러를 받아서 처리를 해주고 싶을 때
//do{
//    try guessMyName(name: "손영f진")
//} catch{    //던져진 에러를 잡아준다
//    print("잡은 에러: \(error)")
//
//}



//케이스2.      반환해주는 메소드
/// 번호를 맞춘다
/// - Parameter input: 사용자 숫자 입력
/// - Throws: <#description#>
/// - Returns: bool 맞췄는지 여부
func guessMyNumber(number input: Int) throws -> Bool {
    print("guessMyNam() called")
    if input != 10{
        print("틀렸다")
        throw MismatchError.numberMismatch
    }
    
    print("맞췄다")
    return true
}

//케이스2     반환하는거 있을 떼
do{
    let receivedValue = try guessMyNumber(number: 7)
} catch{    //던져진 에러를 잡아준다
    print("잡은 에러: \(error)")
    
}
