//
//  DetailsViewModels.swift
//  MyApp
//
//  Created by nwing on 21/10/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class DetailsViewModels {
    
    var refreshData = {() -> () in }
    
    var debug = DebugManager(error: "", message: "")
    
    //    Fuente de datos (ARRAY)
    var itemsDetails : [DisplayableProtocol] = [] {
        didSet {
            refreshData()
        }
    }
    
    var resultsDetails : [ResultDetailModel] = [] {
        didSet {
            refreshData()
        }
    }
    
    func retriveDataDetails(endPoint: String, idMovie: String) {
        
        let parametersConfig = ParameterConfig()
        let languaje = LanguageModel()
        let url = "\(ConfigEnviroments.BASE_URL)\(endPoint)\(idMovie)\(parametersConfig.api_key)\(ConfigEnviroments.API_KEY)\(parametersConfig.language)\(languaje.englisUS)"
        
        let request = AF.request("\(url)")
        
        request.responseDecodable  (of: ResultDetailModel.self) { (response) in
            if response.error != nil {

                self.debug.debugMessage(error: "\(response.error?.errorDescription ?? "...") \(String(describing: response.error))", message: "Error en la consulta:")

                self.debug.debugMessage(error: url, message: "Revision Url:")
            }else{

                guard let resultsDetails = response.value else {return}
                
                
                
//                var jsonEncode = JSON(codingKey: "results")
                
//                self.resultsDetails = resultsDetails.self
//                self.itemsDetails = resultsDetails
                
                
                
                
//                dato.append(contentsOf: resultsDetails)
//                self.resultsDetails = resultsDetails
                
                let adult = resultsDetails.adult
                let backdropPath = resultsDetails.backdropPath
                let budget = resultsDetails.budget
                let homepage = resultsDetails.homepage
                let originalLanguage = resultsDetails.originalLanguage
                let overview = resultsDetails.overview
                let popularity = resultsDetails.popularity
                let posterPath = resultsDetails.posterPath
                let releaseDate = resultsDetails.releaseDate
                let status = resultsDetails.status
                let title = resultsDetails.title
                let voteAverage = resultsDetails.voteAverage
                let voteCount = resultsDetails.voteCount
                
                let items = ResultDetailModel(adult: adult, backdropPath: backdropPath, budget: budget, homepage: homepage, originalLanguage: originalLanguage, overview: overview, popularity: popularity, posterPath: posterPath, releaseDate: releaseDate, status: status, title: title, voteAverage: voteAverage, voteCount: voteCount)
                
                self.itemsDetails.append(items)
                print("Data result: \(self.itemsDetails)")
                
               //

//                for details in resultsDetails {
//                    let adult = details.adult
//                    let backdropPath = details.backdropPath
//                    let budget = details.budget
//                    let homepage = details.homepage
//                    let originalLanguage = details.originalLanguage
//                    let overview = details.overview
//                    let popularity = details.popularity
//                    let posterPath = details.posterPath
//                    let releaseDate = details.releaseDate
//                    let status = details.status
//                    let title = details.title
//                    let voteAverage = details.voteAverage
//                    let voteCount = details.voteCount
//
////                    dato.append(details)
////                    print("Datos: \(dato)")
//                }
////                    let items = ResultDetailModel(adult: adult, backdropPath: backdropPath, budget: budget, homepage: homepage, originalLanguage: originalLanguage, overview: overview, popularity: popularity, posterPath: posterPath, releaseDate: releaseDate, status: status, title: title, voteAverage: voteAverage, voteCount: voteCount)
//
////
////                    let items = dato.append(details)
//                    print("Resultado: \(details)")
//                }
                
//                self.itemsDetails = resultsDetails
//                let responseData = [Any]()
//
//                for dataItem in resultsDetails {
//                    responseData.append(dataItem)
//                }

//                self.resultsDetails = resultsDetails.
//                self.itemsDetails = resultsDetails.value
            }
            
        }
        
    }
    
}
