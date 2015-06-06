//
//  Constants.swift
//

import Foundation

// MARK: - TableView Cell Identifiers

let BlueCellIdentifier = "BlueCellIdentifier"
let LargeCellIdentifier = "LargeCellIdentifier"
let DetailViewTableViewControllerCellIdentifier = "DetailViewTableViewControllerCellIdentifier"
let MasterViewControllerCellIdentifier = "MasterViewControllerCellIdentifier"

// MARK: - Font Sizes

let DefaultFontSize = 14

// MARK: - Segue Identifiers

let SegueToMasterViewController = "SegueToMasterViewController"
let SegueToDetailViewController = "SegueToDetailViewController"

enum CellIdentifiers: String {
    case Blue = "Blue"
    case Large = "Large"
}

enum FontSizes: Int {
    case Large = 14
    case Small = 10
}

enum AnimationDurations: NSTimeInterval {
    case Fast = 1.0
    case Medium = 3.0
    case Slow = 5.0
}

enum Emojis: Character {
    case Happy = "😄"
    case Sad = "😢"
}

enum SegueIdentifiers: String {
    case Master = "MasterViewController"
    case Detail = "DetailViewController"
}

func tester() {
    let happyEmoji = Emojis.Happy.rawValue
    let happyEmoji2 = Constants.Emojis.Happy
}

struct CellIdentifiers2 {
    static let Blue = "Blue"
    static let Large = "Large"
}

struct FontSizes2 {
    static let Large = 14
    static let Small = 10
}

struct AnimationDurations2 {
    static let Fast: NSTimeInterval = 1.0
    static let Slow: NSTimeInterval = 5.0
}

struct Emojis2 {
    static let Happy = "😄"
    static let Sad = "😢"
}

struct SegueIdentifiers2 {
    static let Master = "MasterViewController"
    static let Detail = "DetailViewController"
}

struct Constants {
    struct CellIdentifiers {
        static let Blue = "Blue"
        static let Large = "Large"
    }
    
    struct FontSizes {
        static let Large = 14
        static let Small = 10
    }
    
    struct AnimationDurations {
        static let Fast: NSTimeInterval = 1.0
        static let Slow: NSTimeInterval = 5.0
    }
    
    struct Emojis {
        static let Happy = "😄"
        static let Sad = "😢"
    }
    
    struct SegueIdentifiers {
        static let Master = "MasterViewController"
        static let Detail = "DetailViewController"
    }
}
