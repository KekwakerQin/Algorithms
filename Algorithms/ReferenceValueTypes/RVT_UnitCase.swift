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
//// units = a b c
//
//let holder = UnitHolder() // ebd
//var units = holder.units // eb
//var u = units.removeLast() // u -> [2] - c
//u.name = "d" // u -> [2] - d
//units[0].name = "e"
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
//
//struct Car {
//    var name: String
//    var engine: Engine
//}
//
//let sharedEngine = Engine(power: 100)
//
//var car1 = Car(name: "BMW", engine: sharedEngine)
//var car2 = car1
//
//car2.name = "Audi"
//car2.engine = Engine(power: 200)
//
//car1.engine.power = 300
//
//print("car1 name: \(car1.name)")
//print("car1 engine power: \(car1.engine.power)")
//
//print("car2 name: \(car2.name)")
//print("car2 engine power: \(car2.engine.power)")
