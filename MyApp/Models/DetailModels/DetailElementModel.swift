//
//  DetailElementModel.swift
//  MyApp
//
//  Created by nwing on 21/10/22.
//

import Foundation

struct DetailElementModel: Decodable {
//    let page: Int
    let results: [ResultDetailModel]
//    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case results
//      case page, results
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
    }
}
