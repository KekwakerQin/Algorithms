class Engine {
    var power: Int
    init(power: Int) {
        self.power = power
    }
}

struct Car {
    var name: String
    var engine: Engine
}
//
//var engine = Engine(power: 100)
//var car1 = Car(name: "BMW", engine: engine)
//var car2 = car1
//
//car2.name = "Audi" // Меняем имя в новой структуре (мы создали копию и работаем с ней)
//car2.engine.power = 200 // Здесь же однако, мы ссылаемся на ОДИН И ТОТ ЖЕ класс, и поэтому кар1 примет то же значение
//
//// итого, мы получим кар1 - БМВ 200 (получили от ссылки с другого места). кар2 - АУДИ (мы изменили имя в другом объекте), а мощность стала 200, т.к ссылка на один класс
//print("car1 name: \(car1.name)")
//print("car1 engine power: \(car1.engine.power)")
//
//print("car2 name: \(car2.name)")
//print("car2 engine power: \(car2.engine.power)")
