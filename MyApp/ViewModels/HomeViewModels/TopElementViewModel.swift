//
//  TopElementViewModel.swift
//  MyApp
//
//  Created by nwing on 13/10/22.
//

import Foundation
import Alamofire
import SDWebImage

class TopElementViewModel {
    
    
    var refreshData = {() -> () in }
    
    var debug = DebugManager(error: "", message: "")
    
    //    Fuente de datos (ARRAY)
    var itemsTop : [DisplayableProtocol] = [] {
        didSet {
            refreshData()
        }
    }
    
    var resultsTop : [ResultTopModel] = [] {
        didSet {
            refreshData()
        }
    }
    
    func retriveDataTopList(endPoint: String) {
        
        let parametersConfig = ParameterConfig()
        let languaje = LanguageModel()
        let url = "\(ConfigEnviroments.BASE_URL)\(endPoint)\(parametersConfig.api_key)\(ConfigEnviroments.API_KEY)\(parametersConfig.language)\(languaje.englisUS)\(parametersConfig.page)1"
        
        let request = AF.request("\(url)")
        
        request.responseDecodable  (of: TopElementsModels.self) { (response) in
            
            if response.error != nil {

                self.debug.debugMessage(error: "\(response.error?.errorDescription ?? "...") \(String(describing: response.error))", message: "Error en la consulta:")
                
                self.debug.debugMessage(error: url, message: "Revision Url:")
            }else{
                
                guard let resultsTop = response.value else {return}
                self.resultsTop = resultsTop.results
                self.itemsTop = resultsTop.results
            }
            
        }
        
    }
    
}
