//
//  Swift2Scratchpad.swift
//  SwiftScratchpad
//
//  Created by Bryan Luby on 6/8/15.
//  Copyright © 2015 Bryan Luby. All rights reserved.
//

import Foundation

enum Result<T, U> {
    case Success(T)
    case Failure(U)
}

func testResult() {
    let error = NSError(domain: "MyDomain", code: 1, userInfo: nil)
    let success: Result<String, NSError> = .Success("success result")
    let fail: Result<String, NSError> = .Failure(error)
    print(success)
    print(fail)
}

func throwIt() throws {
    print("it works")
}

func testThrowIt() {
    do {
        try throwIt()
    } catch {
        print(error)
    }
}
