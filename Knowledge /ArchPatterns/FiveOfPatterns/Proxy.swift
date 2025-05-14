protocol Image {
    func display()
}

class RealImage: Image {
    init(filename: String) { /* загрузка файла */ }
    func display() { print("Показываю картинку") }
}

class ProxyImage: Image {
    private let filename: String
    private var realImage: RealImage?

    init(filename: String) {
        self.filename = filename
    }

    func display() {
        if realImage == nil {
            realImage = RealImage(filename: filename)
        }
        realImage?.display()
    }
}

/*
 👉 Что делает:
 Создаёт замену объекта и перехватывает доступ к нему. При этом сам интерфейс остаётся тем же.

 Когда использовать:
     •    Когда нужно лениво создавать объект (например, тяжёлый объект создаётся только при первом вызове).
     •    Когда объект находится удалённо (например, сетевой сервис), но вызывающий код работает так, как будто объект локальный.
     •    Когда нужно контролировать доступ (например, защищённый доступ).

 Примеры:
     •    Virtual Proxy: создаёт объект при первом использовании.
     •    Remote Proxy: оборачивает удалённый объект (RMI, gRPC и т.д.).
     •    Protection Proxy: проверка прав доступа перед вызовом метода.
 */
