//
//  AllResultModel.swift
//  MyApp
//
//  Created by nwing on 12/10/22.
//

import Foundation

// MARK: - Welcome
struct AllResultModel: Decodable {
    let dates: Dates
    let page: Int
    let results: [ResultModel]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case dates
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
