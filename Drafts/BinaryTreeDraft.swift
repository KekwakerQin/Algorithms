import Foundation


func binaryTreeCreatingDraft() {
    class Heap {
        private var heap = 0
        private(set) var storage: [Int] = []
        
        func insert(_ value: Int) {
            storage.append(value)
            siftUp(from: storage.count - 1)
        }
        
        func siftUp(from index: Int) {
            var childIndex = index
            let value = storage[childIndex]
            var parentIndex = (childIndex - 1) / 2
            
            while childIndex > 0 && storage[parentIndex] > value {
                storage[childIndex] = storage[parentIndex]
                childIndex = parentIndex
                parentIndex = (childIndex - 1) / 2
            }
            
            storage[childIndex] = value
        }
        
        func siftDown(from index: Int) {
            
        }
        
        func printTheTree() {
            let deepth = log2(Double(storage.count - 1))
            let i = 0
            while i < Int(deepth) {}
            print(deepth)
        }
    }

    let heap = Heap()
    heap.insert(10)
    heap.insert(20)
    heap.insert(30)
    heap.insert(15)
    heap.insert(14)
    heap.printTheTree()


    print(heap.storage)

}
