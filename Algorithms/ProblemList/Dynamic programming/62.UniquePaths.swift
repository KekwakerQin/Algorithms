//func uniquePaths(_ m: Int, _ n: Int) -> Int {
//    var array: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
//    for i in 0..<m {
//        for j in 0..<n {
//            if i == 0 || j == 0 {
//                array[i][j] = 1
//            }
//            else {
//                array[i][j] = array[i-1][j] + array[i][j-1]
//            }
//        }
//    }
//    return array[m-1][n-1]
//}
//

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var array: [Int] = Array(repeating: 1, count: n)
    
    for i in 1..<m {
        for j in 1..<n {
            array[j] = array[j] + array[j-1]
        }
    }
    
    return array[n-1]
}
