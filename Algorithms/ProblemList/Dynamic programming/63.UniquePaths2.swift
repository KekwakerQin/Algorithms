func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    var grid = obstacleGrid
    var m = obstacleGrid.count - 1
    var n = obstacleGrid[0].count - 1
    var wasFind = 0
    
    guard grid[m][n] != 1 else { return 0 }
    guard grid[0][0] != 1 else { return 0 }
    if m == 0 && n == 0 { return 1 }

    grid[0][0] = 1
    
    if n > 0 {
        for j in 1..<grid[0].count {
            if grid[0][j] != 0 {
                if m <= 0 && grid[0][j] == 1 { return 0 }
                grid[0][j] = 0
                wasFind = 1
            }
            if m <= 0 && j == grid[0].count-1 && grid[0][n] == 0 { return 1 }
            if wasFind == 0 {
                grid[0][j] = 1
            }
        }
        wasFind = 0
    }
    if m > 0 {
        for i in 1..<grid.count {
            if grid[i][0] != 0 {
                if n <= 0 && grid[i][0] == 1 { return 0 }
                grid[i][0] = 0
                wasFind = 1
            }
            if n <= 0 && i == grid.count-1 && grid[m][0] == 0 { return 1 }
            if wasFind == 0 {
                grid[i][0] = 1
            }
        }
        wasFind = 0
    }
    
    for i in 1..<grid.count {
        for j in 1..<grid[0].count {
            guard grid[i][j] == 0 else {
                grid[i][j] = 0
                continue
            }
            grid[i][j] = grid[i-1][j] + grid[i][j-1]
        }
    }
    
    
    return grid[m][n]
}
