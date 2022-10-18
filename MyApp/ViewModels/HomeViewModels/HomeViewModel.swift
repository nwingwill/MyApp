//
//  HomeViewModel.swift
//  MyApp
//
//  Created by nwing on 13/10/22.
//

import Foundation
import Alamofire
import SDWebImage

class HomeViewModel {
    
    var refreshData = {() -> () in }
    
    var debug = DebugManager(error: "", message: "")
    
    //    Fuente de datos (ARRAY)
    var items : [DisplayableProtocol] = [] {
        didSet {
            refreshData()
        }
    }
    
    var results : [ResultModel] = [] {
        didSet {
            refreshData()
        }
    }
    
    func retriveDataEndPoint(endPoint: String) {

        
//        let endPoint = EndPoitModel()
        let parametersConfig = ParameterConfig()
        let languaje = LanguageModel()
        let url = "\(ConfigEnviroments.BASE_URL)\(endPoint)\(parametersConfig.api_key)\(ConfigEnviroments.API_KEY)\(parametersConfig.language)\(languaje.englisUS)\(parametersConfig.page)1"
        
        print(" url original: \(url)")
        let request = AF.request("\(url)")


        request.responseDecodable  (of: AllResultModel.self) { (response) in

            if response.error != nil {
                print("Error en la consulta: \(response.error?.errorDescription ?? "...")")
            }else{

                guard let results = response.value else {return}
                self.results = results.results
                self.items = results.results
                print("results: \(results.results)")
                print("Items: \(self.items.count)")
                print("url endpoint: \(url)")
            }

        }
        
    }
    
    func retriveDataTopView() {

        
        let endPoint = EndPoitModel()
        let parametersConfig = ParameterConfig()
        let languaje = LanguageModel()
        let url = "\(ConfigEnviroments.BASE_URL)\(endPoint.trendingEndPoint)\(parametersConfig.api_key)\(ConfigEnviroments.API_KEY)\(parametersConfig.language)\(languaje.englisUS)\(parametersConfig.page)1"
        
        print(" url original: \(url)")
        let request = AF.request("\(url)")


        request.responseDecodable  (of: AllResultModel.self) { (response) in

            if response.error != nil {
                print("Error en la consulta: \(response.error?.errorDescription ?? "...")")
            }else{

                guard let results = response.value else {return}
                self.results = results.results
                self.items = results.results
                print("results: \(results.results)")
                print("Items: \(self.items.count)")
                print("url endpoint: \(url)")
            }

        }
        
    }
    
    func retriveDataBotonView() {

        
        let endPoint = EndPoitModel()
        let parametersConfig = ParameterConfig()
        let languaje = LanguageModel()
        let url = "\(ConfigEnviroments.BASE_URL)\(endPoint.popularEndpoint)\(parametersConfig.api_key)\(ConfigEnviroments.API_KEY)\(parametersConfig.language)\(languaje.englisUS)\(parametersConfig.page)1"
        
        print(" url original: \(url)")
        let request = AF.request("\(url)")


        request.responseDecodable  (of: AllResultModel.self) { (response) in

            if response.error != nil {
                print("Error en la consulta: \(response.error?.errorDescription ?? "...")")
            }else{

                guard let results = response.value else {return}
                self.results = results.results
                self.items = results.results
                print("results: \(results.results)")
                print("Items: \(self.items.count)")
                print("url endpoint: \(url)")
            }

        }
        
    }
    
}
    
    
