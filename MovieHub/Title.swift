//
//  Title.swift
//  MovieHub
//
//  Created by Aditya Varshney on 13/02/26.
//

import Foundation


struct ApiObject: Decodable {
    var results: [Title] = []
}


struct Title: Decodable, Identifiable { //Decodable is for telling that title is coming from external source and Identifiable is for telling this has id
        var id: Int?
        var title: String?
        var name: String?
        var overview: String?
        var posterpath: String?
}
