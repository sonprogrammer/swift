import UIKit

//() -> Void 는 반환형이 없다 그래서 Void임, 이거 자체를 메소드로 푼다면 밑인 것이다.
//func completion(){
//
//}




//completino이라는 클로저를 매개변수로 가지는 메소드 정의
func sayHi(completion: () -> Void){
    print("syaHi() called")
    sleep(2)    //2초 멈추기
    //completion 클로저 실행
    completion()
}


//메소드 호출부에서 이벤트 종료를 알 수 있다.
sayHi(completion:{
    print("2초가 지났다")
})


sayHi(){
    print("2초가 지났다 ,2")
}

sayHi{
    print("2초가 지났다 ,3")
}


////(String) -> Void
//func completion(userInfo: String){  userInfo라는 String을 받는 애인 것이다. 반환형이 없어서 Void이다
//
//}

//매개변수로서 데이터를 반환하는 클로저
func sayHiWithName(completion: (String) -> Void){
    print("sayHiWithName called")
    sleep(2)
    //클로저를 실행과 동시에 데이터를 반환
    completion("오늘도 1111빡코딩 해요!")
}

sayHiWithName(completion: { (comment: String) in //completion이 comment로 들어가는 거임
    print("2초뒤에 그가 말했다 comment: ", comment)
    
})
//위와 같지만 다른 코드1
sayHiWithName(completion: { comment in
    print("2초뒤에 그가 말했다 comment: ", comment)
})

////위와 같지만 다른 코드 2
sayHiWithName{ comment in
    print("2초뒤에 그가 말했다 comment: ", comment)
}

////위와 같지만 다른 코드 2
sayHiWithName{
    print("2초뒤에 그가 말했다 comment: ", $0)
}


//(String, String) -> Void)
//func completion(first: String, second: String){
//
//}



//매개변수로서 데이터를 여러개 반환하는 클로저
func sayHiWithFullName(completion: (String, String) -> Void){
    print("sayHiWithName called")
    sleep(2)
    //클로저를 실행과 동시에 데이터를 반환
    completion("오늘도 1111빡코딩 해요!", "힘들어ㅠㅠ 그래도 견뎌야지  제발ㅠㅠ")
}

sayHiWithFullName{ fisrt, second in
    print("첫번째: \(fisrt), 두번째: \(second)")
}

//위에서 예를 들어 first를 쓰고 싶지않으면 언더바 '_'를 쓰면된다, 그럼 두번째만 출력된다.
sayHiWithFullName{ _ , second in
    print("두번째: \(second)")
}


func sayHiOptinonal(completion: (() -> Void)? = nil ){  //() -> Void)가 클로저임
    print("syaHi() called")
    sleep(2)    //2초 멈추기
    //completion 클로저 실행
    completion?()   //옵셔널이니깐 뒤에 ?를씀
}

//이벤트를 넣기 싫을 때 옵셔널로 줘서 기본형을 nil로 주면된다.
sayHiOptinonal()

//이벤트를 받고 싶을 때
sayHiOptinonal(completion: {
    print("2초가 지났다, 하하하하하")
})


//(Int) -> String   //Int를 받아서 String으로 반환한다는 뜻
func transform(number: Int) -> String{
    return "숫자: \(number)"
}


var myNumbers : [Int] = [0, 1,2,3,4,5]

var transfomedNubers = myNumbers.map { aNumber in
    return "숫자: \(aNumber)"
}
