class ValudParent {
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        
        var stack = [Character]()
        
        for char in s {
            
            switch char {
            case "(": stack.append(")")
            case "[": stack.append("]")
            case "{": stack.append("}")
                
            default:
                if s.isEmpty || stack.removeLast() != char {
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
}
