class Unit {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

class UnitHolder {
    var units: [Unit] = [Unit("a"), Unit("b"), Unit("c")]
}
