import UIKit

protocol StateType: Hashable {}

enum State: StateType {
    case idle
    case work
    case shortBreak
    case longBreak
}


protocol EventType: Hashable {}

enum Event: EventType {
    case startWork
    case startShortBreak
    case startLongBreak
    case backToIdle
}

//状态机
class StateMachine<S: StateType, E: EventType> {
    private(set) var currentState: S
    
    
    private struct Operation<S: StateType, E: EventType> {
        let transition: Transition<S, E>
        let triggerCallback: (Transition<S, E>) -> Void
    }
        
    private var routes = [S: [E: Operation<S, E>]]()
    
    
    init(_ initialState: S) {
        self.currentState = initialState
    }
    
    //接着为了处理事件发生，添加一个记录状态转移的方法：
    func listen(_ event: E, transit fromState: S, to toState: S, callback: @escaping (Transition<S, E>) -> Void) {
        var route = routes[fromState] ?? [:]
        let transition = Transition(event: event, fromState: fromState, toState: toState)
        let operation = Operation(transition: transition, triggerCallback: callback)
        route[event] = operation
        routes[fromState] = route
    }
    
    func trigger(_ event: E) {
        guard let route = routes[currentState]?[event] else { return }
        
        route.triggerCallback(route.transition)
        currentState = route.transition.toState
    }
}

//我们监听事件 event 发生时，如果当前状态为 fromState，那么转移状态到 toState，并且执行回调方法。

//为了方便回调时获取整个转移过程，我们再定义一个 Transition 结构体用于封装这些内容：

struct Transition<S: StateType, E:EventType> {
    let event: E
    let formState: S
    let toState: S
    
    init(event: E, fromState: S, toState: S) {
        self.event = event
        self.formState = fromState
        self.toState = toState
    }
}


//在初始化的时候除了要指定状态和事件的具体类型外，还需要提供一个初始状态作为当前状态。
let stateMachine = StateMachine<State, Event>(.idle)

stateMachine.listen(.startWork, transit: .idle, to: .work) { (transition) in
//    ...
}

stateMachine.trigger(.startWork)



