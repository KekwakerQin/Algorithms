struct Stack<T> {
    private(set) var elements: [T] = []
    
    mutating func push(_ value: T) {
        elements.append(value)
        print(elements)
    }
    
    mutating func pop() -> T? {
        if !elements.isEmpty {
            return elements.removeLast()
        } else {
            return nil
        }
    }
    
    func peek() -> T? {
        return elements.first ?? nil
    }
    
    func last() -> T? {
        return elements.last ?? nil
    }
}

//var stack = Stack<Character>()
//let string = "[][]()([])[({})]"
//
//func checker(_ string: String) -> Bool {
//    guard string.count % 2 == 0 else { return false }
//    for i in string {
//        switch i {
//        case "[": stack.push("]")
//        case "{": stack.push("}")
//        case "(": stack.push(")")
//        default:
//            if stack.elements.isEmpty || stack.pop() != i {
//                return false
//            }
//        }
//    }
//    return stack.elements.isEmpty
//}
//
//print(checker(string))
