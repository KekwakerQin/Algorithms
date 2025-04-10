class LongestSubarray1493 {
    func dpStyle(_ nums: [Int]) -> Int {
        var left = 0
        var zeros = 0
        var maxLength = 0

        for right in 0..<nums.count {
            if nums[right] == 0 {
                zeros += 1
            }

            while zeros > 1 {
                if nums[left] == 0 {
                    zeros -= 1
                }
                left += 1
            }

            maxLength = max(maxLength, right - left)
        }

        return maxLength
    }

    func slidingWindow(_ nums: [Int]) -> Int {
        var left = 0, zeros = 0, maxLength = 0

        for right in 0..<nums.count {
            if nums[right] == 0 { zeros += 1 }

            while zeros > 1 {
                if nums[left] == 0 { zeros -= 1 }
                left += 1
            }

            maxLength = max(maxLength, right - left)
        }

        return maxLength
    }
}

