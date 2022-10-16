//
//  ArticlesEndpoint.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import Foundation

enum ArticlesEndpoint {
    case list
}

extension ArticlesEndpoint: EndpointProtocol {
     
    var url: URL {
        switch self {
        case .list:
            let path = "news/list"
            let params: [String: String?] = ["performanceId": Environment.rapidPerformanceID]
            return URL(string: Environment.rapidBaseURL + path + query(from: params))!
        }
    }
    
    var requestMethod: RequestMethod {
        switch self {
        case .list:
            return .get
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .list:
            let headers = [
                "X-RapidAPI-Key": Environment.rapidApiKey,
                "X-RapidAPI-Host": Environment.rapidApiHost
            ]
            return headers
        }
    }
}
