import Foundation

let a = [1,1,0,1,1,1,0,1]
let b = LongestSubarray1493()

let start1 = CFAbsoluteTimeGetCurrent()
var Test1 = b.dpStyle(a)
let end1 = CFAbsoluteTimeGetCurrent()
print("DP-Style Time: \(end1 - start1)")


let start2 = CFAbsoluteTimeGetCurrent()
var Test2 = b.slidingWindow(a)
let end2 = CFAbsoluteTimeGetCurrent()
print("Sliding Window: \(end2 - start2)")




// MARK: TESTS LAYOUTS
//let start1 = CFAbsoluteTimeGetCurrent()
//var Test1 =
//let end1 = CFAbsoluteTimeGetCurrent()
//print("TEST1: \(end1 - start1)")
//
//
//let start2 = CFAbsoluteTimeGetCurrent()
//var Test2 =
//let end2 = CFAbsoluteTimeGetCurrent()
//print("TEST2: \(end2 - start2)")
