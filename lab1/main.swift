//
//  main.swift
//  lab1
//
//  Created by sergey.dubina on 15.03.2022.
//

import Foundation

enum CustomErrors: Error {
    case numberOutOfRange
    case cantParseToInt
    case cantParseToFloat
    case wrongFlagValue
}

// FISRT TASK
func firstTask() {
    print("FISRT TASK")
    let firstNum = readInt();
    let secondNum = readInt();
    
    print(firstNum + secondNum)
}

func readInt() -> Int {
    print("Enter number:")
    let input: String = readLine() ?? "";
    let resInt = Int(input) ?? 0;
    
    return (resInt > -1000000 && resInt < 1000000) ? resInt: 0;
}

//SECOND TASK
func secondTask() throws {
    print("SECOND TASK")
    print("Enter number:")
    guard let num: Int = Int(readLine() ?? "") else {
        throw CustomErrors.cantParseToInt
    }
    if (num < 0 || num > 9) {
        throw CustomErrors.numberOutOfRange
    }
    
    let strings = ["ноль", "один", "два", "три", "четыре", "пять", "шесть", "семь", "восемь", "девять"];
    print(strings[num])
}

//THIRD TASK
func thirdTask() throws {
    print("THIRD TASK")
    print("Enter number:")
    guard let num = Int(readLine() ?? "") else {
        throw CustomErrors.cantParseToInt
    }
    if (num < 1 || num > 92) {
        throw CustomErrors.numberOutOfRange
    }
    var prev = 0;
    var cur = 1;
    print(prev);
    if (num == 1) {
        return
    }
    print(cur);
    for _ in 0..<num-2 {
        cur += prev;
        prev = cur - prev;
        print(cur);
    }
}

//FOURTH TASK
func readFloat() throws -> Float {
    print("Enter float number:")
    guard let num = Float(readLine() ?? "") else {
        throw CustomErrors.cantParseToFloat
    }
    if (num < -1000000 || num > 1000000) {
        throw CustomErrors.numberOutOfRange
    }
    return num;
}

func fourthTask() throws {
    print("FOURTH TASK")
    let a = try readFloat();
    let b = try readFloat();
    let c = try readFloat();
    
    print(a + b >= c ? (a + b == c ? "=" : ">") : "<")
}

//FIFTH TASK
func fifthTask() throws {
    print("FIFTH TASK")
    print("Enter transformation flag:")
    let flag: String = readLine() ?? "";
    if (flag != "u" && flag != "I") {
        throw CustomErrors.wrongFlagValue;
    }
    print("Enter string:")
    let str: String = readLine() ?? "";
    
    print(flag == "u" ? str.localizedUppercase: str.localizedLowercase);
}

//SIXTH TASK
func sixthTask() throws {
    print("SIXTH TASK")
    print("Enter n:")
    guard let n = Int(readLine() ?? "") else {
        throw CustomErrors.cantParseToInt
    }
    if (n < 0 || n > 1000) {
        throw CustomErrors.numberOutOfRange
    }
    var numbers = [Int]()
    print("Enter \(n) numbers:")
    for _ in 0..<n {
        guard let number = Int(readLine() ?? "") else {
            throw CustomErrors.cantParseToInt
        }
        if (number < -1000000 || number > 1000000) {
            throw CustomErrors.numberOutOfRange
        }
        numbers.append(number)
    }
    numbers.reversed().forEach {
        el in print(el)
    }
}

//SEVENTH TASK
func seventhTask() throws {
    print("SEVENTH TASK")
    var present = Set<String>()
    var all = Set<String>()

    print("Enter n:")
    guard let n = Int(readLine() ?? "") else {
        throw CustomErrors.cantParseToInt
    }
    if (n < 0 || n > 1000) {
        throw CustomErrors.numberOutOfRange
    }
    print("Enter present students:")
    for _ in 0..<n {
        let student = readLine() ?? ""
        present.insert(student)
    }

    print("Enter m:")
    guard let m = Int(readLine() ?? "") else {
        throw CustomErrors.cantParseToInt
    }
    if (m < 0 || m > 1000) {
        throw CustomErrors.numberOutOfRange
    }
    print("Enter all students:")
    for _ in 0..<m {
        let student = readLine()!
        all.insert(student)
    }
    all.subtracting(present).forEach{el in print(el)}
}

//EIGHTH TASK
func eighthTask() throws {
    print("EIGHTH TASK")
    var phoneBook = [String : String]()

    print("Enter n:")
    guard let n = Int(readLine() ?? "") else {
        throw CustomErrors.cantParseToInt
    }
    if (n < 0 || n > 1000) {
        throw CustomErrors.numberOutOfRange
    }
    print("Enter contacts:")
    for _ in 0..<n {
        let name = readLine() ?? ""
        let number = readLine() ?? ""
        phoneBook[name] = number
    }
    for (name, number) in phoneBook {
        print(name)
        print(number)
    }
}

//NINETH TASK
func ninethTask() throws {
    print("NINETH TASK")
    print("Enter n:")
    guard let n = Int(readLine() ?? "") else {
        throw CustomErrors.cantParseToInt
    }
    if (n < 0 || n > 1000) {
        throw CustomErrors.numberOutOfRange
    }
    var arr = [Int]()

    print("Fill array with numbers:")
    for _ in 0..<n {
        guard let num = Int(readLine() ?? "") else {
            throw CustomErrors.cantParseToInt
        }
        if (num < -1000000 || num > 1000000) {
            throw CustomErrors.numberOutOfRange
        }
        arr.append(num)
    }
    
    mergeSort(arr).forEach{el in print(el)}
    arr.forEach{el in print(el)}
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
  var leftIndex = 0
  var rightIndex = 0

  var orderedArray: [Int] = []
  
  while leftIndex < left.count && rightIndex < right.count {
    let leftElement = left[leftIndex]
    let rightElement = right[rightIndex]

    if leftElement < rightElement {
      orderedArray.append(leftElement)
      leftIndex += 1
    } else if leftElement > rightElement {
      orderedArray.append(rightElement)
      rightIndex += 1
    } else {
      orderedArray.append(leftElement)
      leftIndex += 1
      orderedArray.append(rightElement)
      rightIndex += 1
    }
  }

  while leftIndex < left.count {
    orderedArray.append(left[leftIndex])
    leftIndex += 1
  }

  while rightIndex < right.count {
    orderedArray.append(right[rightIndex])
    rightIndex += 1
  }
  
  return orderedArray
}

func mergeSort(_ array: [Int]) -> [Int] {
  guard array.count > 1 else { return array }

  let middleIndex = array.count / 2
  
  let leftArray = mergeSort(Array(array[0..<middleIndex]))
  let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
  
  return merge(leftArray, rightArray)
}


//TEST
firstTask()
do {
    try secondTask()
    try thirdTask()
    try fourthTask()
    try fifthTask()
    try sixthTask()
    try seventhTask()
    try eighthTask()
    try ninethTask()
} catch CustomErrors.cantParseToInt {
    print("Cant parse entered value to integer")
} catch CustomErrors.numberOutOfRange {
    print("Entered value is out of range")
} catch CustomErrors.wrongFlagValue {
    print("Entered flag is wrong")
} catch CustomErrors.cantParseToFloat {
    print("Cant parse entered value to float")
}
