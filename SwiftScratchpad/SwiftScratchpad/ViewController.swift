//
//  ViewController.swift
//  SwiftScratchpad
//
//  Created by Bryan Luby on 2/1/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var label: UILabel!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .redColor()

//        let backgroundBlock: () -> () = {
//            for i in 0...50000000 {
//            }
//        }
//
//        let mainBlock: () -> () = {
//            self.label.text = "Finished"
//            self.activityIndicator.stopAnimating()
//        }
//
//        self.label.text = "Started"
//        activityIndicator.startAnimating()
//
//        callOnBackgroundQueue {
//            callOnMainQueue {
//            }
//        }

    }

}

