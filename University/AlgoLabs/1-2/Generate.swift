// Енам, для удобства пользования, чтобы определять какой массив мы хотим загенерить
enum Mode {
    case random,
         increase,
         decrease
}

final class GenerateTest { // final - для ускорения диспетчирезации, т.к у нас класс не будет переопределяться, а компилятор не будет тратить время на поиск
    
    static var shared = GenerateTest()
    
    private init() {}
    func generateArray<T: Comparable>(sizeForGenerate: Int, for mode: Mode) -> [T] {
        var array = [T]()
        
        switch mode {
        case .random: array = randomGenerate(size: sizeForGenerate)
        case .increase: array = increasingGenerate(size: sizeForGenerate)
        case .decrease: array = decreasingGenerate(size: sizeForGenerate)
        }
        
        checkSeries(array)
        return array
    }
    
    // Для каждой реализации генерации поставим приват, чтобы закрыть доступ извне не из класса
    
    // MARK: - Рандомная генерация
    
    private func randomGenerate<T: Comparable>(size: Int) -> [T] { // Возвращаем массив любого типа данных [String, Int ...]
        var array = [T]() // Создание пустого массива
        
        for _ in 0..<size { // Обход от 0 до размера. Создание переменной i можно опустить и сделать обычный цикл
            array.append(Int.random(in: 0...500) as! T) // Рандомная генерация от 0 до 500 включительно
        }
        
        return array // Возвращаем
    }
    
    // MARK: - Возрастающая генерация
    
    private func increasingGenerate<T: Comparable>(size: Int) -> [T] {
        var array = [T]()
        
        for i in 0..<size {
            array.append(i as! T)
        }
        
        return array
    }
    
    // MARK: - Убывающая генерация
    
    private func decreasingGenerate<T: Comparable>(size: Int) -> [T] {
        var array = [T]()
        
        
        // Реализация с лишним вычислением
//        for i in 1...size {
//            array.append(size - i) // Получаем убывание. Прим: 500-0=500, 500-1=499 ... 500-500 = 0 [500,499 ... 0]
//        }
        
        // Специальный цикличный метод предоставленный языком свифт, для необычного шага
        for i in stride(from: size - 1, through: 0, by: -1) {
            array.append(i as! T)
        }
        
        return array
    }
    
    // MARK: - Проверка серий с разделителем
    private func checkSeries<T: Comparable>(_ array: [T] ) {
        var series = 1
        
        print("[LOG]: Checking series \n[ ", terminator: "")
        for i in 0..<array.count - 1 { // -1 чтобы не выйти за границу массива, нам не надо обрабатывать конечный результат
            if array[i] < array[i + 1] {
                print(array[i], terminator: " ")
            }
            else {
                print("\(array[i]) |", terminator: " ")
                series += 1
            }
        }
        
        // Обработка последнего элемента
        if array[array.count - 2] > array[array.count - 1] {
            print("\(array[array.count - 1])", terminator: " ")
        }
        print("]\nSeries: \(series)\n")
    }
}
