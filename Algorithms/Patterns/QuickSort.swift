func QuickSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let mid = array.count / 2
    var left = [Int]()
    var right = [Int]()
    for i in 0..<array.count {
        if array[mid] < array[i] && i != mid {
            left.append(array[i])
        }
        else if i != mid {
            right.append(array[i])
        }
    }
    
    return QuickSort(right) + [array[mid]] + QuickSort(left)
}
