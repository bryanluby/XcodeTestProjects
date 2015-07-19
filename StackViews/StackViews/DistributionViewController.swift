//
//  DistributionViewController.swift
//  StackViews
//
//  Created by Bryan Luby on 7/19/15.
//  Copyright © 2015 Bryan Luby. All rights reserved.
//

import UIKit

class DistributionViewController: UIViewController {
    @IBOutlet private weak var stackView: UIStackView!
    
    @IBAction private func segmentedControlChanged(sender: UISegmentedControl) {
        guard let distribution = UIStackViewDistribution(rawValue: sender.selectedSegmentIndex) else { return }
        
        UIView.animateWithDuration(0.5) {
            self.stackView.distribution = distribution
        }
    }
}
