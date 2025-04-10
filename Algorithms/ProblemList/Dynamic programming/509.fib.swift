func fib(_ n: Int) -> Int {
    if n <= 1 { return 1 }
    var prev = 1
    var prevSecond = 1
    for _ in 2...n {
        let next = prev + prevSecond
        prevSecond = prev
        prev = next
    }
    return prev
}

// 3
// 1 1 2 3 5
// 1 = 1
// 2 = 1
// 3 = 1 + 1 = 2
// 4 = 1 + 2 = 3
  
