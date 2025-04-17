class RemoveDuplicatesfromSortedArray {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.isEmpty { return 0 }
        
        var counter = 0
        
        var left = 0
        var right = 1
        var current = nums[0]
        
        while left < right {
            if right == nums.count {
                left += 1
                return left
                nums[left] = 0
            }

            else if nums[left] != nums[right] {
                counter += 1
                nums[left+1] = nums[right]
                left += 1
                right += 1
            }
            
            else {
                right += 1
            }
            
        }
        
        return counter
    }
}
