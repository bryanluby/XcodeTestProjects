//
//  CurryAndUncurry.swift
//  SwiftScratchpad
//
//  Created by Bryan Luby on 3/17/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

import Foundation

func curry<A, B, C>(f: (A, B) -> C) -> A -> B -> C {
    return { x in
        { y in
            f(x, y)
        }
    }
}

func uncurry<A, B, C>(f: A -> B -> C) -> (A, B) -> C {
    return { x, y in
        f(x)(y)
    }
}

//func uncurry<T, U, V>(f: T -> U -> V) -> (T, U) -> V {
//    return { x, y in
//        f(x)(y)
//    }
//}