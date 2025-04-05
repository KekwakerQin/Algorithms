func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var maxContainer = 0
    var maxArea = 0
    
    while left < right {
        let heightOfMin = min(height[left], height[right])
        let area = heightOfMin * (right - left)
        maxArea = max(area, maxArea)
        
        if height[left] < height[right] {
            left += 1
        }
        else {
            right -= 1
        }
    }
    
    return maxArea
}
