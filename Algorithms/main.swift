import Foundation

class User {
    let name: String
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("user deinit")
    }
}

var user1: User? = User(name: "alex")
