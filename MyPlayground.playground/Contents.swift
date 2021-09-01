import UIKit

// let, var

// nil \()

let names = ["kim", "yang", "lee"]
let count = names.count
for i in 0..<count {
//    print("person name is \(names[i])" )
}

for name in names[1...] { // 배열의 인덱스 부터 ~ 까지
    print(name)
}

for name in names[...2] {
    print(name)
}

let range = ...5

print(range)

let text = """
            이것은 매우 긴 텍스트 입니다!
           """
print(text)


// collection

var someInts = [Int]()
print(someInts.count)

var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var arr = threeDoubles + anotherThreeDoubles
print(arr)

var shoppingList: [String] = ["Eggs", "Milk"]
var shoppingList2 = ["Eggs", "Milk"]

shoppingList.append("Four")

shoppingList.insert("Maple Syrup", at:0)

print(shoppingList)

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop", "Rock"]

print(favoriteGenres)

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let test = printAndCount(string: string)
    print(test)
}
printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

// closure 콜백 같음

let names2 = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// {} 안에 리턴 넣고, $0로 인자 표현 가능
var reversedNames = names.sorted { $0 > $1 }

struct BasicInfo {
    var firstInfo = 1
    var secondInfo = 2
}

var infoInfo = BasicInfo()

print(infoInfo.firstInfo)

class BasicClass {
    var name = "kim"
    var age = 27
    
    deinit {
        print("클래스 뿅!")
    }
}

var thisIsClass: BasicClass? = BasicClass()

thisIsClass = nil
print(thisIsClass)




