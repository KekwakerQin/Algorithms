func missingNumber(_ num: [Int]) -> Int {
    var countOfNumber = num.reduce(0, +)
    var fromArray = num.count * (num.count + 1) / 2
    
    return fromArray - countOfNumber
}

