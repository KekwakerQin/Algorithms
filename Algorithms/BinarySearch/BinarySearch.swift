func BinarySearch(_ arr: [Int], _ target: Int) -> Int {
    var left = 0
    var right = arr.count - 1
    var iterration = 0
    while left < right {
        iterration += 1
        
        let mid = (right - left) / 2
        print("itteration: \(iterration) mid: \(mid) arr: \(arr[mid])")

        if target < arr[mid] {
            right = mid - 1
        }
        else if target > arr[mid] {
            left = mid + 1
        }
        else {
            return mid
        }
    }
    return 0
}
