var str = "the sky is blue"

func reverse<T>(array: inout [T], start: Int, end: Int) {
    
    var start1 = start
    var end1 = end
    
    while start1 < end1 {
        (array[start1], array[end1]) = (array[end1], array[start1])
        start1 += 1
//        print(start1)
        end1 -= 1
//        print(end1)
    }
    
}

var chars = Array.init(str)
var end = chars.count-1





func go() {
    
    reverse(array: &chars, start: 0, end: end)
    print(chars)
    
    var lastIndex = 0
    for index in 0...chars.count-1 {
        if chars[index] == " " || index == chars.count - 1 {
//            if index + 1 > chars.count - 1 {
//                break
//            }
            
            var swapIndex = index - 1
            if index == chars.count - 1 {
                swapIndex = index
            }
            reverse(array: &chars, start: lastIndex, end: swapIndex)
            print(lastIndex, index-1)
            lastIndex = index + 1
        }
    }
}

go()
print(chars)

