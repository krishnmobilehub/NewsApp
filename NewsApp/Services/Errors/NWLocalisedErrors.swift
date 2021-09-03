//
//  EndPoints.swift
//  NewsApp
//


import Foundation

protocol NWLocalisedErrors: LocalizedError {
    var title: String { get }
    var localDescription: String { get } //useful in local parsing errors during debugging as their errorDescription would show generic message in the popup
}

extension NWLocalisedErrors {
    var title: String {
        return ""
    }
    var localDescription : String {
        return ""
    }
}


