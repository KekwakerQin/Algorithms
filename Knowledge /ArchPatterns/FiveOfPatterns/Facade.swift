class CPU {
    func freeze() { }
    func jump(position: Int) { }
    func execute() { }
}

class Memory {
    func load(position: Int, data: [UInt8]) { }
}

class HardDrive {
    func read(lba: Int, size: Int) -> [UInt8] { return [] }
}

// Фасад
class ComputerFacade {
    private let cpu = CPU()
    private let memory = Memory()
    private let hardDrive = HardDrive()

    func start() {
        cpu.freeze()
        let data = hardDrive.read(lba: 0, size: 1024)
        memory.load(position: 0, data: data)
        cpu.jump(position: 0)
        cpu.execute()
    }
}

/*
 👉 Что делает:
 Предоставляет простой интерфейс к сложной системе из множества классов.

 Фасад не просто «оборачивает» объект, а оборачивает целую систему.

 Когда использовать:
     •    Нужно упростить использование сложной подсистемы.
     •    Нужно предоставить единый интерфейс (API) к множеству объектов.
 */
