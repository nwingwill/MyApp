//
//  ResultDetailModel.swift
//  MyApp
//
//  Created by nwing on 21/10/22.
//

import Foundation

struct ResultDetailModel: Decodable {
    let adult: Bool
    let backdropPath: String
//    let belongsToCollection: BelongsToCollection
    let budget: Int
//    let genres: [Genre]
    let homepage: String
//    let id: Int
//    let imdbID: Int
    let originalLanguage: String
//    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
//    let productionCompanies: [ProductionCompany]
//    let productionCountries: [ProductionCountry]
    let releaseDate: String
//    let revenue: String
//    let runtime: Int
//    let spokenLanguages: [SpokenLanguage]
    let status: String
//    let tagline: String
    let title: String
//    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
//        case belongsToCollection = "belongs_to_collection"
        case budget
//        case genres
        case homepage
//        case id
//        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
//        case productionCompanies = "production_companies"
//        case productionCountries = "production_countries"
        case releaseDate = "release_date"
//        case revenue
//        case runtime
//        case spokenLanguages = "spoken_languages"
        case status
//        case tagline
        case title
//        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    enum MediaType: String, Codable {
        case movie = "movie"
        case tv = "tv"
    }
    
    enum OriginalLanguage: String, Codable {
        case en = "en"
        case ja = "ja"
        case pt = "pt"
    }
    
    
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Decodable {
    let id: Int
    let name, posterPath, backdropPath: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

// MARK: - Genre
struct Genre: Decodable {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Decodable {
    let id: Int
    let logoPath, name, originCountry: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Decodable {
    let iso3166_1, name: String
    
    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Decodable {
    let englishName, iso639_1, name: String
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}



extension ResultDetailModel: DisplayableProtocol {
    
    var itemImage: String {
        posterPath
    }
    
    var titleLabelText: String {
        title
    }
    
    var subtitleLabelText: String {
        overview
    }
    
    var item1: (label: String, value: String) {
        ("Popularity:", String(popularity))
    }
    
    var listTitle: String {
        originalLanguage
    }
    
    var listItems: [Int] {
        [0]
    }
    
    var idItem: String {
        status
    }
}
