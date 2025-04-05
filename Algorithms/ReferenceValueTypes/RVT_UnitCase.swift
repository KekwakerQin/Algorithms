//class Unit {
//    var name: String
//    
//    init(_ name: String) {
//        self.name = name
//    }
//}
//
//class UnitHolder {
//    var units: [Unit] = [Unit("a"), Unit("b"), Unit("c")]
//}
//
// units = a b c
//
//let holder = UnitHolder() // abc
//var units = holder.units // abc
//var u = units.removeLast() // u -> 2 // ab
//u.name = "d" // holder -> abd , units - ab
//units[0].name = "e" // holder - ebd , eb
//
//print("----")
//units.forEach { print($0.name) } // eb
//print("----")
//holder.forEach { print($0.name) } // ebd
//




//class Engine {
//    var power: Int
//    init(power: Int) {
//        self.power = power
//    }
//}
