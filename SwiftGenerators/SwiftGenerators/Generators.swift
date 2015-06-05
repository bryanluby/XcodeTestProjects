//
//  Generators.swift
//  SwiftGenerators
//
//  Created by Bryan Luby on 1/28/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

import Foundation

class CountdownGenerator: GeneratorType {
    typealias Element = Int

    var element: Element

    init<T>(array: [T]) {
        self.element = array.count - 1
    }

    func next() -> Element? {
        return self.element < 0 ? nil : element--
    }
}

func countDown(start: Int) -> GeneratorOf<Int> {
    var i = start
    return GeneratorOf { return i < 0 ? nil : i-- }
}

//func countDownS(start: Int) -> SequenceOf {
//    return SequenceOf { }
//}

func testGenerator() {
    let xs = [1, 2, 3, 4, 5]

    let generatorTest = CountdownGenerator(array: xs)

    while let i = generatorTest.next() {
        println("Element \(i) of the array is \(xs[i])")
    }

    println("Last...")
}

class PowerGenerator: GeneratorType {
    typealias Element = NSDecimalNumber

    var power: NSDecimalNumber = NSDecimalNumber(int: 1)
    let two = NSDecimalNumber(int: 2)

    func next() -> Element? {
        power = power.decimalNumberByMultiplyingBy(2)
        return power
    }
}

class FileLinesGenerator: GeneratorType {
    typealias Element = String

    var lines: [String]

    init(filename: String) {
        if let contents = String(contentsOfFile: filename, encoding: NSUTF8StringEncoding, error: nil) {
            let newLine = NSCharacterSet.newlineCharacterSet()
            lines = contents.componentsSeparatedByCharactersInSet(newLine)
        } else {
            lines = []
        }
    }

    func next() -> Element? {
        if let nextLine = lines.first {
            lines.removeAtIndex(0)
            return nextLine
        } else {
            return nil
        }
    }
}

func findPower(predicate: NSDecimalNumber -> Bool) -> NSDecimalNumber {
    let g = PowerGenerator()

    while let x = g.next() {
        if predicate(x) {
            return x
        }
    }

    return 0
}

struct MyStringGenerator: GeneratorType {
    typealias Element = String

    var element: Element

    init(array: [String]) {
        self.element = array[0]
    }

    mutating func next() -> Element? {
        return self.element + "Cool"
    }
}

class PersonGenerator: GeneratorType {
    typealias Element = Person
    private var people: [Person]

    init(jsonPeople: [[String: AnyObject]]) {
        self.people = []

        for dict in jsonPeople {
            if let name = dict["name"] as? String, age = dict["age"] as? Int {
                let aPerson = Person(name: name, age: age)
                self.people.append(aPerson)
            }
        }
    }

    func next() -> Element? {
        let nextPerson = people.first
        if people.count > 0 {
            people.removeAtIndex(0)
        }

        return nextPerson
    }
}

class ReverseSequence<T>: SequenceType {
    var array: [T]

    init(array: [T]) {
        self.array = array
    }

    typealias Generator = CountdownGenerator
    func generate() -> Generator {
        return CountdownGenerator(array: array)
    }
}
