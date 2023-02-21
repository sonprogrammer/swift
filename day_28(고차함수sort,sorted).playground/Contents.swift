import UIKit

//총정리 : sort는 나 자신을 바꾸는 것, sorted는 정리한걸 반환하는것이라 생각하면됨

var myArray = [3, 4, 88, 99, 5, 6, 7, 8, 10, 20, 100]

//sorted는 오름 차순으로 차례대로 정렬함, 그러나 sorted는 반환만 한다
var ascendingArray = myArray.sorted()

//sort는 myArray자체가 변해버린다
myArray.sort()

//sorted(by: >)는 내림차순으로 정렬함 마찬가지로 반환만한다
var descendingArray = myArray.sorted(by: >)

//위 오름차순과 같은 방식이다 거기서 괄호안에 by: >를 넣으면된다.
myArray.sort(by: >)


