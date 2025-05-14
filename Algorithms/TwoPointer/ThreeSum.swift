func threeSum(_ nums: [Int]) -> [[Int]] {
    
    let array = nums.sorted()
    var result = Set<[Int]>()
    print(array)
    for i in 0..<array.count {
        print("Current i : \(i) is \(array[i])")
        if i > 0 && array[i] == array[i - 1] { continue }
        
        var left = i + 1
        var right = array.count - 1
        
        while left < right {
            print("In left-right while: \(left) : \(array[left]) | \(right) : \(array[right])")
            let sum = array[i] + array[left] + array[right]
            print("\(array[i]) + \(array[left]) + \(array[right]) = \(sum)")
            
            if sum < 0 {
                left += 1
            }
            
            else if sum > 0 {
                right -= 1
            }
            else {
                result.insert([array[i], array[left], array[right]])
                
                let currentLeft = array[left]
                let currentRight = array[right]
                
                while left < right && array[left] == currentLeft {
                    left += 1
                }
                while left < right && array[right] == currentRight {
                    right -= 1
                }
            }
            
        }
        
    }
    
    return Array(result)
}

