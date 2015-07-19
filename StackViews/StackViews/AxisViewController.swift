//
//  AxisViewController.swift
//  StackViews
//
//  Created by Bryan Luby on 7/19/15.
//  Copyright © 2015 Bryan Luby. All rights reserved.
//

import UIKit

class AxisViewController: UIViewController {
    @IBOutlet private weak var stackView: UIStackView!
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        UIView.animateWithDuration(1.0) {
            self.stackView.axis = self.traitCollection.verticalSizeClass == .Compact ? .Horizontal : .Vertical
        }
    }
}
