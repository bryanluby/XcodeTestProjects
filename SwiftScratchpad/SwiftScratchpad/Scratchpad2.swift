//
//  Scratchpad2.swift
//  SwiftScratchpad
//
//  Created by Bryan Luby on 2/15/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

import Foundation

typealias StringFilter = String -> String

func uppercaseFilter(aString: String) -> StringFilter {
    return { str in str.uppercaseString }
}

func otherFilter(aString: String) -> StringFilter {
    return { str in str.lastPathComponent }
}

infix operator |> { associativity left }

func |> (filter1: StringFilter, filter2: StringFilter) -> StringFilter {
    return { str in filter1(filter2(str))  }
}

func doStuff() {
    let test = uppercaseFilter("test") |> otherFilter("cool")
}

func |> <A, B, C>(f1: B -> C, f2: A -> B) -> A -> C {
    return { x in f1(f2(x)) }
}

// A: String
// B: Int
// C: Float

func myF1(x: Int) -> Float {
    return 1.1
}

func myF2(x: String) -> Int {
    return Int(x)!
}

extension Array {
    var decompose : (head: T, tail: [T])? {
        return (count > 0) ? (self[0], Array(self[1..<count])) : nil
    }
}

func myZip<A, B>(a: [A], b: [B]) -> [(A, B)] {
    if let (x, xs) = a.decompose, (y, ys) = b.decompose {
        return [(x, y)] + myZip(xs, b: ys)
    } else {
        return []
    }
}

func myZipWith<A, B, C>(f: (a: A, b: B) -> C, a: [A], b: [B]) -> [C] {
    if let (x, xs) = a.decompose, (y, ys) = b.decompose {
        return [f(a: x, b: y)] + myZipWith(f, a: xs, b: ys)
    } else {
        return []
    }
}

func myZipWith2<A, B, C>(aS: [A], bs: [B], f: (a: A, b: B) -> C) -> [C] {
    if let (x, xs) = aS.decompose, (y, ys) = bs.decompose {
        return [f(a: x, b: y)] + myZipWith2(xs, bs: ys, f: f)
    } else {
        return []
    }
}

func qsort(var array: [Int]) -> [Int] {
    if array.isEmpty { return [] }
    let pivot = array.removeAtIndex(0)
    let lesser = array.filter { $0 < pivot }
    let greater = array.filter { $0 >= pivot }
    return qsort(lesser) + [pivot] + qsort(greater)
}
