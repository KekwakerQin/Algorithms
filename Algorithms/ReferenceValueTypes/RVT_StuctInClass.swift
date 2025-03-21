class Counter {
    var value: Int
    init(value: Int) {
        self.value = value
    }
}

struct Tracker {
    var id: String
    var counter: Counter
}

//var c = Counter(value: 0)
//var t1 = Tracker(id: "A", counter: c)
//var t2 = t1
//
//t2.id = "B"
//t2.counter.value += 5
//
//print(t1.id) // A
//print(t1.counter.value) // 5
