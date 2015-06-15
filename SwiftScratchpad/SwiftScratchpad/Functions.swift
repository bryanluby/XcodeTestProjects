//
//  Functions.swift
//  SwiftScratchpad
//
//  Created by Bryan Luby on 2/22/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

import Foundation

func callOnBackgroundQueue(f: () -> Void) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { f() }
}

func callOnMainQueue(f: () -> Void) {
    dispatch_async(dispatch_get_main_queue()) { f() }
}
