import UIKit

var str = "Hello, playground"

class ListNode<T> : NSObject {
    
    var next: ListNode?
    var data: T
    
    init(data: T) {
        self.data = data
        self.next = nil
    }
    
    func describe() {
        var pointer: ListNode<T>? = nil
        pointer = self
        while pointer != nil {
            print(pointer!.data)
            pointer = pointer?.next
        }
    }
}

class List<T> {
    var head: ListNode<T>?
    var tail: ListNode<T>?
    
    //尾部插入
    func addNodeTail(_ data: T) -> ListNode<T> {
        if tail == nil {
            head = ListNode.init(data: data)
            tail = head
        } else {
            tail?.next = ListNode(data: data)
            tail = tail?.next
        }
        return tail!
    }
    
    //头部插入
    func addNodeToHead(_ data: T) -> ListNode<T> {
        if head == nil {
            head = ListNode.init(data: data)
            tail = head
        } else {
            let newNode = ListNode.init(data: data)
            newNode.next = head
            head = newNode
        }
        
        return head!
    }
    
    func describe() {
        var pointer: ListNode<T>? = nil
        pointer = head
        while pointer != nil {
            print(pointer!.data)
            pointer = pointer?.next
        }
    }
    
}




var list: List<Int> = List<Int>()


list.addNodeTail(1)
list.addNodeTail(5)
list.addNodeTail(3)
list.addNodeTail(2)
list.addNodeTail(4)
list.addNodeTail(2)
list.addNodeTail(20)

//list.describe()

// 找出比 x 小的 链 返回 子链

func fetch(x: Int, list: inout List<Int>) -> ListNode<Int>? {
    
    var currentPoninter: ListNode<Int>?
    
    currentPoninter = list.head
    
    let dummy = ListNode<Int>(data: 0)
    var dummyPre = dummy
    
    
    let dummyBig = ListNode<Int>.init(data: 0)
//    var oldPointer = list.head
    var newPointer = dummy
    
    
    while currentPoninter != nil {
        
    
       
        if currentPoninter!.data < x {
//            currentPoninter
            dummyPre.next = currentPoninter
            dummyPre = currentPoninter!
        }
        
//        if oldPointer!.data > x {
//            newPointer.next = oldPointer
//            newPointer = oldPointer!
//        }
        
        currentPoninter = currentPoninter?.next
        
    }
    
    
    
    if let node = dummyPre.next, node.data >= x {
        dummyPre.next = nil
    }
    
    return dummy.next
    
}

func fetchBig(x: Int, list:List<Int>) -> ListNode<Int>? {
    
    let dummy = ListNode<Int>.init(data: 0)
    var oldPointer = list.head
    var newPointer = dummy
    
    while oldPointer != nil {
        if oldPointer!.data > x {
            newPointer.next = oldPointer
            newPointer = oldPointer!
        }
        
        oldPointer = oldPointer?.next
    }
    
//    if newPointer.next!.data <= x {
//        newPointer.next = nil
//    }
    
    if let node = newPointer.next, node.data >= x {
        newPointer.next = nil
    }
    
    return dummy.next
    
}

//let node = fetch(x: 3, list: &list)
//let node2 = fetchBig(x: 3, list: list)

//node?.describe()
//node2?.describe()

//根据NODE来算，左右两边来算
func final(x: Int, list: List<Int>) -> ListNode<Int> {
    
    var littleNode = ListNode<Int>.init(data: 0)
    var bigNode = ListNode<Int>.init(data: 0)
    
    var littlePointer:  ListNode<Int>? = littleNode
    var bigPointer:  ListNode<Int>? = bigNode
    
    var oldPointer = list.head
    
    while oldPointer != nil {
        
        if oldPointer!.data < x {
            littlePointer?.next = oldPointer
            littlePointer = oldPointer
        } else if oldPointer!.data > x {
            bigPointer?.next = oldPointer
            bigPointer = oldPointer
        }
        
        oldPointer = oldPointer?.next
        
    }
    
    
    bigPointer?.next = nil
    
    littlePointer?.next = bigNode.next
    
    return littleNode.next!
}


//let node3 = final(x: 3, list: list)

//node3.describe()

//快行指针，坚持闭环
func hasLoop<T>(list: List<T>) -> Bool {
    var slowPointer: ListNode<T>? = list.head!
    var fastPointer: ListNode<T>? = list.head!
    
    while fastPointer != nil {
        fastPointer = fastPointer?.next?.next
        slowPointer = slowPointer?.next
        
        if fastPointer == slowPointer {
            return true
        }
    }
    
    return false
}

print(hasLoop(list: list))

// 求一个链表倒数第几个
func removeNthFromEnd<T>(head: ListNode<T>?, _ n: Int) -> T? {
    
    var frontNode: ListNode<T>? = head
    var lastNode: ListNode<T>? = head
    
    for _ in 0...n-1 {
        frontNode = frontNode?.next
    }
    
    while frontNode?.next != nil {
        frontNode = frontNode?.next
        lastNode = lastNode?.next
    }
    
    return lastNode?.next?.data
    
}

let a = removeNthFromEnd(head: list.head, 2)
print(a)
