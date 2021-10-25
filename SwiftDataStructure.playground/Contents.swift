func insertionSort(alist: inout [Int]) {
    for i in 1..<alist.count{
        let tmp = alist[i]
        var j = i - 1
        while j >= 0 && alist[j] > tmp {
            alist[j+1] = alist[j]
            j = j - 1
        }
        alist[j+1] = tmp
    }
}

var testCase: [Int] = [56,17,63,34,77,52,66]
insertionSort(alist: &testCase)

func mergeSort<T: Comparable>( list: inout [T] ) {
    if list.count <= 1 {
        return
    }
    func merge(`var` left:[T],`var` right:[T]) -> [T] {
        var vleft = left
        var vright = right
        var result = [T]()
        while left.count != 0 && right.count != 0 {
            if left[0] <= right[0] {
                result.append(vleft.remove(at: 0))
            } else {
                result.append(vright.remove(at: 0))
            }
        }
        while left.count != 0 {
            result.append(vleft.remove(at: 0))
        }
        while right.count != 0 {
            result.append(vright.remove(at: 0))
        }
        return result
    }
    var left = [T]()
    var right = [T]()
    let mid = list.count / 2
    for i in 0..<mid {
        left.append(list[i])
    }
    for i in mid..<list.count {
        right.append(list[i])
    }
    mergeSort(list: &left)
    mergeSort(list: &right)
    list = merge(var: left, var: right)
}
