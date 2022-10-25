//
//  RequestServiceUrl.swift
//  MyApp
//
//  Created by nwing on 13/10/22.
//

import Foundation
import Alamofire


class RequestServiceUrl {
    
    //https://api.themoviedb.org/3/movie/now_playing?api_key=16dfbf948b4831d21068af2e750c66ee&language=en-US&page=1
    
////    var dataModel : [Array]()
////    var urlEndPon
//    var debugMessage = DebugManager(error: "", message: "")
////    var result : [AllResultModel] = []
    var endPoint = EndPoitModel()
    var parametersConfig = ParameterConfig()
    var languaje = LanguageModel()
//    
//    init(debugMessage: DebugManager = DebugManager(error: "", message: ""), endPoint: EndPoitModel = EndPoitModel(), parametersConfig: ParameterConfig = ParameterConfig(), languaje: LanguageModel = LanguageModel()) {
//        self.debugMessage = debugMessage
//        self.endPoint = endPoint
//        self.parametersConfig = parametersConfig
//        self.languaje = languaje
//    }
    
    var items : [DisplayableProtocol]
    var results : [ResultModel]
    
    init(items: [DisplayableProtocol], results : [ResultModel]) {
        self.items = items
        self.results = results
    }
    
    
    func retriveResultList()  {
        
        let debugMessage = DebugManager(error: "", message: "")
    //    var result : [AllResultModel] = []
        let endPoint = EndPoitModel()
        let parametersConfig = ParameterConfig()
        let languaje = LanguageModel()
        
//        let baseurl = ConfigEnviroments.BASE_URL
        let url = "\(ConfigEnviroments.BASE_URL)\(endPoint.nowPlayingEndpoint)\(parametersConfig.api_key)\(ConfigEnviroments.API_KEY)\(parametersConfig.language)\(languaje.englisUS)\(parametersConfig.page)1"
        
        debugMessage.debugMessage(error: "", message: "Prueba de clase request url: \(url)")
        let request = AF.request("\(url)")
        
        
        request.responseDecodable  (of: AllResultModel.self) { (response) in

            if response.error != nil {
                print("Error en la consulta: \(response.error?.errorDescription ?? "...")")
            }else{

                guard let results = response.value else {return}
                self.results = results.results
                self.items = results.results
//                print("results: \(results.results)")
//                print("Items: \(self.items.count)")
//                print("url endpoint: \(url)")

//                self.debugMessage.debugMessage(error: "", message: "Respuesta:\(results.totalPages)")
//                self.debugMessage.debugMessage(error: "", message: "url dos:\(url)")
//                print("url dos:\(url)")

            }

        }
    }
    
}
