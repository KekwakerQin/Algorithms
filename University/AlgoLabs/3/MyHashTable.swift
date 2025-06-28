import Foundation

enum ProbingMethod {
    case linear
    case quadratic
}

final class HashTable {
    private var table: [Int?]
    private let size: Int
    private(set) var collisions = 0
    
    init(size: Int) {
        self.size = size
        self.table = Array(repeating: nil, count: size)
    }
    
    // Простая хеш-функция
    private func hash(_ key: Int) -> Int {
        return key % size
    }
    
    // Вставка с пробированием
    func insert(_ key: Int, method: ProbingMethod) {
        let baseIndex = hash(key)
        var i = 0
        
        while i < size {
            let index: Int
            switch method {
            case .linear:
                index = (baseIndex + i) % size
            case .quadratic:
                index = (baseIndex + i + 3 * i * i) % size
            }
            
            if table[index] == nil {
                table[index] = key
                return
            } else {
                collisions += 1
                i += 1
            }
        }
        print("Не удалось вставить \(key) — таблица переполнена.")
    }
    
    // Поиск
    func search(_ key: Int, method: ProbingMethod) -> Int? {
        let baseIndex = hash(key)
        var i = 0
        
        while i < size {
            let index: Int
            switch method {
            case .linear:
                index = (baseIndex + i) % size
            case .quadratic:
                index = (baseIndex + i + 3 * i * i) % size
            }
            
            if table[index] == key {
                return index
            } else if table[index] == nil {
                return nil
            }
            i += 1
        }
        return nil
    }
    
    func displayTable() {
        for (i, value) in table.enumerated() {
            print("\(i): \(value ?? -1)")
        }
    }
}
