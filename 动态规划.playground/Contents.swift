import UIKit

var str = "Hello, playground"
//f(n) = f(n-1) + f(n-2), n>2

func fib(n: Int) -> Int {
    
    guard n > 0 else { return 0 }
    
    if n == 1 || n == 2 {
        return 1
    }
    
    return fib(n: n-1) + fib(n: n-2)
}



//用空间兑换时间

var nums = Array.init(repeating: 0, count: 100)


func fib2(n: Int) -> Int {
    
    guard n > 0 else { return 0 }
    
    if n == 1 || n == 2 {
        return 1
    }
    
    var sum0: Int = 0
    var sum1: Int = 0
    
    if nums[n-1] == 0 {
        nums[n-1] = fib2(n: n-1)
    }
    
    sum0 = nums[n-1]
    
    if nums[n-2] == 0 {
        nums[n-2] = fib2(n: n-2)
    }
    
    sum1 = nums[n-2]
    
    return  sum0  + sum1
}

fib2(n: 30)
fib(n: 30)

//初始状态 和 状态方程 -- 动态规划

//深度优先 广度优先

//递归和栈队列的切换
