func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 1 else { return [0,0] }
    
    var dictionaryOfNumbers = [Int: Int]()
    for (index, value) in nums.enumerated() {
        let needToFind = target - value
        if let found = dictionaryOfNumbers[needToFind] {
            return [found, index]
        }
        dictionaryOfNumbers[value] = index
    }
    
    return [0,0]
}
