class Palindrome {
    
    //func palindromeInt(_ number: Int) -> Bool {
    //    guard number > -1 else { return false }
    //
    //    let arrayOfNumber = String(number).map { Int(String($0))! }
    //    var left = 0
    //    var right = arrayOfNumber.count - 1
    //
    //    while left < right {
    //        if arrayOfNumber[left] == arrayOfNumber[right] {
    //            left += 1
    //            right -= 1
    //        }
    //        else {
    //            return false
    //        }
    //    }
    //
    //    return true
    //}
    // O(n) O(n)
    
    private func palindromeInt(_ x: Int) -> Bool {
        return x < 0 ? false : method(x: x) == x
    }
    
    func method(x: Int) -> Int {
        var reversed = 0
        var original = x
        
        while original != 0 {
            reversed = reversed * 10 + original % 10
            original /= 10
        }
        
        return (reversed > Int32.max || reversed < Int32.min) ? 0 : reversed
    }
    
}
