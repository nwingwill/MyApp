//
//  ResultModel.swift
//  MyApp
//
//  Created by nwing on 12/10/22.
//

import Foundation

struct ResultModel: Decodable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension ResultModel: DisplayableProtocol {
    var idItem: String {
        String(id)
    }
    
    var itemImage: String {
        (posterPath ?? "")
    }
    
    var titleLabelText: String {
        title
    }
    
    var subtitleLabelText: String {
        releaseDate
    }
    
    var item1: (label: String, value: String) {
        ("Popularity:", String(popularity))
    }
    
    var listTitle: String {
        overview
    }
    
    var listItems: [Int] {
        genreIDS
    }
}
