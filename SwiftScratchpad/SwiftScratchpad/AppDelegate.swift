//
//  AppDelegate.swift
//  SwiftScratchpad
//
//  Created by Bryan Luby on 2/1/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        zipTester()
        testFunc()
        testQueue()
        return true
    }
    
    func zipTester() {
        let xs = [1, 2, 3]
        let ys = [4, 5, 6]
        let zipped = Array(zip(xs, ys))
        println("zipped: \(zipped)") // zipped: [(1, 4), (2, 5), (3, 6)]
    }
    
    func zipTester2() {
        var xs = [1, 2, 3]
        var ys = [4, 5, 6]
        var zipped = myZip(xs, ys)
        
        println("zipped: \(zipped)")
        
        ys = []
        zipped = myZip(xs, ys)
        println("zipped: \(zipped)")
        
        xs = []
        ys = [4, 5, 6]
        zipped = myZip(xs, ys)
        println("zipped: \(zipped)")
        
        xs = []
        ys = []
        zipped = myZip(xs, ys)
        println("zipped: \(zipped)")
        
        xs = [1, 2, 3]
        ys = [4, 5, 6]
        var zippedWith = myZipWith(+, xs, ys)
        println("zippedWith: \(zippedWith)")
        
        xs = []
        ys = [4, 5, 6]
        zippedWith = myZipWith(+, xs, ys)
        println("zippedWith: \(zippedWith)")
        
        xs = [1, 2, 3]
        ys = []
        zippedWith = myZipWith(+, xs, ys)
        println("zippedWith: \(zippedWith)")
        
        let xs2 = ["Mary", "John", "Jenny"]
        let ys2 = ["Jane", "Smith", "Jones"]
        let f = { $0 + " " + $1 }
        let zippedWith2 = myZipWith(f, xs2, ys2)
        println("zippedWith: \(zippedWith2)")
        
        let xs3 = [1, 2, 3]
        let ys3 = [4, 5, 6]
        let zippedWith3 = myZipWith2(xs3, ys3, +)
        println("zippedWith3: \(zippedWith3)")
        
        let xs4 = ["Mary", "John", "Jenny"]
        let ys4 = ["Jane", "Smith", "Jones"]
        let zippedWith4 = myZipWith2(xs2, ys2) { $0 + " " + $1 }
        println("zippedWith4: \(zippedWith4)")
    }

    func testFunc() {
        let xs = ["Mary", "John", "Jane"]
        let ys = ["White", "Smith", "Doe"]
        let zippedWith = myZipWith2(xs, ys) { $0 + " " + $1 }
        println("zippedWith: \(zippedWith)")
    }

    func testQueue() {
        callOnBackgroundQueue {
            println(NSThread.currentThread())
            callOnMainQueue {
                println(NSThread.currentThread())
            }
        }
    }
    
}
