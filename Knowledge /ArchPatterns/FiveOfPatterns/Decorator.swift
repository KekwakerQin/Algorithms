protocol Coffee {
    func cost() -> Double
}

class SimpleCoffee: Coffee {
    func cost() -> Double { 5.0 }
}

class MilkDecorator: Coffee {
    private let base: Coffee
    init(base: Coffee) { self.base = base }
    func cost() -> Double { base.cost() + 1.5 }
}

let coffee = MilkDecorator(base: SimpleCoffee())
print(coffee.cost()) // 6.5

/*
 👉 Что делает:
 Добавляет новую функциональность объекту динамически, без изменения его класса.

 📌 Также иногда называют «Smart Proxy», но отличие: декоратор НЕ управляет доступом и НЕ скрывает объект, а просто ДОБАВЛЯЕТ поведение.

 Когда использовать:
     •    Нужно расширить функционал объекта без наследования.
     •    Нужно добавить поведение в рантайме, складывать одно поверх другого.

 Пример:
     •    Оборачивание потока для добавления шифрования/сжатия.
     •    Оборачивание UI-компонентов для добавления стилей.
 */
