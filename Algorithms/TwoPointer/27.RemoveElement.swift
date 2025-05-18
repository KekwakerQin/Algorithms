    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        var returner = 0

        while left < right {
            if nums[left] == val {
                nums[left] = nums[right]
                nums.remove(at: right)
                print(nums)
                right -= 1
                returner += 1
            }
            else {
                left += 1
            }
        }
        print(nums)
        return returner
    }
