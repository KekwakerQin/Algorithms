protocol OldSystem {
    func oldRequest()
}

class NewSystem {
    func newRequest() {
        print("Работаем с новым интерфейсом")
    }
}

// Адаптер
class NewToOldAdapter: OldSystem {
    private let newSystem: NewSystem
    init(newSystem: NewSystem) { self.newSystem = newSystem }
    func oldRequest() {
        newSystem.newRequest()
    }
}

/*
 3️⃣ Adapter (Адаптер)

 👉 Что делает:
 Преобразует интерфейс одного класса в интерфейс, который ожидает клиент.
 То есть совмещает несовместимые интерфейсы.

 Когда использовать:
     •    Когда у нас есть готовый класс, но его интерфейс не подходит.
     •    Когда нужно интегрировать стороннюю библиотеку.

 Важное отличие:

 Adapter просто «переводит» интерфейс с одного на другой.
 Не добавляет функционала (как Decorator) и не управляет доступом (как Proxy).
 */
