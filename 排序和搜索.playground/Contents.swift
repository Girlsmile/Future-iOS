import UIKit

//var originalNums: [Int] = [4,15,7,5,6,21,6,0,33,3]

var originalNums: [Int] = [20, 50, 20, 40, 70, 10, 80, 30, 60]


//冒泡排序 key: 外层循环i不需要减少1，内层循环需要减少1
func bubble(originalNums: [Int]) -> [Int] {
    
    var res = originalNums
    var mid: Int = 0
    
    for i in 0..<res.count {
        for j in 1..<res.count - i {
            if res[j] < res[j-1] {
                mid = res[j]
                res[j] = res[j-1]
                res[j-1] = mid
            }
            
           
        }
    }
    
    
    return res
}

print("冒泡排序",bubble(originalNums: originalNums))

//插入排序

func insert(originalNums: [Int]) -> [Int] {
    
    var res = originalNums
    var mid: Int = 0
    
    for i in 0..<res.count {
        for j in 0...i {
            if res[i] < res[j] {
                mid = res[i]
                res[i] = res[j]
                res[j] = mid
            }
        }
    }
    
    return res
}

print("插入排序", insert(originalNums: originalNums))

func selected(originalNums: [Int]) -> [Int] {
    var res = originalNums
    var mid: Int = 0
    var currentMinIndex: Int = 0
    
    for i in 0..<res.count {
        currentMinIndex = i
        for j in i..<res.count {
            if res[j] < res[currentMinIndex] {
                currentMinIndex = j
            }
        }
        
        mid = res[i]
        res[i] = res[currentMinIndex]
        res[currentMinIndex] = mid
        
    }
    
    return res
}

print("选择排序", selected(originalNums: originalNums))


////堆排序， 两个要点 构建最大堆，交换头尾，在构建最大堆
//
//func headSort(array: [Int]) -> [Int] {
//
//    var sortArray = array
//
//    print("0", sortArray)
//
//    var len = sortArray.count - 1
//    for i in 0...len/2 - 1 {
//        headAdjust(array: &sortArray, startIndex: len/2 - 1 - i, endIndex: len) // 堆构造
//    }
//
//
//    print("1", sortArray)
//
//    while len > 0 {
//        len -= 1
//        sortArray.swapAt(0, len) //将堆顶元素与尾节点交换后，长度减1，尾元素最大
//        headAdjust(array: &sortArray, startIndex: 0, endIndex: len)
//    }
//
//
//    return sortArray
//}
//
////从后面的节点往回调整
////堆排序主要在于理解堆的构造过程和在输出最大元素后如何对堆进行重新调整
//func headAdjust(array: inout [Int], startIndex: Int, endIndex: Int) {
//    var left = 0
//    var right = 0
//    var j = 0
//
//    var startIndex = startIndex
//
//    while ( (2*startIndex + 1) <= endIndex) {
//        left = 2*startIndex + 1
//
//        right = left + 1
//
//        j = left
//
//        if (j < endIndex && array[left] < array[right]) { // 右节点大于左节点
//            j += 1 // 当前把"指针"指向右节点
//        } else if (array[startIndex] < array[j]) {
//            array.swapAt(startIndex, j)
//        } else {
//            break
//        }
//
//        startIndex = j
//
//    }
//}

//TODO 吧 有点恶心 https://blog.csdn.net/Faker_Wang/article/details/81236011
//print("堆排序", headSort(array: originalNums))


//归并排序

//func mergeSort(array: [Int]) -> [Int] {
//    var resArray = array
//    return resArray
//}


//快速排序

func quickHelp(array: [Int]) -> [Int] {
    
    guard array.count > 1 else { return array}
    
    let markIndex = array.count/2
    let mark = array[markIndex]
    
    var left: [Int] = []
    var middle: [Int] = []
    var right: [Int] = []
    
    for index in 0..<array.count {
        if array[index] < mark {
            left.append(array[index])
        } else if array [index] == mark {
            middle.append(array[index])
        } else {
            right.append(array[index])
        }
    }
    
    var a = quickHelp(array: left) + middle + quickHelp(array: right)
    
    return a
}

print("快速排序", quickHelp(array: originalNums))


///-----------------------------------------搜索🔍---------------------------------------///

func binarySearch(_ nums: [Int], _ target: Int) -> Bool {
    
    guard nums.count > 1 else {
        return target == nums[0]
    }
    
    let mid = nums[nums.count/2]
    
    if target < mid {
        var newNums: [Int] = []
        for index in 0..<nums.count/2 {
            newNums.append(nums[index])
        }
        return binarySearch(newNums, target)
    } else if target == mid {
        return true
    } else {
        var newNums: [Int] = []
        for index in nums.count/2..<nums.count{
            newNums.append(nums[index])
        }
        return binarySearch(newNums, target)
    }
    
}

let sums = quickHelp(array: originalNums)
print("二分查找",binarySearch(sums, 80))


//非递归实现
func binarySearch2(_ nums: [Int], _ target: Int) -> Bool {
    
    var left = 0
    var mid = 0
    var right = nums.count - 1
    
    while left <= right {
        mid = (right - left) / 2 + left
        
        if nums[mid] == target {
            return true
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return false
    
}

/// 会议时间合并

class Meeting {
    var startTime: Int
    var endTime: Int
    
    init(startTime: Int, endTime: Int) {
        self.startTime = startTime
        self.endTime = endTime
    }
}

var demos = [Meeting(startTime: 1, endTime: 3), Meeting(startTime: 5, endTime: 6), Meeting(startTime: 4, endTime: 7), Meeting(startTime: 2, endTime: 3),
             Meeting(startTime: 1, endTime: 6),  Meeting(startTime: 9, endTime: 10)]

func merge(_ meetingTimes: [Meeting]) -> [Meeting] {
    
    
    
    return []
}

//先根据开始时间排序 快排

func sortMerge(_ meetingTimes: [Meeting]) -> [Meeting] {
    
    guard meetingTimes.count > 1 else {
        return meetingTimes
    }
    
    let count = meetingTimes.count
    let midStartTime = meetingTimes[count/2].startTime
    
    var left: [Meeting] = []
    var middle: [Meeting] = []
    var right: [Meeting] = []
    
    for index in 0..<count {
        if meetingTimes[index].startTime < midStartTime {
            left.append(meetingTimes[index])
        } else if meetingTimes[index].startTime == midStartTime {
            middle.append(meetingTimes[index])
        } else {
            right.append(meetingTimes[index])
        }
    }
    
    return sortMerge(left) + middle + sortMerge(right)
}
//同一个startTime 合并

//print("time排序", )
//sortMerge(demos).forEach { (item) in
//    print(item.startTime, item.endTime)
//}

func match(_ meetingTimes: [Meeting]) -> [Meeting] {
    
    var res: [Meeting] = []
    
    var minStartTime = meetingTimes[0].startTime
    var maxEndTime = meetingTimes[0].endTime
    
   
    
    for index in 0..<meetingTimes.count {
        if meetingTimes[index].startTime == minStartTime {
            if meetingTimes[index].endTime > maxEndTime {
                maxEndTime = meetingTimes[index].endTime
            }
        } else {
            
            if meetingTimes[index].endTime > maxEndTime {
                maxEndTime = meetingTimes[index].endTime
            }
            
            
            let newTime = Meeting(startTime: minStartTime, endTime: maxEndTime)
            res.append(newTime)
            
            minStartTime = meetingTimes[index].startTime
            maxEndTime = meetingTimes[index].endTime
        }
        
    }
    
    return res
}



//match(sortMerge(demos)).forEach { (item) in
//    print(item.startTime, item.endTime)
//}

// 区间合并
func last(_ meetingTimes: [Meeting]) -> [Meeting] {
    
    var currentMinTime: Int = meetingTimes[0].startTime
    var currentMaxTime: Int = meetingTimes[0].endTime
    var res: [Meeting] = []
    
    for index in 0..<meetingTimes.count {
        
        if meetingTimes[index].endTime <= currentMaxTime {
            
           
            currentMaxTime = max(meetingTimes[index].endTime, currentMaxTime)
            
            
            
        } else {
            
            currentMaxTime = max(meetingTimes[index].endTime, currentMaxTime)
            res.append(Meeting.init(startTime: currentMinTime, endTime: currentMaxTime))
            
            currentMinTime = meetingTimes[index].startTime
            currentMaxTime =  meetingTimes[index].endTime
            
            
        }
        
        
        
    }
    
    
    
    return res
    
}

last(match(sortMerge(demos))).forEach { (item) in
    print(item.startTime, item.endTime)
}
//TODO 先做到这吧

