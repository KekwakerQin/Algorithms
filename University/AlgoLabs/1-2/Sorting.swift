import Foundation

// Энам для выбора метода сортировки
enum ChooseSortingMethod {
    case insertionSort, shellsMethod, quickAndHeapSort, mergeSort
}

/// Структура для хранения статистики сортировки
struct SortStatistics {
    var comparisons = 0
    var swaps = 0
}

final class SortingForUnisLab {
    
    // MARK: - RUN
    
    /// Запуск программы и выбор метода сортировки
    /// - Parameters:
    ///   - array: сам массив (inout)
    ///   - method: выбранный метод сортировки
    ///   - stats: inout-структура, в которую будем записывать количество сравнений и пересылок
    /// - Returns: отсортированный массив
    func runSortForLab<T: Comparable>(
        array: inout [T],
        for method: ChooseSortingMethod,
        stats: inout SortStatistics
    ) -> [T] {
        switch method {
        case .insertionSort:
            return insertionSort(&array, &stats)
        case .shellsMethod:
            return shellsMethod(&array, &stats)
        case .quickAndHeapSort:
            return quickAndHeapSort(&array, &stats)
        case .mergeSort:
            var calls = 0
            return mergeSort(&array, 0, array.count, &calls, &stats)
        }
    }
    
    
    // MARK: - Merge Sort
    
    /// Основная функция Merge Sort (рекурсивно)
    private func mergeSort<T: Comparable>(
        _ array: inout [T],
        _ start: Int,
        _ end: Int,
        _ calls: inout Int,
        _ stats: inout SortStatistics
    ) -> [T] {
        guard end - start > 1 else {
            return array
        }
        
        calls += 1
        let mid = (start + end) / 2
        
        // Рекурсивно сортируем две половины
        mergeSort(&array, start, mid, &calls, &stats)
        mergeSort(&array, mid, end, &calls, &stats)
        // Сливаем две отсортированные половины
        merge(&array, start, mid, end, &calls, &stats)
        
        return array
    }

    /// Слияние двух отсортированных частей
    private func merge<T: Comparable>(
        _ array: inout [T],
        _ start: Int,
        _ mid: Int,
        _ end: Int,
        _ calls: inout Int,
        _ stats: inout SortStatistics
    ) {
        calls += 1
        var temp: [T] = []
        var i = start
        var j = mid
        
        // Пока обе половины не закончились, берём наименьший элемент
        while i < mid && j < end {
            stats.comparisons += 1
            if array[i] <= array[j] {
                temp.append(array[i])
                i += 1
            } else {
                temp.append(array[j])
                j += 1
            }
            stats.swaps += 1
        }
        
        // Если в левой половине остались элементы
        while i < mid {
            temp.append(array[i])
            i += 1
            stats.swaps += 1
        }
        
        // Если в правой половине остались элементы
        while j < end {
            temp.append(array[j])
            j += 1
            stats.swaps += 1
        }
        
        // Копируем результат обратно в исходный массив
        for (index, value) in temp.enumerated() {
            array[start + index] = value
            stats.swaps += 1
        }
    }
    
    
    // MARK: - Insertion Sort
    
    private func insertionSort<T: Comparable>(
        _ array: inout [T],
        _ stats: inout SortStatistics
    ) -> [T] {
        let n = array.count
        for i in 1..<n {
            var j = i
            let temp = array[i]
            stats.swaps += 1  // сохранили в temp
            // Сдвигаем элементы вправо, пока они больше temp
            while j > 0 {
                stats.comparisons += 1
                if temp < array[j - 1] {
                    array[j] = array[j - 1]
                    stats.swaps += 1
                    j -= 1
                } else {
                    break
                }
            }
            array[j] = temp
            stats.swaps += 1
        }
        return array
    }
    
    
    // MARK: - Shell Method Sort
    
    private func shellsMethod<T: Comparable>(
        _ array: inout [T],
        _ stats: inout SortStatistics
    ) -> [T] {
        var gap = array.count / 2
        
        while gap > 0 {
            for i in gap..<array.count {
                var j = i
                let temp = array[i]
                stats.swaps += 1  // сохранили в temp
                while j >= gap {
                    stats.comparisons += 1
                    if temp < array[j - gap] {
                        array[j] = array[j - gap]
                        stats.swaps += 1
                        j -= gap
                    } else {
                        break
                    }
                }
                array[j] = temp
                stats.swaps += 1
            }
            gap /= 2
        }
        
        return array
    }
    
    
    // MARK: - Quick and Heap Sort
    
    /// В зависимости от «глубины рекурсии» выбираем QuickSort или HeapSort
    private func quickAndHeapSort<T: Comparable>(
        _ array: inout [T],
        _ stats: inout SortStatistics
    ) -> [T] {
        let n = Double(array.count)
        let depth = n * log2(n)
        if depth > 1000 {
            // Если глубина потенциально велика — переключаемся на HeapSort
            return heapSort(&array, &stats)
        } else {
            return quickSort(&array, &stats)
        }
    }
    
    /// QuickSort (не in-place, но для демонстрации статистики)
    private func quickSort<T: Comparable>(
        _ array: inout [T],
        _ stats: inout SortStatistics
    ) -> [T] {
        // Базовый случай
        guard array.count > 1 else {
            return array
        }
        
        // Выбираем опорный элемент (pivot) по центру
        let pivotIndex = array.count / 2
        let pivot = array[pivotIndex]
        var left: [T] = []
        var right: [T] = []
        
        // Разделяем элементы
        for (i, value) in array.enumerated() {
            if i == pivotIndex { continue }
            stats.comparisons += 1
            if value < pivot {
                left.append(value)
            } else {
                right.append(value)
            }
        }
        
        // Каждый элемент мы фактически «скопировали» в left/right, считаем это за swaps
        stats.swaps += array.count
        
        // Рекурсивно сортируем половины
        let sortedLeft = quickSort(&left, &stats)
        let sortedRight = quickSort(&right, &stats)
        
        // Собираем итоговый массив
        return sortedLeft + [pivot] + sortedRight
    }
    
    /// HeapSort (in-place)
    private func heapSort<T: Comparable>(
        _ array: inout [T],
        _ stats: inout SortStatistics
    ) -> [T] {
        let n = array.count
        
        // Построение max-кучи
        for i in stride(from: n / 2 - 1, through: 0, by: -1) {
            heapify(&array, n, i, &stats)
        }
        // Извлечение из кучи
        for i in stride(from: n - 1, through: 1, by: -1) {
            array.swapAt(0, i)
            stats.swaps += 1
            heapify(&array, i, 0, &stats)
        }
        
        return array
    }
    
    /// Вспомогательная функция для поддержания кучи
    private func heapify<T: Comparable>(
        _ array: inout [T],
        _ heapSize: Int,
        _ rootIndex: Int,
        _ stats: inout SortStatistics
    ) {
        var largest = rootIndex
        let left = 2 * rootIndex + 1
        let right = 2 * rootIndex + 2
        
        // Сравниваем с левым ребёнком
        if left < heapSize {
            stats.comparisons += 1
            if array[left] > array[largest] {
                largest = left
            }
        }
        // Сравниваем с правым ребёнком
        if right < heapSize {
            stats.comparisons += 1
            if array[right] > array[largest] {
                largest = right
            }
        }
        
        // Если нужно поменять местами корень и ребёнка
        if largest != rootIndex {
            array.swapAt(rootIndex, largest)
            stats.swaps += 1
            heapify(&array, heapSize, largest, &stats)
        }
    }
    
}
