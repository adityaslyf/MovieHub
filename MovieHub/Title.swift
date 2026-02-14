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
        var posterPath: String?
    
    static var previewTitles = [
        Title(
            id: 1,
            title: "The Lion King",
            name: "The Lion King",
            overview: "A young lion prince flees the dangers of Pride Rock to live as a lioness in the lush green plains of Africa.",
            posterPath: Constants.testTitleURL
        ),
        Title(
            id: 2,
            title: "The Amazing Spider-Man",
            name: "The Amazing Spider-Man",
            overview: "With the help of a mysterious ally, spider-man grapples with newfound responsibilities and uncovers his family's mysterious history.",
            posterPath: Constants.testTitleURL2
        ),
        Title(
            id: 3,
            title: "Spider-Man: No Way Home",
            name: "Spider-Man: No Way Home",
            overview: "When Peter Parker's parents are killed in a car crash, he is left to fend for himself in the criminal underworld of New York City.",
            posterPath: Constants.testTitleURL3
        )
    ]
}
