func minOperations(_ nums: [Int]) -> Int {
    var result = 0
    var prev = nums[0]
    for i in 1..<nums.count {
        if nums[i] > prev { prev = nums[i] }
        else {
            result += prev - nums[i] + 1
            prev = prev + 1
        }
    }
    
    return result
}
