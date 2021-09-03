//
//  NWListItemViewModel.swift
//  NewsApp
//


import Foundation

class NWListItemViewModel {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    init(dict: [String: Any]) {
        if let source = dict["source"] as? [String:Any] {
            self.source = Source.init(source: source)
        }
        author = dict["author"] as? String
        title = dict["title"] as? String
        description = dict["description"] as? String
        url = dict["url"] as? String
        urlToImage = dict["urlToImage"] as? String
        publishedAt = dict["publishedAt"] as? String
        if let date = publishedAt?.components(separatedBy: "T").first {
            publishedAt = date
        }
        content = dict["content"] as? String
    }
}

struct Source {
    
    var id: String?
    var name: String?
    
    init(source:[String:Any]) {
        id = source["id"] as? String
        name = source["name"] as? String
    }

}

