func CopyOfStructsDraft() {
    struct ThePersonStruct {
        var name = "John"
        var age = 18
    }

    class ThePersonClass {
        var name: String
        var age: Int
        
        init(name: String = "John", age: Int = 18) {
            self.name = name
            self.age = age
        }
    }

    func mutateThePersonClassFunc(_ person: ThePersonClass) -> ThePersonClass {
        let person = person
        
        person.name = "Alice"
        person.age = 24
        
        return person
    }

    func mutateThePersonStructFunc(_ person: ThePersonStruct) -> ThePersonStruct {
        var person = person
        
        person.name = "Alice"
        person.age = 24
        
        return person
    }

    print("[CLASSES]______________\n")

    let firstClass = ThePersonClass()
    let secondClass = mutateThePersonClassFunc(firstClass)

    if firstClass !== secondClass {
        print("They are two different instances\n")
    }
    else {
        print("They are same\n")
    }

    print(firstClass.name)
    print(secondClass.name)

    print("\n[STRUCTS]______________\n")

    let firstStruct = ThePersonStruct()
    let secondStruct = mutateThePersonStructFunc(firstStruct)

    print(firstStruct)
    print(secondStruct)

    print("\n[END]______________")
}
