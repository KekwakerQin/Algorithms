func shellSort(_ n: [Int]) -> [Int] {
    var array = n
    var gap = array.count / 2
    
    while gap > 0 {
        for i in gap..<array.count {
            var j = i
            let temp = array[i]
            while j >= gap && array[j - gap] > temp {
                array[j] = array[j-gap]
                j -= gap
            }
            array[j] = temp
        }
        gap /= 2
    }
    return array
}
