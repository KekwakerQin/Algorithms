func climbStairs(_ n: Int) -> Int {
    if n <= 1 { return 1 }
    var current = 1
    var prev = 1
    for _ in 2...n {
        let next = current + prev
        prev = current
        current = next
    }
    
    return current
}
