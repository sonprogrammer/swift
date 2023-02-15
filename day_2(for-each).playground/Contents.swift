import UIKit

//주제 : foreach 반복문


//콜렉션 : 데이터를 모아둔것
//콜렉션종류 : 배열, set, dictionary, tuple
//배열
var myArray : [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for item in myArray { //내가 가지고 있는 갯수 만큼 아이템이라는 거로 반복을 한다는 뜻
  //  print("item: \(item)")
}


//조건을 쓸 때는 where을 쓰면 된다
for item in myArray where item > 5 {//item이라는 애가 5보다 큰애만 프린트할것이다라는 뜻
    print("5보다 큰 수 :  \(item)")
}

for item in myArray where item % 2 != 0{
    print("홀수: \(item)")
}
