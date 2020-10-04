public class TreeNode<T> {
    var data: T
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    
    init(data: T) {
        self.data = data
    }
}

var treeNode: TreeNode<Int> = TreeNode.init(data: 1)
treeNode.leftNode = TreeNode.init(data: 2)
treeNode.rightNode = TreeNode.init(data: 3)

treeNode.leftNode?.leftNode = TreeNode.init(data: 4)
treeNode.leftNode?.rightNode = TreeNode.init(data: 5)

treeNode.rightNode?.leftNode = TreeNode.init(data: 6)
//treeNode.rightNode?.rightNode = TreeNode.init(data: 7)
//
//treeNode.leftNode?.leftNode?.leftNode = TreeNode.init(data: 8)
//treeNode.leftNode?.leftNode?.rightNode = TreeNode.init(data: 9)
//
//treeNode.leftNode?.rightNode?.leftNode = TreeNode.init(data: 10)
//treeNode.leftNode?.rightNode?.rightNode = TreeNode.init(data: 11)
//
//treeNode.rightNode?.leftNode?.leftNode = TreeNode.init(data: 12)
//treeNode.rightNode?.leftNode?.rightNode = TreeNode.init(data: 13)
//
//treeNode.rightNode?.rightNode?.leftNode = TreeNode.init(data: 14)
//treeNode.rightNode?.rightNode?.rightNode = TreeNode.init(data: 15)

func maxDepth<T>(_ root: TreeNode<T>?) -> Int {
    guard root != nil else {
        return 0
    }
    
    let rightSum = maxDepth(root?.rightNode) + 1
    let leftSum = maxDepth(root?.leftNode) + 1
    
    return max(rightSum, leftSum)
}

func sub(a: Int, b: Int) -> Bool {
    return (a - b) < 0
}

//判断是否是二叉查找树
func isValidBST<Int: BinaryInteger>(root: TreeNode<Int>?) -> Bool {
    
    guard let root = root else {
        return true
    }

    let rootValue = root.data
    let leftValue = root.leftNode?.data
    let rightValue = root.rightNode?.data
 
    if let lValue = leftValue, lValue - rootValue > 0 {
        return false
    }
    
    if let rValue = rightValue, rValue - rootValue < 0 {
        return false
    }
    
    
    return isValidBST(root: root.leftNode) && isValidBST(root: root.rightNode)
}

//三种二叉树递归遍历

func preorder<T>(root: TreeNode<T>?) {
    guard root != nil else {
        return
    }
    
    print(root!.data)
    
    preorder(root: root?.rightNode)
    preorder(root: root?.leftNode)
    
}

func midUp<T>(root: TreeNode<T>?) {
    guard root != nil else {
        return
    }
    
    print(root!.data) //左中右
    
    midUp(root: root?.leftNode)
    
//    print(root!.data)
    
    midUp(root: root?.rightNode)
    
//    print(root!.data)//左右中
}



midUp(root: treeNode)
print(isValidBST(root: treeNode))


//用栈实现的前序遍历
func preorderTraversal<T>(root: TreeNode<T>?) -> [T] {
    var result = [T]()
    var currentNode = root
    var currentStack = [TreeNode<T>]()
    
    while !(currentNode == nil && currentStack.isEmpty) {
        //先找左节点，找不到去栈里面找右节点
        if currentNode != nil {
            result.append(currentNode!.data)
            currentStack.append(currentNode!)
            currentNode = currentNode?.leftNode
        } else {
            var topNode = currentStack.removeLast()
            currentNode = topNode.rightNode
        }
    }
    
    return result
}


print(preorderTraversal(root: treeNode))


//广度优先遍历
func breadth<T>(root: TreeNode<T>?) -> [[T]] {
    
    guard let root = root else {
        return []
    }
    
    //双队列实现 我真tm是个天才
    var oldQueue = [TreeNode<T>]()
    var newQueue = [TreeNode<T>]()
    
    var res = [[T]]()
    var currentLevelRes = [T]()
    
    oldQueue.append(root)
    
    while !(oldQueue.isEmpty && newQueue.isEmpty) {
        
        
        if !oldQueue.isEmpty {
            let node = oldQueue.removeLast()
            currentLevelRes.append(node.data)
            
            if let leftNode = node.leftNode {
                newQueue.append(leftNode)
            }
            
            if let rightNode = node.rightNode {
                newQueue.append(rightNode)
            }
        } else {
            
            
            
            while !newQueue.isEmpty {
                oldQueue.append(newQueue.removeLast())
            }
            
        }
        
        if newQueue.isEmpty {
            res.append(currentLevelRes)
            currentLevelRes.removeAll()
        }
        
        
    }

    return res
    
}

print(breadth(root: treeNode))


//talbeView显示一颗二叉树
func showTree<T>(root: TreeNode<T>?) -> [T?] {
    guard let root = root else { return []}
    
    return showHelper(root: root)
}

func showHelper<T>(root: TreeNode<T>?) -> [T?] {
    guard let root = root else { return []}
    
    var current = [root.data, root.leftNode?.data, root.rightNode?.data]
    current.append(contentsOf: showHelper(root: root.leftNode))
    current.append(contentsOf: showHelper(root: root.rightNode))
    
    return current
}

print(showTree(root: treeNode))


//尝试用单个队列实现 广度优先

func levelOrder<Int>(root: TreeNode<Int>?) -> [[Int]] {
    guard let root = root else { return []}
    var queue: [TreeNode<Int>] = []
    var lastLevelCount = 1
    
    queue.append(root)
    
    while queue.count > 0 {
        lastLevelCount = queue.count
        
        for _ in 0..<lastLevelCount {
            var lastLevelTopNode = queue.removeFirst()
            print(lastLevelTopNode.data)
            
            if let left = lastLevelTopNode.leftNode {
                queue.append(left)
            }
            
            if let right = lastLevelTopNode.rightNode {
                queue.append(right)
            }
        }
    
    }
    
    
    return []
}

levelOrder(root: treeNode)
