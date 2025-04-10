func minOperations(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    var result = 0
    for row in 0..<n {
        var prev = -1
        for col in 0..<m {
            if grid[col][row] > prev {
                prev = grid[col][row]
            }
            else {
                let different = prev - grid[col][row] + 1
                result += different
                prev = different + grid[col][row]
            }
        }
    }
    
    return result
}
