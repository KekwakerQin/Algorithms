import Foundation
import RxSwift

class Carr {
    class Statistics {
        var odometer = 0
    }
    
    class didSetRun {
        
    }
    // odometer(s) -> odometer(s1) = 20 -> odometer(s)
    private(set) var statistics = Statistics() {
        didSet {
            print("didSet called")
        }
    }

    func refreshCar() {
        statistics.odometer = 10 //
        print("Changed odometer")
    }
}

let car = Carr()
car.refreshCar()

// MARK: NODES NEED TO LEARN
//class Node {
//    var value: Int
//    var childrens: [Node]
//    
//    init(_ value: Int) {
//        self.value = value
//        self.childrens = []
//    }
//}
//var a = Node(1)
//var b = Node(2)
//var c = Node(3)
//a.childrens = [b,c]
//print(a.childrens.value)

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
