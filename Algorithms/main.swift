
// Теперь основной код
let holder = UnitHolder()              // holder.units = [Unit("a"), Unit("b"), Unit("c")]
var units = holder.units               // Копия массива, но объекты те же
var u = units.removeLast()             // Удаляем Unit("c"), сохраняем ссылку на него в u
u.name = "d"                           // Меняем имя: теперь это Unit("d")
units[0].name = "e"                    // Меняем имя первого элемента: теперь это Unit("e")

print("----")
units.forEach { print($0.name) }       // Печатаем имена: e, b
print("----")
holder.units.forEach { print($0.name) } // Печатаем имена: e, b, d
