protocol Renderer {
    func renderCircle(radius: Double)
}

class VectorRenderer: Renderer {
    func renderCircle(radius: Double) {
        print("Отрисовка круга радиусом \(radius) в векторе")
    }
}

class RasterRenderer: Renderer {
    func renderCircle(radius: Double) {
        print("Отрисовка круга радиусом \(radius) в растре")
    }
}

class Circle {
    let radius: Double
    let renderer: Renderer

    init(radius: Double, renderer: Renderer) {
        self.radius = radius
        self.renderer = renderer
    }

    func draw() {
        renderer.renderCircle(radius: radius)
    }
}

let circle = Circle(radius: 5, renderer: RasterRenderer())
circle.draw()

/*
 👉 Что делает:
 Разделяет абстракцию и её реализацию, чтобы их можно было изменять независимо.

 От Adapter отличается тем, что:
     •    Adapter соединяет чужие интерфейсы (legacy/3rd-party),
     •    а Bridge применяется, когда ты САМ проектируешь и абстракцию, и реализацию.

 Когда использовать:
     •    Нужно отделить абстракцию от платформы (например, один интерфейс для разных ОС).
     •    Нужно поддерживать множественные вариации и независимо их комбинировать.
 */
