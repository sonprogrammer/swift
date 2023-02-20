import UIKit

protocol Naming{
    var name: String{get set}
    func getName() -> String {
        
    }
}
protocol Aging{
    var name: Int{get set}
    }

protocol UserNotifiable: Naming, Aging {
}

class MyBestFriend: UserNotifiable {
    
    var name: String
    func getName() -> String{
    }
    }
    var age: Int
    
    struct MyFriend :UserNotifiable {
        var name: String
        func getName() -> String{
            
        }
        var age: Int
    }

