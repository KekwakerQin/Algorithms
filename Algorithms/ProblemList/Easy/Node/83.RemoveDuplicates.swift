class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head

        while current != nil && current?.next != nil {
            if current!.val == current!.next!.val {
                current!.next = current!.next!.next // пропускаем дубликат
            } else {
                current = current!.next
            }
        }

        return head
    }
}

// Если что я все еще не понимаю немного 
