func zerosToEnd(_ arr: inout [Int]) {
    var insertionIndex = 0
    
    for num in arr {
        if num != 0 {
            arr[insertionIndex] = num
            insertionIndex += 1
        }
    }
    
    for i in insertionIndex..<arr.count {
        arr[i] = 0
    }
    
    arr[0..<insertionIndex].sort()
}
