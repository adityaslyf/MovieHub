//
//  ViewModel.swift
//  MovieHub
//
//  Created by Aditya Varshney on 14/02/26.
//

import Foundation

@Observable //notify the ui of any data changes automatically

class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    
    private(set) var homeStatus: FetchStatus = .notStarted //private so only viewmodel can update the value not other components
    
    private let dataFetcher = DataFetcher()
    var trendingMovies: [Title] = []
    
    func getTitles() async {
        homeStatus = .fetching
        
        do{
            trendingMovies = try await dataFetcher.fetchTitles(for: "movie")
            homeStatus = .success
        }catch {
            print(error)
            homeStatus = .failed(underlyingError: error)
        }
    }
}
