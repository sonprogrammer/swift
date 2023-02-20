import UIKit

protocol PetHaving{
    associatedtype T
    var pets: [T] {get set}
    mutating func gotNewPet(newPet: T)
    
}

extension PetHaving{
    mutating func gotNewPet(newPet: T){
        self.pets.append(newPet)
    }
}

enum Animal{
    case cat, dog, bird
}

struct Friend: PetHaving{
    var pets = [Animal]()
    
}
struct Family: PetHaving{
    var pets = [String]()
    
}

var myFriend = Friend()

myFriend.gotNewPet(Animal.bird)
myFriend.gotNewPet(Animal.cat)
myFriend.gotNewPet(Animal.dog)
myFriend.pets

//var myFamiy = Family()
//myFamiy.gotNewPet(newPet: String)
