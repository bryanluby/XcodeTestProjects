//
//  EnumDataSourceVC.swift
//  SwiftScratchpad
//
//  Created by Bryan Luby on 2/23/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

import UIKit

class EnumDataSourceVC: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    let strings = Array(count: 20, repeatedValue: "Hello")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var dataSource = DataSource(sections: .First)

    }

}

extension EnumDataSourceVC: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count


    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = strings[indexPath.row]
        return cell
    }
}

struct DataSource {
    let sections: Sections

    enum Sections {
        case First
        case Second
    }

    enum Rows {
        case First(Row)
        case Second(Row)
        case Third(Row)
        
        struct Row {
            let content: String
        }
    }
}
