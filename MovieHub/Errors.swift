//
//  Errors.swift
//  MovieHub
//
//  Created by Aditya Varshney on 13/02/26.
//

import Foundation


enum APIConfigError: Error, LocalizedError { //locallizederror gives better error url
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error) //underlyingError gives the exact system error
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "File not found"
        case .dataLoadingFailed(underlyingError: let error):
            return "Data loading failed with error: \(error.localizedDescription)"
        case .decodingFailed(underlyingError: let error):
            return "Decoding failed with error: \(error.localizedDescription)"
        }
    }
}
