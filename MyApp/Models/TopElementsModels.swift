//
//  TopElementsModels.swift
//  MyApp
//
//  Created by nwing on 13/10/22.
//

import Foundation

struct TopElementsModels: Decodable {
    let page: Int
    let results: [ResultTopModel]
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
