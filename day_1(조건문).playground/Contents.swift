import UIKit

//다크모드 여부
var isDarkMode : Bool = true


//if !isDarkMode 뜻은 isDarkMode가 아니면

//isDarkMode == true
///if(isDarkMode == true){
   // print("다크모드입니다")
//}else {
  //  print("다크모드가 아닙니다")
// }
    
var title : String = isDarkMode == true ? "다크모드 입니다." : "다크모드가 아닙니다"
//여기서 ?는 ~이라면 여기서 뜻은 isDarkMode가 트루라면 뒤에 다크모드 입니다이고
// : 이건 else뜻이다. 그러므로 여기서  트루가 아니면 다크모드가 아닙니다

print("title: \(title)")
