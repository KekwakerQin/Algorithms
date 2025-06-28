protocol DoubleAbsoluteValueProtocol {
    var absoluteValue: String { get }
}

extension Double: DoubleAbsoluteValueProtocol {
    var absoluteValue: String { return "\(Int(self))"}
}

