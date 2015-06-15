//
//  ViewController.swift
//  GeneratorOfTest
//
//  Created by Bryan Luby on 5/22/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var item = 0

    @IBAction func buttonPressed() {
        incrementGen()
    }

    func incrementGen() {
        let genOf = anyGenerator { self.item++ }
        print(genOf.next())
    }
}
