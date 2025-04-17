func countGoodTriplets(_ arr: [Int], _ a: Int, _ b: Int, _ c: Int) -> Int {
    let n = arr.count
    guard n >= 3 else { return 0 }
    var result = 0
    for i in 0..<n - 2 {
        for j in i + 1..<n - 1 {
            for k in j + 1..<n {
                let first = arr[i]
                let second = arr[j]
                let third = arr[k]
                if abs(arr[i] - arr[j]) <= a &&
                    abs(arr[i] - arr[k]) <= c &&
                    abs(arr[j] - arr[k]) <= b {
                    result += 1
                }
            }
        }
    }
    return result
}
