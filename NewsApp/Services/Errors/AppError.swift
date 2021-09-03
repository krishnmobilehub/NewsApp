//
//  AppError.swift
//  NewsApp
//


import Foundation

//NOTE: ADD CUSTOM APP LOCALISED ERRORS HERE

enum AppError: NWLocalisedErrors {
    case message(String)
    var errorDescription: String? {
        switch self {
        case .message(let message): return message
        }
    }
}
