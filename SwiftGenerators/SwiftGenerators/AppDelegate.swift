//
//  AppDelegate.swift
//  SwiftGenerators
//
//  Created by Bryan Luby on 1/28/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        testGenerator()

//        println(findPower { $0.integerValue > 1000 })h

//        let fileGenerator = FileLinesGenerator(filename: "/Users/bryanluby/Downloads/request.txt")
//
//        while let i = fileGenerator.next() {
//            println(i)
//        }


        let personGenerator = PersonGenerator(jsonPeople: jsonPeople)

        while let aPerson = personGenerator.next() {
            println(aPerson.name)
            println(aPerson.age)
        }

        let evens = [1, 2, 3, 4, 5].filter { $0 % 2 == 0 }
        let evens2 = filter([1, 2, 3, 4, 5]) { $0 % 2 == 0 }

        return true
    }

}

let jsonPeople: [[String: AnyObject]] = [
    ["name": "Mary", "age": 28],
    ["name": "John", "age": 34],
    ["name": "Judy", "age": 52],
]
