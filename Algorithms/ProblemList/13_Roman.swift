class RomanToInt {
    func romanToInt(_ s: String) -> Int {
        let dictOfRoman: [Character: Int] = ["M": 1000, "D": 500, "C": 100, "L": 50, "X": 10, "V": 5, "I": 1]
        var result = 0
        var previousValue = 0
        
        for char in s {
            let currentValue = dictOfRoman[char]
            
            result += currentValue! > previousValue ? currentValue! - 2 * previousValue : currentValue!
            previousValue = currentValue!
        }

        return result
    }
}
