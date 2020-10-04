import UIKit

protocol Stack {
    associatedtype Element
    //是否为空
    var isEmpty: Bool { get }
    var size: Int{ get }
    //栈顶元素
    var peek: Element?{ get }
    
    //进栈
    mutating func push(_ newElement: Element)
    
    //出栈
    mutating func pop() -> Element?
}

struct IntergerStack: Stack {
    
    typealias Element = Int
    
    var stack: [Element] = []
    
    var isEmpty: Bool { return stack.isEmpty}
    
    var size: Int { return stack.count }
    
    var peek: Int? { return stack.first }
    
    mutating func push(_ newElement: Int) {
        stack.append(newElement)
    }
    
    mutating func pop() -> Int? {
        return stack.removeLast()
    }
}


protocol Queue {
    associatedtype Element
    var isEmpty:Bool { get }
    mutating func enqueue(element: Element)
    mutating func dequeue() -> Element?
    //队首元素
    var peek: Element? {get}
}

struct IntegerQueue: Queue {
    
    var queue: [Element] = []
    
    typealias Element = Int
    
    var isEmpty: Bool { return queue.isEmpty }
    
    mutating func enqueue(element: Int) {
        queue.append(element)
    }
    
    mutating func dequeue() -> Int? {
        return queue.removeFirst()
    }
    
    var peek: Int? {
        return queue.first
    }
    
    
}
