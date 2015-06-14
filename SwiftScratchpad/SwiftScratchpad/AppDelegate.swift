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
        zipTester()
        testFunc()
        testQueue()
        testThrowIt()
        testResult()

        return true
    }
}
