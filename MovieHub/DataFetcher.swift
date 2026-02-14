//
//  DataFetcher.swift
//  MovieHub
//
//  Created by Aditya Varshney on 13/02/26.
//

import Foundation


struct DataFetcher {
    
    
    let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
    let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey
    
    
    func fetchTitles( for media:String) async throws -> [Title] {
        guard let baseURL = tmdbBaseURL else {
            throw NetworkError.missingconfig
        }
        
        guard let apiKey = tmdbAPIKey else {
            throw NetworkError.missingconfig
        }
        
        guard let fetchTitlesURL = URL(string: baseURL)?
            .appendingPathComponent("3/trending/\(media)/day")
            .appending(queryItems:
                        [
                            URLQueryItem(name: "api_key", value: apiKey)
                        ]
            ) else {
            throw NetworkError.urlBuildFailed
        }
        
        print(fetchTitlesURL)
        let(data, urlResponse) = try await URLSession.shared.data(from: fetchTitlesURL)
        
        guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badURLResponse(underlyingError: NSError(
                domain: "DataFetcher",
                code: (urlResponse as? HTTPURLResponse)?.statusCode ?? -1,
                userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP Response"]))
        }
        
        let decorder = JSONDecoder()
        decorder.keyDecodingStrategy = .convertFromSnakeCase
        var titles = try decorder.decode(ApiObject.self, from: data).results
        Constants.addPosterPath(to: &titles)
        return titles
        
    }
    
    
}
