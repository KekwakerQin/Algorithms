import Darwin

func memoryLeakingCheckerDraft() {
    class MyPerson {
        private var _age: Int
        
        var age: Int {
            get { return _age }
            set { _age = max(0, newValue) }
        }
        
        init(_age: Int = 0) {
            self._age = max(0, _age)
        }
        
    }
    
    var person = MyPerson()
    person.age = -5
    let ptr = Unmanaged.passUnretained(person).toOpaque()
    let size = malloc_size(ptr)
    print("size is : \(size)")
    print(person.age)
    
}
