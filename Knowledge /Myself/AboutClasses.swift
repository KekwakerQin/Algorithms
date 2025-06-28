import Foundation

class A {
    var name: String?
    var numberOfSides: Int = 0
    
    init(name: String?) {
        self.name = name ?? "NOT FOUND"
    }
    
    func print() -> String {
        if let name {
            return "\(name) is the A with sides \(numberOfSides)"
        }
        else { return "" }
    }
}

class B: A {
    var sideLength: Int
    
    init(sideLength: Int, name: String?) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Int {
        return sideLength * sideLength
    }
    
    override func print() -> String {
        return "\(area()) is area and name: \(name ?? "NO FOUND"), with \(numberOfSides) sides"
    }
}

class C: A {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String?) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    override func print() -> String {
        return "For \(name ?? "not found") | perimeter = \(perimeter) | side length = \(sideLength)"
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3
        }
    }
}


