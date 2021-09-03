//
//  Constants.swift
//  NewsApp
//


import Foundation
import UIKit

//MARK: - General Constant
let appName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let apiKey = "6c828b4157cc4960a0d769a1261feaba" //API Key from registered account at https://newsapi.org/

//Initial key word for search news
var searchQuery = "bitcoin"

//MARK: - TableViewCell Identifiers
struct TblCellIdentifier {
    static let listViewCell = "NWListTableViewCell"
    static let detailImageCell = "NWDetailmageTableViewCell"
    static let detailTagCell = "NWDetailTagTableViewCell"
    static let detailHeaderCell = "NWDetailHeaderTableViewCell"
    static let detailDescriptionCell = "NWDetailDescriptionTableViewCell"
}

//MARK: - Alert Messages
enum AlertMessage: String {
    case noInterNet
    var errorDescription: String? {
        switch self {
        case .noInterNet: return "Please check your connection, and retry again."
        }
    }
}

//MARK: - Set Notification Observers
extension Notification.Name {
    //This observer is used for monitoring internet connection changes
    static let networkStatusChange = Notification.Name("__networkStatusChangeNotification")
}
