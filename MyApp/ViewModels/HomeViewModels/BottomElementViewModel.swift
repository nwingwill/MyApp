//
//  BottomElementViewModel.swift
//  MyApp
//
//  Created by nwing on 13/10/22.
//

import Foundation
import Alamofire
import SDWebImage

class BottomElementViewModel {
    
    
    var refreshData = {() -> () in }
    
    var debug = DebugManager(error: "", message: "")
    
    //    Fuente de datos (ARRAY)
    var itemsBotom : [DisplayableProtocol] = [] {
        didSet {
            refreshData()
        }
    }
    
    var resultsBotom : [ResultBotomModel] = [] {
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
        
        
        request.responseDecodable  (of: BotomElementModel.self) { (response) in
            
            if response.error != nil {
                print("Error en la consulta: \(response.error?.errorDescription ?? "...")")
            }else{
                
                guard let resultsBotom = response.value else {return}
                self.resultsBotom = resultsBotom.results
                self.itemsBotom = resultsBotom.results
            }
            
        }
        
    }
    
}
