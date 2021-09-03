//
//  Router.swift
//  NewsApp
//


import UIKit
import Alamofire

enum Router: HTTPRouter {
    
    //GET facts list
    case newsList

    var method: HttpMethod {
        switch self {
        case .newsList:
            return .get
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .newsList:
            return nil
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .newsList:
            return nil
        }
    }
    
    var encodingType: Encoding {
        switch self {
        case .newsList:
            return .json
        }
    }

}
