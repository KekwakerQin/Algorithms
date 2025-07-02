class GraphPractice {
    var storage: [String: [String]]
    
    init() { storage = [:] }
    
    func addVertex(_ vertex: String, edges: [String] = []) {
        if storage[vertex] == nil {
            storage[vertex] = []
        }
    }
    
    func degree(for vertex: String) -> Bool {
        print("Count of vertexes edges: \(String(describing: storage[vertex]?.count))")
        guard let count = storage[vertex]?.count else { return false }
        return count % 2 == 0
    }
    
    func addEdge(for vertex: String, the edges: [String]) {
        if storage[vertex] == nil {
            storage[vertex] = []
        }
        
        for edge in edges {
            storage[vertex]?.append(edge)
            
            if storage[edge] == nil {
                storage[edge] = []
            }
            
            storage[edge]?.append(vertex)
        }
    }
    
    func printNeighbors(for vertex: String) {
        print(storage[vertex] ?? "Vertex no exist")
    }
    
    func removeEdge(_ from: String, _ to: String) {
        if let index = storage[from]?.firstIndex(of: to) {
            storage[from]?.remove(at: index)
        }
        if let index = storage[to]?.firstIndex(of: from) {
            storage[to]?.remove(at: index)
        }
    }
    
    func allEvenDegrees() -> Bool {
        for neighbors in storage.values {
            print("[LOG] Neighbors.storage.value: \(neighbors)")
            if neighbors.count % 2 == 1 { return false }
        }
        return true
    }
    
    func printing() {
        print(storage)
    }
}

var b = GraphPractice()
b.addVertex("A")
b.addEdge(for: "A", the: ["B", "C"])
b.addEdge(for: "B", the: ["C"])
if b.allEvenDegrees() { print("It's could be the Eulerian cycle")}
print(b.degree(for: "A"))
b.printing()


