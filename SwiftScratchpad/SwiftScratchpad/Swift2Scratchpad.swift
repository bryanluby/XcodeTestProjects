//
//  Swift2Scratchpad.swift
//  SwiftScratchpad
//
//  Created by Bryan Luby on 6/8/15.
//  Copyright © 2015 Bryan Luby. All rights reserved.
//

import Foundation

enum Result<T> {
    case Success(T)
    case Failure(NSError)
}

func testResult() {
    let successResult: Result = .Success("hello")
    print(successResult)

    let anError = NSError(
        domain: NSCocoaErrorDomain,
        code: 999, userInfo: nil
    )

    let failureResult: Result = .Failure(anError)
}
