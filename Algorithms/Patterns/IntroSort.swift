import Foundation

func introSort(_ array: inout [Int]) {
    let maxDepth = 2 * Int(log2(Double(array.count)))
    introSortHelper(&array, low: 0, high: array.count - 1, depthLimit: maxDepth)
}

// MARK: - Main recursive function

private func introSortHelper(_ array: inout [Int], low: Int, high: Int, depthLimit: Int) {
    let size = high - low + 1

    if size <= 16 {
        insertionSort(&array, low: low, high: high)
    } else if depthLimit == 0 {
        heapSort(&array, low: low, high: high)
    } else {
        let pivotIndex = partition(&array, low: low, high: high)
        introSortHelper(&array, low: low, high: pivotIndex - 1, depthLimit: depthLimit - 1)
        introSortHelper(&array, low: pivotIndex + 1, high: high, depthLimit: depthLimit - 1)
    }
}

// MARK: - Partition (same as QuickSort)

private func partition(_ array: inout [Int], low: Int, high: Int) -> Int {
    let pivot = array[high]
    var i = low

    for j in low..<high {
        if array[j] <= pivot {
            array.swapAt(i, j)
            i += 1
        }
    }

    array.swapAt(i, high)
    return i
}

// MARK: - Insertion Sort

private func insertionSort(_ array: inout [Int], low: Int, high: Int) {
    for i in (low + 1)...high {
        var j = i
        let temp = array[j]
        while j > low && array[j - 1] > temp {
            array[j] = array[j - 1]
            j -= 1
        }
        array[j] = temp
    }
}

// MARK: - HeapSort for fallback

private func heapSort(_ array: inout [Int], low: Int, high: Int) {
    let size = high - low + 1

    func left(_ i: Int) -> Int { return 2 * i + 1 }
    func right(_ i: Int) -> Int { return 2 * i + 2 }

    func heapify(_ n: Int, _ i: Int) {
        var largest = i
        let l = left(i)
        let r = right(i)

        if l < n && array[low + l] > array[low + largest] {
            largest = l
        }
        if r < n && array[low + r] > array[low + largest] {
            largest = r
        }

        if largest != i {
            array.swapAt(low + i, low + largest)
            heapify(n, largest)
        }
    }

    // Build heap
    for i in stride(from: size / 2 - 1, through: 0, by: -1) {
        heapify(size, i)
    }

    // Extract elements
    for i in stride(from: size - 1, through: 0, by: -1) {
        array.swapAt(low, low + i)
        heapify(i, 0)
    }
}
