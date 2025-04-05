func pascalTriangle(_ numRows: Int) -> [[Int]] {
    var result: [[Int]] = []
    
    for i in 0..<numRows {
        var currentRows: [Int] = []
        
        for col in 0...i {
            
            if col == 0 || col == i {
                currentRows.append(1)
            }
            else {
                let prev = result[i - 1]
                currentRows.append(prev[col - 1] + prev[col])
            }
        }
        result.append(currentRows)
    }
    
    return result
}
