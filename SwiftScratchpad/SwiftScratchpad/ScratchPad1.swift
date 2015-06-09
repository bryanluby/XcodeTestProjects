//
//  ScratchPad1.swift
//  SwiftScratchpad
//
//  Created by Bryan Luby on 2/2/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

import Foundation

let numName = "Two"

let numValue: Int = {
    switch numName {
        case "Two": return 2
        case "Three": return 3
        default: return 1
    }
}()

let ssss: NSString = "Hello"
let aaa = ssss.dynamicType.description()
let abbbbb = ssss.self.description
let abbb = NSString.self.description()
let evalll = (1 + 1).self

func strideTest() {
    let nums3 = [1,2,3,4,5,6,7,8,9,10]
    
    for i in stride(from: nums3[0], through: nums3[9], by: 1) {
        print(i)
    }
}

func patternMatchOperator() {
    let someInt = 4
    
    switch someInt {
    case let (anInt) where 1...5 ~= anInt: print(anInt) // the "~=" operator means "where 'range' contains 'value'"
    case (10...20): print("cool")
    default: break
    }
    
    if 2...7 ~= someInt {
        print("Within range")
    }
    
    if "a" ... "h" ~= "b" {
        print("within string")
    }

    switch ("hello", "world", "cool") {
    case let (title, href, other) where title == "hello" && href == "cool": break
    default: break
    }
}

func switchFun() {
    let somePoint = (1, 2)
    
    pointSwitcher: switch somePoint {
    case (let x, var y):
        print("")
        y = 25
        print(y)
    case let (x, y): break
    }
    
    somePoint
    
    let myArray1 = [1, 2, 3, 4, 5]
    let myArray2 = [6, 7, 8, 9, 10]
    
    intLoop: for someInt in myArray1 {
        nestedIntLoop: for anotherInt in myArray2 {
            if anotherInt < 9 {
                testSwitch: switch anotherInt + 10 {
                case 33: break testSwitch
                case 25:
                    innerSwitch: switch 1 + anotherInt {
                    case 5: break testSwitch
                    default: break innerSwitch
                    }
                default: break testSwitch
                }
                continue nestedIntLoop
            } else {
                break intLoop
            }
        }
    }
}


// Extension protocol declaration
protocol MyDumbProtol {
    func doStuff()
}
protocol MyOtherDumbProtocol {
    func doSomeMoreStuff()
}
struct HelloStruct {
    func doStuff() {
        //
    }
    
    func doSomeMoreStuff() {
        //
    }
}
extension HelloStruct: MyDumbProtol, MyOtherDumbProtocol {}

func arrayFun() {
    let someArray = [1, 3, 5, 4, 6, 34, 55, 87, 0, 3, 8]
    
    func doStuff<T>(someArray: [T]) {
        for (index, element) in someArray.enumerate() {
            print("\(index) \(element)")
        }
    }
    
    let aosntuh = ["cool", "wow", "neat"]
    
    doStuff(aosntuh)
    
    func calc(num: Int) -> (result1: Bool, errorCode1: Int?) {
        var errorCode :Int?
        var result: Bool = true
        if (num > 100) {
            result = false
            errorCode = 404
        }
        return (result, errorCode)
    }
    
    let res = calc(3)
    let res2 = calc(400)
    
    for (idx, element) in someArray.enumerate() {
        print("hello: \(idx) \(element)")
    }

}

extension String {
    func wrapWithTag(tag: String) -> String {
        return "<\(tag)>\(self)</\(tag)>"
    }
}

// typealias for tuple
typealias ServerResponse = (responseCode: Int, payload: String)

func helloServer() {
    let hello: ServerResponse = (responseCode: 3, payload: "wow")
}

func comparisons() {
    class PersonClass {
        let name: String
        let age: Int

        init(name: String, age: Int) {
            self.name = name
            self.age = age
        }
    }

    struct Person {
        let name: String
        let age: Int
    }

    let person1 = Person(name: "Mary", age: 25)
    let person2 = Person(name: "Mary", age: 25)

    let array1 = [1, 2, 3, 4]
    let array2 = [1, 2, 3, 4]

    let nsarray1 = NSArray(array: [1, 2, 3])
    let nsarray2 = NSArray(array: [1, 2, 3])

    let classPerson1 = PersonClass(name: "Mary", age: 25)
    let classPerson2 = PersonClass(name: "Mary", age: 25)

    let objid1 = ObjectIdentifier(classPerson1)
    print("id1 \(objid1.hashValue)")
    let objid2 = ObjectIdentifier(classPerson2)
    print("id2 \(objid2.hashValue)")
    if objid1 == objid2 {
        print("equal ids")
    } else {
        print("not equal ids")
    }
}

func chains() {
    let array = [1, 2, 3, 4, 5]
    let array2 = array.map { $0 }
    .filter { $0 > 3 }
        .map { $0 + 2 }
        .map { $0 + 3 }
//    .reduce(0) { return $0 + $1 }
}

func reduceBool() {
    let someBools = [
        true,
        true,
        true,
        true,
    ]
    
    let falseBools = [
        false,
        false,
        false,
    ]
    
    let allTrue = someBools.reduce(true) { $0 && $1 }
    let anyFalse = someBools.reduce(false) { $0 || $1 == false }
    
    let anyFalse2 = someBools.reduce(false) { accum, bool2 in
        return accum || !bool2
    }
    
    let allFalse = falseBools.reduce(false) { $0 == false && $1 == false }
    
    print("alltrue: \(allTrue)")
    print("anyFalse: \(anyFalse2)")
    print("allFalse: \(allFalse)")
}

func reduceStrings() {
    let someStrings = [
        "Hi",
        "how",
        "are",
        "you?",
    ]
    
    let fttt = someStrings.reduce("", combine: +)

//    let flattenedString2 = someStrings.reduce("", combine: {$0 + " " + $1})
//    let flattenedString2 = someStrings.reduce("", combine: {$0 + " " + $1})
//    println(flattenedString2)
}

func mapFilterReduceProperties() {
    struct Something { let name: String }
    
    let firstInstance = Something(name: "hello")
    let secondInstance = Something(name: "goodbye")
    let thirdInstance = Something(name: "wowo")
    let fourthInstace = Something(name: "world")
    
    let instances = [
        firstInstance,
        secondInstance,
        thirdInstance,
        fourthInstace,
    ]
    
    // We want to get the string "hello world" out of the array of struct instances.
    let names = instances.map { $0.name }
        .filter { $0 == "hello" || $0 == "world" }
//        .reduce("") { $0 + " " + $1 }
//    println(names)
    
    let names2 = instances.reduce("") { $0 + $1.name + " " }
//    println(names2)
    
    let names3 = instances.reduce("") { $1.name == "hello" || $1.name == "world" ? $0 + " " + $1.name : $0 }
    print(names3)
    
    let names4: Something = instances.reduce(Something(name: "awesome")) { $1.name == "hello" ? $1 : $0 }
}

func strider() {
    let array = [1, 2, 3, 4, 5]
    
    let strided = stride(from: 0, to: 4, by: 2)
    print(strided)
}

func flattenArrayOfArrays() {
    let array1 = [1, 3, 3, 5]
    let array2 = [2, 3, 4]
    let array3 = [3, 5, 4]
    
    let arrayOfArrays = [array1, array2, array3]
    
//    let flattened = arrayOfArrays.reduce([], +)
//    println(flattened)
}

func reduceGetMinMax() {
    let arrayOfInts = [1, 3, 3, 5]
    
    let minInt = arrayOfInts.reduce(arrayOfInts.first, combine: { $0 < $1 ? $0 : $1 })
    
//    println("minInt: \(minInt)")
    
    let maxInt = arrayOfInts.reduce(arrayOfInts.first, combine: { $0 > $1 ? $0 : $1 })
    print("maxInt: \(maxInt)")
    
    let minEle = arrayOfInts.minElement()!
    print("minElement: \(minEle)")
    
    let maxEle = arrayOfInts.maxElement()!
    print("maxElement: \(maxEle)")
}

func convertToMap() -> [Int] {
//    var someEmptyArray: [Int] = []
    
    let intArray = [1, 3, 3, 5]
    
//    for someInt in intArray {
//        let squared = someInt * someInt
//        someEmptyArray.append(squared)
//    }
    
//    return someEmptyArray
    
    return intArray.map { $0 * $0 }
}

func reduceToURL() {
    let urlArray = ["http://", "www.apple.com", "/iphone"]
//    let url = NSURL(string: urlArray.reduce("", +))
    let url2 = NSURL(string: "".join(urlArray))
}

func testingClosures() {
    func testFunc(num1: Int, num2: Int) -> Bool {
        return num1 < num2
    }
    
    var array2 = [1, 25, 5, 2]
    
    array2.sortInPlace { testFunc($0, num2: $1) }
    print(array2)
    
    
    func squarer(num: Int) -> Int {
        return num * num
    }
    
    func filterer(num: Int) -> Bool {
        return num > 3
    }
    
//    let sumOfSquares = array2.map { squarer($0) }.reduce(0, +)
//    let sumOfSquares2 = array2.map(squarer).filter(filterer).reduce(0, +)
//    let sumOfSqueres3 = array2.map(squarer).reduce(1, *)
//    println(sumOfSquares)
    
    let squares2 = array2.map { $0.description }
    print(squares2)
}

func closureConstants() {
    // Closures are reference types
    // a constant or var to a closure or function is actually a reference
    
    let exclamation = "!"
    let someClosure: String -> String = { $0 + "World" + exclamation }
    
    let anotherClosure = someClosure
    print(someClosure("Hello "))
}

func closureShorthand() {
    var someStrings = [
        "hi",
        "how",
        "are",
        "boy",
        "you?",
    ]

    func sortHelper(s1: String, s2: String) -> Bool {
        return s1 < s2
    }
    
    someStrings.sortInPlace(sortHelper)
    
    someStrings.sortInPlace(>)
    print(someStrings)
}

func variableParamsWithinClosure() {

    let nums = [1, 25, 5, 2]
    
    let newNums = nums.map { (var num) -> String in
        num++
        return "the number is \(num)"
    }

    print(newNums)
}

func setValueOfSomethingFromSwitch() {
    enum TestEnum { case First, Second, Third }
    let someCase = TestEnum.First
    
    let test: String = {
        switch someCase {
            case .First: return "It's the first"
            case .Second: return "It's the second"
            case .Third: return "It's the third"
        }
    }()
    
    var test2: String = {
        switch someCase {
        case .First: return "Wow"
        default: return "Cool"
        }
    }()
    
    test2 = "heh"
    
    var test3: String {
        switch someCase {
            case .First: return "First"
            case .Second: return "Awesome"
            case .Third: return "wow"
        }
    }
}

func structAsAWayToDefineConstants() {
    struct CoolStruct {
        static let Constant1 = "Hello"
        static let Constant2 = "Wow"
        static let Constant3 = 1
    }
    
    let someConstant = CoolStruct.Constant1
    let someOtherConstant = CoolStruct.Constant2
    
    struct SegueIdentifiers {
        static let FirstViewController = "Segue 1"
    }
    
    let someSegueID = SegueIdentifiers.FirstViewController
    
    struct CellIdentifiers {
        static let CoolCell = "CoolCellIdentifier"
    }
    
    let someCellId = CellIdentifiers.CoolCell
}

func enumAsAWayToDefineConstants() {
    enum CoolEnum: String {
        case Constant1 = "Hello"
        case Constant2 = "Wow"
        // Can't use nums like we can in structs!
    }
    
    let someConstant = CoolEnum.Constant1.rawValue
    let someOtherConstant = CoolEnum.Constant2.rawValue
}

func finalClass() {
    final class MyClass {
        
    }
}

func testAs() {
    let x = 3
    
    func testFloat(aFloat: AnyObject) {
        
    }
    
    testFloat(x as AnyObject)
}

func testOptionalChain() {
    let aDict: [String: AnyObject] = [:]
    
//    if var something = aDict["test"] as? String {
//
//    }
}
