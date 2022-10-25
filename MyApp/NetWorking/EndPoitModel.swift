//
//  EndPoitModel.swift
//  MyApp
//
//  Created by nwing on 13/10/22.
//

import Foundation

struct EndPoitModel {
    
    let nowPlayingEndpoint: String = "/3/movie/now_playing"
    let popularEndpoint: String = "/3/movie/popular"
    let trendingEndPoint: String = "/3/trending/all/day"
    let detailEnpoint: String = "/3/movie/"

}

struct ParameterConfig {
    let api_key = "?api_key="
    let language = "&language="
    let page = "&page="
}

struct LanguageModel {
    let englisUS = "en-US"
}

