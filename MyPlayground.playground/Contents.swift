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
