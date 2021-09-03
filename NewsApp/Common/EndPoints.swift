//
//  EndPoints.swift
//  NewsApp
//


import Foundation

//API's Endpoint for using with BaseUrl
struct Endpoints {
    private struct Routes {
        static let NewsApi = "everything?q=&from=2021-08-31&sortBy=publishedAt&apiKey="
    }
    //MARK: ProofOfConcept API
    static var NewsApi: String {
        return Routes.NewsApi + apiKey
    }
}
