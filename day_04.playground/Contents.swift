import UIKit

//레인지
//0..<5는 0, 1, 2, 3, 4를 뜻함

// 0...5는 0, 1, 2, 3, 4, 5를 뜻함

//for index in 0...5{
//    print("호호 index: \(index)")
//}

//for index in 0..<5{
//    print("호호 index: \(index)")
//}
//
//for index in 0...5 where index % 2 == 0 { //나머지가 0이면 짝수를 뜻함
//    print("호호 index: \(index)")
//}

//빈 배열 만들기
var randomInts: [Int] = []
//var randomInts: [Int] = [Int]()

for _ in 0..<25 {
    let randomNumber = Int.random(in: 0...100)
    randomInts.append(randomNumber)
}

print("랜덤넘버는: \(randomInts)")
