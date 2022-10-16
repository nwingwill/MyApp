//
//  BotomElementModel.swift
//  MyApp
//
//  Created by nwing on 13/10/22.
//

import Foundation

struct BotomElementModel: Decodable {
    //    let dates: Date
    let page: Int
    let results: [ResultBotomModel]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        //        case dates
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
