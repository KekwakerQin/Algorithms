import Foundation

// Энам для выбора метода сортировки
enum ChooseSortingMethod {
    case insertionSort, shellsMethod, quickAndHeapSort
}

final class SortingForUnisLab {
    
    // Запуск программы и выбор метода
    func runSortForLab<T: Comparable>(array: inout [T], for method: ChooseSortingMethod) -> [T] {
        switch method {
        case .insertionSort: insertionSort(&array)
        case .shellsMethod: shellsMethod(&array)
        case .quickAndHeapSort: quickAndHeapSort(&array)
        }
    }
    
    // O(n) лучший кейс (если отсортировано)
    // O(n^2) средний кейс
    // O(n^2) худший кейс
    private func insertionSort<T: Comparable>(_ array: inout [T]) -> [T] {
        for i in 1..<array.count {
            var j = i
            let temp = array[i]
            while j > 0 && temp < array[j - 1] {
                array[j] = array[j-1]
                j -= 1
            }
            array[j] = temp
        }
        
        return array
    }
    
    // O(nlogn) лучший кейс
    // O(n^1.5 - 2) средний кейс
    // O(n^2) худший кейс
    private func shellsMethod<T: Comparable>(_ array: inout [T]) -> [T] {
        var gap = array.count / 2
        
        while gap > 0 {
            for i in gap..<array.count {
                var j = i
                let temp = array[i]
                while j >= gap && temp < array[j-gap] {
                    array[j] = array[j - gap]
                    j -= gap
                }
                array[j] = temp
            }
            gap /= 2
        }
        return array
    }
    
    // Соединим два метода и в зависимости от глубины рекурсии выберем метод
    private func quickAndHeapSort<T: Comparable>(_ array: inout [T]) -> [T] {
        let n = Double(array.count)
        let depth = n * (log2(n))
        if depth > 500 {
            print("Превышение глубины рекурсии (\(Int(depth)): HeapSort")
            
            // O(nlogn) всегда, но медленнее на практике, берем ее в случае когда память перегружается
            return heapSort(&array)
        } // Проверка на глубину рекурсии, чтобы не получить мемори варнинг
        else {
            print("Глубина рекурсии оптимальна (\(Int(depth))): QuickSort")
            
            // O(nlogn) в среднем и лучшем случае
            // O(n^2) в случае если опорный элемент выбран плохо, либо всегда самый большой или самый маленький
            return quickSort(&array)
        }
    }
    
    private func quickSort<T: Comparable>(_ array: inout [T]) -> [T] {
        guard array.count > 1 else { return array }
        
        var mid = array.count / 2
        var left = [Int]()
        var right = [Int]()
        
        for i in 0..<array.count {
            if array[i] < array[mid] && i != mid {
                left.append(array[i] as! Int)
            }
            else if i != mid {
                right.append(array[i] as! Int)
            }
        }
        return QuickSort(left) as! [T] + [array[mid]] + QuickSort(right) as! [T]
    }
    
    private func heapSort<T: Comparable>(_ array: inout [T]) -> [T] {
        let n = array.count
        
        for i in stride(from: n / 2 - 1, through: 0, by: -1) {
            heapify(&array, n, i)
        }
        
        for i in stride(from: n-1, through: 1, by: -1) {
            array.swapAt(0, i)
            heapify(&array, i, 0)
        }
        
        return array
    }
    
    private func heapify<T: Comparable>(_ array: inout [T], _ heapSize: Int, _ rootIndex: Int) -> [T] {
        var largest = rootIndex
        let left = 2 * rootIndex + 1
        let right = 2 * rootIndex + 2
        
        if left < heapSize && array[left] > array[largest] {
            largest = left
        }
        if right < heapSize && array[right] > array[largest] {
            largest = right
        }
        if largest != rootIndex {
            array.swapAt(rootIndex, largest)
            heapify(&array, heapSize, largest)
        }
        
        return array
    }
}
