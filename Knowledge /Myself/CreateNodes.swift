class Node { // Создаем класс, в котором определяем значение и ищем следующий элемент в ноде. Используем класс, т.к мы имееем ссылочную переменную, что удовлетворяет указанию "Класс". "Стракт" ломает логику создавая копии вместо этого
    
    var value: Int
    var next: Node? // ? - потому что следующей может и не быть. Вернем - нил
    
    init(value: Int) { // не узкаываем некст, а определяем ее по дефолту внутри. Сразу нил, в функции переопределим ее если будет
        self.value = value
        self.next = nil
    }
}

class LinkedList {
    private var head: Node? // он и будет нилом сразу, т.к класс не определен, а в нем ничего щас нет. Будем работать с ним.
    
    func append(_ value: Int) {
        // Создаем значение ноды и первый объект
        let newNode = Node(value: value)
        // Теперь корнер кейсы, их всего два: Корень ноды и "ветки"
        // Корень ноды:
        if head == nil {
            head = newNode // Если корня первого не было, определяем ей значение.
        } else { // Остальные случаи
            var current = head // Идем от верхушки ноды, к дальным
            while current?.next != nil { // Если мы встречаем "некст", не с пустым значением, это значит что дальше что-то есть, либо еще нода, либо пустота (нил)
                current = current?.next // Переходим к следующей ноде вглубь
            }
            // О ура, мы прошли по всем листьям в ноде (встретили нил), теперь мы можем привязать новую ноду таким образом:
            current?.next = newNode
        }
    }
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var prev: ListNode? = dummy
        var current = head
        
        while current != nil {
            var hasDuplicates = false
            guard var next = current?.next else { return nil }
            if next != nil && current?.val == next.val {
                hasDuplicates = true
                current = next
            }
            
            if hasDuplicates {
                prev?.next = current?.next
            } else {
                prev = prev?.next
            }
            
            current = current?.next
        }
        return dummy.next
        
    }
    
    // Нам же надо проверить что у нас есть
    func print() {
        var current = head
        while current != nil {
            Swift.print(current!.value, terminator: " -> ")
            current = current!.next
        }
        Swift.print("nil")
    }
}
