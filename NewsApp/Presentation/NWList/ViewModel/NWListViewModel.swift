//
//  NWListViewModel.swift
//  NewsApp
//


import Foundation


public class NWListViewModel {
    
    let items: Observable<[NWListItemViewModel]> = Observable([])
    
    func loadNewsList(withLoader show: Bool, completion: @escaping (Bool,String?) -> ()) {
        if show {
            LoadingView.show()
        }
        let request = Router.newsList
        NetworkManager.makeRequest(request) { (result) in
            switch result {
            case .success(let value):
                guard let data = value as? [String:Any] else {
                    return
                }
                self.makeNewsList(with: data)
                completion(true, nil)
            case .failure(let error):
                completion(false, error.localizedDescription)
            }
            LoadingView.hide()
        }
    }
    
    func makeNewsList(with data: [String:Any]) {
        guard let articles = data["articles"] as? [[String: Any]] else {
            return
        }
        self.items.value = articles.map{NWListItemViewModel(dict: $0)}
    }
    
}
